#include <stdio.h>

int main() {
    int a = 1;
    int b = 3;
    int c = a + b;

    printf("The sum is: %d", &c);
    printf(a);
}
