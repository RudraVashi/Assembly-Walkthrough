#include <stdio.h>

double dot_product(double *a, double *b, int n) {
    double result = 0.0;
    for (int i = 0; i < n; i++) {
        result += a[i] * b[i];
    }
    return result;
}

double running_average(double *arr, int n) {
    double sum = 0.0;
    for (int i = 0; i < n; i++) {
        sum += arr[i];
    }
    return sum / n;
}

double euclidean_norm(double *arr, int n) {
    double sum = 0.0;
    for (int i = 0; i < n; i++) {
        sum += arr[i] * arr[i];
    }
    return __builtin_sqrt(sum);
}

double scale_accumulate(double *arr, int n, double scale, double offset) {
    double result = 0.0;
    for (int i = 0; i < n; i++) {
        result += arr[i] * scale + offset;
    }
    return result;
}

int main(void) {
    double a[4] = {1.0, 2.0, 3.0, 4.0};
    double b[4] = {4.0, 3.0, 2.0, 1.0};

    printf("dot_product:       %.2f\n", dot_product(a, b, 4));
    printf("running_average:   %.2f\n", running_average(a, 4));
    printf("euclidean_norm:    %.2f\n", euclidean_norm(a, 4));
    printf("scale_accumulate:  %.2f\n", scale_accumulate(a, 4, 2.0, 1.0));

    return 0;
}
