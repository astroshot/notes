#include <stdlib.h>
#include <stdio.h>

int main(void) {
    int *array;
    int i;
    unsigned int size = 10;

    array = (int *)calloc(size, sizeof(int));
    for(i = 0; i < size; i++) {
        printf("%d ", array[i]);
    }
    printf("\nfinished!\n");
    // Danger! 
    printf("%d\n", array[size]);
    
    free(array);
    return 0;
}
