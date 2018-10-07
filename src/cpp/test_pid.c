# include <stdio.h>
# include <unistd.h>

int main() {
    pid_t a;
    pid_t b;
    a = getpid();
    b = getppid();
    printf("%d\n", a);
    return 0;
}

