CC     = gcc
LEVELS = O0 O1 O2 O3

SOURCES = func loops float_ops
TIMER   = src/timer.c

all: assembly binaries

assembly:
	@echo "=== Generating assembly files ==="
	@for src in $(SOURCES); do \
		for level in $(LEVELS); do \
			echo "  Compiling src/$$src.c at -$$level ..."; \
			$(CC) -$$level -S -o assembly/$$level/$${src}_$$level.s src/$$src.c; \
		done; \
	done
	@echo "Done. Files written to assembly/O{0-3}/"

binaries:
	@echo "=== Compiling timer binaries ==="
	$(CC) -O0 -o performance/timer_O0 $(TIMER)
	$(CC) -O1 -o performance/timer_O1 $(TIMER)
	$(CC) -O2 -o performance/timer_O2 $(TIMER)
	$(CC) -O3 -o performance/timer_O3 $(TIMER)
	@echo "Done. Binaries written to performance/"

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

count:
	@echo "=== Instruction Counts ==="
	@chmod +x performance/count_instructions.sh
	@for src in $(SOURCES); do \
		echo ""; \
		echo "--- $$src ---"; \
		for level in $(LEVELS); do \
			./performance/count_instructions.sh assembly/$$level/$${src}_$$level.s; \
		done; \
	done

diff:
	@diff -u assembly/$(FROM)/$(SRC)_$(FROM).s assembly/$(TO)/$(SRC)_$(TO).s || true

registers:
	@echo "=== Register Usage: $(SRC) at -$(LEVEL) ==="
	@chmod +x performance/register_usage.sh
	@./performance/register_usage.sh assembly/$(LEVEL)/$(SRC)_$(LEVEL).s

registers-all:
	@chmod +x performance/register_usage.sh
	@for src in $(SOURCES); do \
		echo ""; \
		echo "=============================="; \
		echo " $$src"; \
		echo "=============================="; \
		for level in $(LEVELS); do \
			echo ""; \
			echo "  --- $$level ---"; \
			./performance/register_usage.sh assembly/$$level/$${src}_$$level.s; \
		done; \
	done

clean:
	@for level in $(LEVELS); do \
		rm -f assembly/$$level/*.s; \
	done
	rm -f performance/timer_O0 performance/timer_O1 \
	      performance/timer_O2 performance/timer_O3

.PHONY: all assembly binaries run count diff registers registers-all clean