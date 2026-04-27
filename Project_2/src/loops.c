#include <stdio.h>

int array_sum(int *arr, int n) {
    int sum = 0;
    for (int i = 0; i < n; i++) {
        sum += arr[i];
    }
    return sum;
}

long factorial(int n) {
    long result = 1;
    for (int i = 2; i <= n; i++) {
        result *= i;
    }
    return result;
}

int loop_invariant(int *arr, int n, int a, int b) {
    int sum = 0;
    for (int i = 0; i < n; i++) {
        sum += arr[i] + (a * b);
    }
    return sum;
}

int linear_search(int *arr, int n, int target) {
    for (int i = 0; i < n; i++) {
        if (arr[i] == target) return i;
    }
    return -1;
}

int main(void) {
    int data[8] = {1, 2, 3, 4, 5, 6, 7, 8};

    printf("array_sum:      %d\n", array_sum(data, 8));
    printf("factorial(10):  %ld\n", factorial(10));
    printf("loop_invariant: %d\n", loop_invariant(data, 8, 3, 4));
    printf("linear_search:  %d\n", linear_search(data, 8, 6));

    return 0;
}
