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


int array_sum(int *arr, int n) {
    int sum = 0;
    for (int i = 0; i < n; i++) sum += arr[i];
    return sum;
}

long factorial(int n) {
    long result = 1;
    for (int i = 2; i <= n; i++) result *= i;
    return result;
}

int loop_invariant(int *arr, int n, int a, int b) {
    int sum = 0;
    for (int i = 0; i < n; i++) sum += arr[i] + (a * b);
    return sum;
}

double dot_product(double *a, double *b, int n) {
    double result = 0.0;
    for (int i = 0; i < n; i++) result += a[i] * b[i];
    return result;
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

        int data[8] = {1, 2, 3, 4, 5, 6, 7, 8};
    double da[4] = {1.0, 2.0, 3.0, 4.0};
    double db[4] = {4.0, 3.0, 2.0, 1.0};
    volatile long lresult;
    volatile double dresult;

    start = clock();
    for (int i = 0; i < N; i++) result = array_sum(data, 8);
    end = clock();
    printf("array_sum()      time: %.4f seconds\n", (double)(end - start) / CLOCKS_PER_SEC);

    start = clock();
    for (int i = 0; i < N; i++) lresult = factorial(10);
    end = clock();
    printf("factorial()      time: %.4f seconds\n", (double)(end - start) / CLOCKS_PER_SEC);

    start = clock();
    for (int i = 0; i < N; i++) result = loop_invariant(data, 8, 3, 4);
    end = clock();
    printf("loop_invariant() time: %.4f seconds\n", (double)(end - start) / CLOCKS_PER_SEC);

    start = clock();
    for (int i = 0; i < N; i++) dresult = dot_product(da, db, 4);
    end = clock();
    printf("dot_product()    time: %.4f seconds\n", (double)(end - start) / CLOCKS_PER_SEC);

    return 0;
}