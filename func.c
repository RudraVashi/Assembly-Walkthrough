#include <stdio.h>

int add(int a, int b) {
    int c = a + b;
    return c;
}

int main() {
    int result = add(3,4);
    printf("%d\n", result);
    return 0;
}
