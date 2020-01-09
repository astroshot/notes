#include <stdio.h>
#include <fcntl.h>
#include <unistd.h>
#include <string.h>
#include <stdlib.h>
#include <sys/mman.h>

int main(void)
{
    int len, ret;
    char *p = NULL;
    int fd = open("mytest.txt", O_CREAT | O_RDWR, 0644);

    if (fd < 0)
    {
        printf("Open error!\n");
        return 1;
    }

    len = ftruncate(fd, 4);
    if (len == -1)
    {
        printf("ftruncate error!\n");
        return 1;
    }

    // map file to kernel
    p = mmap(NULL, 4, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
    if (p == MAP_FAILED)
    {
        printf("mmap error!\n");
        return 1;
    }
    strcpy(p, "abc");

    ret = munmap(p, 4);
    if (ret == -1)
    {
        printf("munmap error!\n");
        return 1;
    }
    close(fd);
    return 0;
}