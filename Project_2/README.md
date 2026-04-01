# Project 2 — Optimization & Performance Comparison

Builds on Project 1 by compiling the same C programs at different optimization
levels and comparing assembly output, instruction count, and runtime behavior.

## Folder Structure

```
Project_2/
├── src/
│   ├── func.c                  # Same program from Project 1
│   └── timer.c                 # Benchmarking wrapper (100M iterations)
├── assembly/
│   ├── O0/func_O0.s            # No optimization (baseline)
│   ├── O1/func_O1.s            # Basic optimizations
│   ├── O2/func_O2.s            # Aggressive optimizations
│   └── O3/func_O3.s            # Maximum optimizations
├── performance/
│   ├── count_instructions.sh   # Counts real instructions in a .s file
│   ├── timer_O0                # Compiled benchmark binary (O0)
│   ├── timer_O1                # Compiled benchmark binary (O1)
│   ├── timer_O2                # Compiled benchmark binary (O2)
│   └── timer_O3                # Compiled benchmark binary (O3)
├── analysis/                   # Written analysis docs go here
├── Makefile
└── README.md
```

## Usage

```bash
# Generate all assembly files + binaries
make

# Run all benchmarks
make run

# Count instructions across all optimization levels
make count

# Diff two levels (e.g. O0 vs O2)
make diff FROM=O0 TO=O2

# Clean all generated files
make clean
```

## Optimization Levels

| Flag | Description |
|------|-------------|
| -O0  | No optimization. Direct translation of C to assembly. Matches Project 1 output. |
| -O1  | Basic: removes redundant loads/stores, some dead code elimination. |
| -O2  | Aggressive: function inlining, instruction scheduling, loop optimizations. |
| -O3  | Maximum: loop unrolling, vectorization, aggressive inlining. |

## What to Look For

- Does O2/O3 **inline** `add()` and `multiply()` into `compute()`, removing `bl` calls?
- Are stack allocations for `c` and `d` eliminated in favor of keeping values in registers?
- Does the compiler **constant fold** `compute(3, 4)` in `main()` to a hardcoded value?
- How does instruction count change across levels?
- How does runtime change as optimization increases?
