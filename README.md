# Digital IC RTL Practice

This repository is Lucas's independent RTL practice workspace for Digital IC / RTL design preparation.

It is intentionally separated from USC course files and private resume evidence. Public code in this repository should be independently written practice RTL, self-checking testbenches, and safe study notes only.

## Current Modules

| Module | RTL | Testbench | Status |
| --- | --- | --- | --- |
| 2-to-1 mux | `rtl/mux2.v` | `tb/tb_mux2.v` | RTL, TB, simulation, waveform review complete |
| 4-to-1 mux | `rtl/mux4.v` | `tb/tb_mux4.v` | RTL, TB, Icarus simulation, GTKWave review complete |

## Recommended Flow

For each module:

1. Write synthesizable RTL.
2. Write a self-checking testbench.
3. Run simulation.
4. Inspect waveform for key signal behavior.
5. Record design notes, common mistakes, and interview answers.

## Run With OSS CAD Suite

PowerShell setup:

```powershell
$env:PATH = 'D:\Tools\oss-cad-suite\bin;D:\Tools\oss-cad-suite\lib;' + $env:PATH
```

Run `mux4`:

```powershell
iverilog -Wall -o sim\mux4\tb_mux4.vvp rtl\mux4.v tb\tb_mux4.v
vvp sim\mux4\tb_mux4.vvp
gtkwave sim\mux4\mux4.vcd
```

Expected simulation result:

```text
PASS
```

## Learning Notes

Main review notes are kept in:

```text
notes/module_project_review.md
```

Each completed module should include:

- hardware principle
- RTL implementation points
- verification plan
- waveform inspection points
- common mistakes
- interview questions and answer templates

## Public Repository Policy

Do not upload course-provided code, testbenches, handouts, PDFs, EDA databases, private server files, credentials, or personal resume evidence.

Public uploads should contain only clean independent practice work.
