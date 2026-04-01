CC     = gcc
SRC    = src/func.c
TIMER  = src/timer.c
LEVELS = O0 O1 O2 O3

# ── Default: build everything ────────────────────────────────────────────────
all: assembly binaries

# ── Generate assembly at all 4 optimization levels ───────────────────────────
assembly:
	@echo "=== Generating assembly files ==="
	$(CC) -O0 -S -o assembly/O0/func_O0.s $(SRC)
	$(CC) -O1 -S -o assembly/O1/func_O1.s $(SRC)
	$(CC) -O2 -S -o assembly/O2/func_O2.s $(SRC)
	$(CC) -O3 -S -o assembly/O3/func_O3.s $(SRC)
	@echo "Done. Files written to assembly/O{0-3}/"

# ── Compile timer binaries at all 4 optimization levels ──────────────────────
binaries:
	@echo "=== Compiling timer binaries ==="
	$(CC) -O0 -o performance/timer_O0 $(TIMER)
	$(CC) -O1 -o performance/timer_O1 $(TIMER)
	$(CC) -O2 -o performance/timer_O2 $(TIMER)
	$(CC) -O3 -o performance/timer_O3 $(TIMER)
	@echo "Done. Binaries written to performance/"

# ── Run all timers and print results side by side ────────────────────────────
run:
	@echo "=== Performance Results ==="
	@echo "--- O0 (no optimization) ---"
	@./performance/timer_O0
	@echo "--- O1 ---"
	@./performance/timer_O1
	@echo "--- O2 ---"
	@./performance/timer_O2
	@echo "--- O3 ---"
	@./performance/timer_O3

# ── Count instructions in each assembly file ─────────────────────────────────
count:
	@echo "=== Instruction Counts ==="
	@chmod +x performance/count_instructions.sh
	@for level in $(LEVELS); do \
		./performance/count_instructions.sh assembly/$$level/func_$$level.s; \
	done

# ── Diff two optimization levels (usage: make diff FROM=O0 TO=O2) ────────────
diff:
	@diff -u assembly/$(FROM)/func_$(FROM).s assembly/$(TO)/func_$(TO).s || true

# ── Remove all generated files ───────────────────────────────────────────────
clean:
	rm -f assembly/O0/*.s assembly/O1/*.s assembly/O2/*.s assembly/O3/*.s
	rm -f performance/timer_O0 performance/timer_O1 \
	      performance/timer_O2 performance/timer_O3

.PHONY: all assembly binaries run count diff clean
