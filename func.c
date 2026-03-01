#include <stdio.h>

int add(int a, int b) {
    int c = a + b;
    return c;
}

int multiply( int a, int b){
    int c = a * b;
    return c;
}

int compute(int a, int b) {
    int c = add(a, b);
    int d = multiply(a, b);
    return c + d;
}

int main() {
    int result = add(3,4);
    printf("%d\n", result);
    int result2 = multiply(3,4);
    printf("%d\n", result2);
    int result3 = compute(3,4);
    printf("%d\n", result3);
    return 0;
}
