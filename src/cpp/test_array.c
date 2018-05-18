#include <stdio.h>
#include <stdlib.h>

typedef struct Node {
    int value;
    int digit[1];
} Node;

int main(int argc, char *argv[]) {
    int a[1];
    Node *n;
    int len = 100
    a[0] = 0;
    printf("%d\n", a[0]);
    // this code runs when compiled by gcc
    printf("%d\n", a[-1]);
    printf("%d\n", sizeof(Node));
    n = (Node *)malloc(sizeof(Node) + sizeof(int) * len);
    free(n);
    return 0;
}
