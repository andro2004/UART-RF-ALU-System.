# Multi-Clock UART-Controlled Register File and ALU System

A UART-controlled digital system written in Verilog. A host sends commands over a serial link to write or read a 16 x 8 register file, or to run one of 16 ALU operations. Results return through a Gray-code asynchronous FIFO that bridges two unrelated clock domains.

The repository contains the RTL, a self-checking SystemVerilog testbench, ModelSim scripts, SpyGlass lint and CDC results, and a full design and verification report.

![status](https://img.shields.io/badge/testbench-17%2F17%20passing-brightgreen)
![lang](https://img.shields.io/badge/RTL-Verilog-blue)
![tool](https://img.shields.io/badge/sim-ModelSim%20%7C%20Icarus-orange)

---

## Table of contents

1. [Features](#features)
2. [Architecture](#architecture)
3. [Clocks and reset](#clocks-and-reset)
4. [Command protocol](#command-protocol)
5. [Register file map](#register-file-map)
6. [ALU functions](#alu-functions)
7. [Repository structure](#repository-structure)
8. [Running the simulation](#running-the-simulation)
9. [Verification results](#verification-results)
10. [Lint results](#lint-results)
11. [CDC results](#cdc-results)
12. [Known issues and future work](#known-issues-and-future-work)
13. [Author](#author)

---

## Features

- Serial command interface: 115200 baud, 8 data bits, even parity (configurable), 1 stop bit, LSB first.
- Four commands: register write, register read, ALU with operands, ALU with stored operands.
- 16 x 8-bit register file with dedicated registers for ALU operands, UART configuration and the TX clock divider.
- 16-function ALU (arithmetic, logic, comparison, shift) with a 16-bit result, running on a gated clock.
- Two clock domains bridged by a 16-deep, 8-bit asynchronous FIFO with Gray-coded pointers and two-flop synchronizers.
- UART receiver with 32x oversampling, 3-sample majority voting, and parity and stop-bit error flags.
- Reset synchronizers (asynchronous assert, synchronous release) in each domain.
- Programmable clock dividers and a latch-based clock gate.

## Architecture

```
            REF_CLK domain (50 MHz)                         UART_CLK domain (3.6864 MHz)

  RST_SYNC #1                                                   RX_IN --> UART_RX <-- RX_ClkDiv
                                                                            |
  RX_PDATA_SYNC <---------- RX data + valid (CDC) ---------------------------+
        |
        v
    SYS_CTRL  (command FSM)
     |    |    |
     |    |    +--> CLK_GATE --> ALU (gated clock)
     |    +-------> RegFile (REG0=A, REG1=B, REG2=UART cfg, REG3=TX divider)
     |
     v
  ASYNC_FIFO write side <---- Gray pointers (2-FF sync, CDC) ----> ASYNC_FIFO read side
                                                                         |
                                                       PULSE_GEN --> UART_TX --> TX_OUT, TX_OUT_V
                                                                         ^
                                                                    TX_ClkDiv
```

A cleaner block diagram is in the report (`docs/`).

### Module overview

| Module | File | Role |
|---|---|---|
| `SYS_TOP` | `RTL/Top/SYS_TOP.v` | Top level, connects all blocks |
| `SYS_CTRL` | `RTL/SYS_CTRL/SYS_CTRL.v` | Command decoder FSM (11 states), drives register file, ALU and FIFO |
| `RegFile` | `RTL/RegFile/RegFile.v` | 16 x 8-bit register file with four dedicated output registers |
| `ALU` | `RTL/ALU/ALU.v` | Synchronous 16-function ALU with status flags |
| `CLK_GATE` | `RTL/Clock_Gating/CLK_GATE.v` | Latch-based clock gate for the ALU clock |
| `UART_TOP`, `UART_TX`, `UART_RX` | `RTL/UART/` | Serial transmitter and receiver and their sub-blocks |
| `ASYNC_FIFO` | `RTL/ASYNC_FIFO/` | `FIFO_WR`, `FIFO_RD`, `FIFO_MEM_CNTRL`, `DF_SYNC`, `bin2gray`, `gray2bin` |
| `DATA_SYNC` | `RTL/DATA_SYNC/` | Enable synchronizer, pulse generator and bus capture register |
| `RST_SYNC` | `RTL/RST_SYNC/RST_SYNC.v` | Reset synchronizer |
| `ClkDiv`, `CLK_DIV_Counter` | `RTL/Clock_Divider/` | Programmable integer clock divider with bypass |
| `CLKDIV_MUX` | `RTL/CLKDIV_MUX/CLKDIV_MUX.v` | Maps the prescale field (32/16/8/4) to a divide ratio (1/2/4/8) |
| `PULSE_GEN` | `RTL/PULSE_GEN/PULSE_GEN.v` | Converts the `TX_OUT_V` level into a one-cycle FIFO read pulse |

### Top-level parameters

| Parameter | Default |
|---|---|
| `DATA_WIDTH` | 8 |
| `REG_FILE_DEPTH` | 16 |
| `FIFO_DEPTH` | 16 |
| `PRESCALE_WIDTH` | 6 |
| `RST_SYNC_STAGES` | 2 |
| `DATA_SYNC_STAGES` | 2 |

### Ports

| Port | Dir | Description |
|---|---|---|
| `REF_CLK` | in | System clock, 50 MHz |
| `UART_CLK` | in | UART reference clock, 3.6864 MHz |
| `RST` | in | Asynchronous active-low reset |
| `RX_IN` | in | UART receive line |
| `TX_OUT` | out | UART transmit line |
| `TX_OUT_V` | out | High while a frame is being transmitted |
| `RX_Parity_Error` | out | Parity error flag |
| `RX_Stop_Error` | out | Stop-bit error flag |

## Clocks and reset

| Clock | Frequency | Period | Notes |
|---|---|---|---|
| `REF_CLK` | 50 MHz | 20 ns | Controller, register file, ALU (gated), FIFO write side |
| `UART_CLK` | 3.6864 MHz | 271.267 ns | Source of `RX_CLK` and `TX_CLK` |
| `RX_CLK` | 3.6864 MHz | 271.267 ns | `UART_CLK` / 1 (prescale 32 = 32x oversampling) |
| `TX_CLK` | 115.2 kHz | 8680.544 ns | `UART_CLK` / `REG3` (reset value 32), one bit per clock |

One frame is 11 bit times (start, 8 data, parity, stop) = 95.486 us.

## Command protocol

All values are sent as UART frames. ALU results are returned as two bytes, **LSB first**.

| Command | Name | Frames sent | Response |
|---|---|---|---|
| `0xAA` | Register write | `[0xAA] [addr] [data]` | none |
| `0xBB` | Register read | `[0xBB] [addr]` | 1 byte |
| `0xCC` | ALU with operands | `[0xCC] [A] [B] [ALU_FUN]` | 2 bytes (LSB, MSB) |
| `0xDD` | ALU without operands | `[0xDD] [ALU_FUN]` | 2 bytes (LSB, MSB) |

Command `0xCC` writes the operands into `REG0` and `REG1`. Command `0xDD` uses the values already stored there.

Example: write `0xFF` to address `0x05`, then read it back.

```
TX: AA 05 FF      (write)
TX: BB 05         (read)
RX: FF
```

## Register file map

| Register | Reset | Function |
|---|---|---|
| `REG0` | `0x00` | ALU operand A |
| `REG1` | `0x00` | ALU operand B |
| `REG2` | `0x81` | UART config: bit 0 = `PAR_EN`, bit 1 = `PAR_TYP` (0 = even), bits 7:2 = RX prescale (`100000` = 32) |
| `REG3` | `0x20` | TX clock divider ratio (32 gives 115200 baud) |
| `REG4` - `REG15` | `0x00` | General purpose |

## ALU functions

| `ALU_FUN` | Operation | Result | `ALU_FUN` | Operation | Result |
|---|---|---|---|---|---|
| `0x0` | Add | `A + B` | `0x8` | XOR | `A ^ B` |
| `0x1` | Subtract | `A - B` | `0x9` | XNOR | `~(A ^ B)` |
| `0x2` | Multiply | `A * B` | `0xA` | Equal | `1` if `A == B` else `0` |
| `0x3` | Divide | `A / B` | `0xB` | Greater than | `2` if `A > B` else `0` |
| `0x4` | AND | `A & B` | `0xC` | Smaller than | `3` if `A < B` else `0` |
| `0x5` | OR | `A \| B` | `0xD` | Shift right | `A >> 1` |
| `0x6` | NAND | `~(A & B)` | `0xE` | Shift left | `A << 1` |
| `0x7` | NOR | `~(A \| B)` | `0xF` | No operation | `0` |

The result is 16 bits wide, so the inverting operations return `0xFFxx` style values (for example NAND of `0x02` and `0x05` gives `0xFFFF`).

## Repository structure

```
.
├── RTL/
│   ├── ALU/                ALU.v
│   ├── ASYNC_FIFO/         Async_FIFO, FIFO_WR, FIFO_RD, FIFO_MEM_CNTRL, DF_SYNC, bin2gray, gray2bin
│   ├── Clock_Divider/      ClkDiv, CLK_DIV_Counter
│   ├── Clock_Gating/       CLK_GATE
│   ├── CLKDIV_MUX/         CLKDIV_MUX
│   ├── DATA_SYNC/          DATA_SYNC, Sync_chain, Pulse_Gen
│   ├── PULSE_GEN/          PULSE_GEN
│   ├── RegFile/            RegFile
│   ├── RST_SYNC/           RST_SYNC
│   ├── SYS_CTRL/           SYS_CTRL
│   ├── Top/                SYS_TOP
│   └── UART/               UART_TOP, UART_TX/, UART_RX/
├── Simulation/
│   ├── Final_System_tb.sv  Self-checking testbench
│   ├── filelist.f          Compile order
│   ├── run.do              ModelSim run script
│   └── wave.do             Waveform setup
├── Lint/
│   ├── Lint_CDC_runs.prj   SpyGlass project
│   ├── all_errors_and_warnings.awl   Lint waivers
│   ├── CDC_Errors_and_Warnings.awl   CDC waivers
│   ├── moresimple.rpt      Lint summary
│   └── waiver.rpt          Waiver report
└── docs/
    ├── Final_System_Report.pdf       Full design and verification report
    └── simulation_log.txt            Testbench log
```

## Running the simulation

### ModelSim / QuestaSim

```bash
cd Simulation
vsim -c -do run.do          # batch mode
# or, in the GUI:
#   do run.do               # also loads wave.do
```

`run.do` creates the `work` library, compiles with `vlog -sv -f filelist.f`, starts `Final_System_tb`, loads the waveform setup and runs to completion.

### Icarus Verilog (open source)

The testbench declares default values on task ports, which Icarus cannot parse. Strip them from a copy of the testbench, then compile:

```bash
cd Simulation
# 1. Make a sim-only copy without task-port defaults
perl -pe 'if (/^\s*(input|output)\b/) { s/\s*=\s*[^,;]+//g }' Final_System_tb.sv > Final_System_tb_sim.sv

# 2. File list without the testbench line, and with the file name case fixed
grep -v 'Final_System_tb.sv' filelist.f | sed 's/Pulse_gen.v/Pulse_Gen.v/' > filelist_no_tb.f

# 3. Compile and run
iverilog -g2012 -s Final_System_tb -o sim.vvp -f filelist_no_tb.f Final_System_tb_sim.sv
vvp sim.vvp | tee sim_log.txt
```

The run takes well under a minute and finishes at about 10.28 ms of simulated time.

## Verification results

The testbench (`Final_System_tb`) acts as the UART host. It builds frames with parity, drives `RX_IN`, samples `TX_OUT`, and compares every response against a reference model.

- **Register write / read:** write `0xFF` to address `0x05`, read it back.
- **ALU:** all 16 function codes, plus the no-operand command.
- **Result:** `passed tests: 17`, `failed tests: 0`.
- **Frames:** all 67 frames sent to the design were accepted by the receiver.

| Test | A | B | `ALU_FUN` | Result |
|---|---|---|---|---|
| ADD | `0x05` | `0x03` | `0x0` | `0x0008` |
| SUB | `0x09` | `0x04` | `0x1` | `0x0005` |
| MUL | `0x02` | `0x05` | `0x2` | `0x000A` |
| DIV | `0x0F` | `0x03` | `0x3` | `0x0005` |
| AND | `0x05` | `0x03` | `0x4` | `0x0001` |
| OR | `0x09` | `0x04` | `0x5` | `0x000D` |
| NAND | `0x02` | `0x05` | `0x6` | `0xFFFF` |
| NOR | `0x0F` | `0x03` | `0x7` | `0xFFF0` |
| XOR | `0x02` | `0x05` | `0x8` | `0x0007` |
| XNOR | `0x0F` | `0x03` | `0x9` | `0xFFF3` |
| Equal | `0x05` | `0x03` | `0xA` | `0x0000` |
| Greater than | `0x09` | `0x04` | `0xB` | `0x0002` |
| Smaller than | `0x09` | `0x04` | `0xC` | `0x0000` |
| Shift right | `0x05` | `0x03` | `0xD` | `0x0002` |
| Shift left | `0x09` | `0x04` | `0xE` | `0x0012` |
| NOP | - | - | `0xF` | `0x0000` |

Waveform screenshots (ModelSim) and the complete log are in the report.

## Lint results

SpyGlass `SpyGlass_vL-2016.06`, goal `lint/lint_rtl`, top unit `SYS_TOP`.

| Metric | Value |
|---|---|
| Messages generated | 10 |
| Waived | 7 |
| Remaining | 3 (all Info) |

Waived items:

| Rule | Location | Reason |
|---|---|---|
| `W240` | `UART_RX/FSM.v` | Unused `edge_cnt` input |
| `W528` (x5) | `SYS_TOP.v` | ALU status flags not consumed at top level |
| `InferLatch` | `CLK_GATE.v` | Intentional latch for the clock gate |

## CDC results

SpyGlass CDC goals: `cdc/clock_reset_integrity`, `cdc/cdc_verify_struct`, `cdc/cdc_verify`.

Crossings in the design:

| Crossing | Structure |
|---|---|
| Received byte + valid (`UART_CLK` to `REF_CLK`) | Multi-flop synchronizer, pulse generator, bus captured on the pulse |
| FIFO write / read pointers | Gray code, registered, two-flop synchronizer |
| FIFO data | Memory read after the synchronized pointers allow it |
| Reset | `RST_SYNC`, two flops per domain |

The CDC waiver file records 7 waivers: 3 x `Ac_conv04` (FIFO memory to serializer), 3 x `Ac_conv02` (synchronizers converging on combinational logic), 1 x `Ac_conv01`. See the report for the discussion.

## Known issues and future work

- `RX_Parity_Error` and `RX_Stop_Error` pulse briefly (about half a bit time) on frames that are received correctly. The data path is not affected, but the flags should be qualified at the end of the frame before being used by a host.
- Testbench constants `SML` (`0x0B`) and `GRT` (`0x0C`) have swapped names relative to the ALU encoding. The checks themselves are correct.
- `Simulation/filelist.f` lists `Pulse_gen.v` but the file is `Pulse_Gen.v`, which fails on case-sensitive file systems.
- Not yet covered by the testbench: bad parity / stop bit injection, odd parity, other prescale values, FIFO-full back-pressure, back-to-back commands, reset during a transfer, divide by zero. No coverage metrics are collected.
- The `edge_cnt` input of the receive FSM and the ALU flag outputs at the top level are unused.
- The clock gate uses a behavioural latch; use the library ICG cell for synthesis.

## Author

**Andro Milad Ramzy Tadrous ElBana**
