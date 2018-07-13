#include <stdio.h>

int expose();

int foo(int hide) {
    return expose();
}

int main() {
    int ret = foo(2333);
    printf("%d", ret);
}
