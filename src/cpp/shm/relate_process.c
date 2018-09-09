# include <sys/mman.h>
# include <sys/types.h>
# include <fcntl.h>
# include <unistd.h>
# include <stdio.h>
# include <stdlib.h>
# include <string.h>

typedef struct {
    char name[4];
    int age;
} people;

int main(int argc, char **argv) {
    int i;
    people *p_map;
    char temp;
    pid_t pid;

    // parent shares memory with child through anonymous share memory
    p_map = (people *)mmap(NULL, sizeof(people)*10, PROT_READ|PROT_WRITE, MAP_SHARED|MAP_ANONYMOUS, -1, 0);
    
    if ((pid = fork()) < 0) {
        printf("cannot fork!\n");
        return -1;
    } else if (pid == 0) { // child process
        sleep(2);
        for (i = 0; i < 5; i++) {
            printf("child read: age of the %d people %s is %d\n", i+1, (*(p_map+i)).name, (*(p_map+i)).age);
        }
        munmap(p_map, sizeof(people)*10); // share memory will end after process ends
    } else {
        temp = 'a';
        for (i = 0; i < 5; i++) {
            temp += 1;
            memcpy((*(p_map+i)).name, &temp, 1);
            (*(p_map+i)).age = 20 + i;
        }
        sleep(5);
        printf("parent read: the first people %s's age is %d\n", (*p_map).name, (*p_map).age);
        printf("umap\n");
        munmap(p_map, sizeof(people)*10);
        printf("umap ok\n");
    }
    return 0;
}
