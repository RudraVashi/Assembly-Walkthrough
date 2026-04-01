#include <stdio.h>
#include <time.h>

int add(int a, int b) {
    int c = a + b;
    return c;
}

int multiply(int a, int b) {
    int c = a * b;
    return c;
}

int compute(int a, int b) {
    int c = add(a, b);
    int d = multiply(a, b);
    return c + d;
}

int main() {
    clock_t start, end;
    volatile int result;
    int N = 100000000;

    start = clock();
    for (int i = 0; i < N; i++) result = add(3, 4);
    end = clock();
    printf("add()      time: %.4f seconds\n", (double)(end - start) / CLOCKS_PER_SEC);

    start = clock();
    for (int i = 0; i < N; i++) result = multiply(3, 4);
    end = clock();
    printf("multiply() time: %.4f seconds\n", (double)(end - start) / CLOCKS_PER_SEC);

    start = clock();
    for (int i = 0; i < N; i++) result = compute(3, 4);
    end = clock();
    printf("compute()  time: %.4f seconds\n", (double)(end - start) / CLOCKS_PER_SEC);

    return 0;
}