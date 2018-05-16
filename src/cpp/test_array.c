# include <stdio.h>

int main(int argc, char *argv[]) {
    int a[1];
    a[0] = 0;
    printf("%d\n", a[0]);
    // this code runs when compiled by gcc
    printf("%d\n", a[-1]);
    return 0;
}
