
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define SIZE  100000   // we have number of integers that can be stored in our array
#define CALLS 100000   // how many times we will call function

int result; // we store our results here


// Our static array created once the program starts
void staticArray(void)
{
    static int arr[SIZE];
    arr[0] = 1;
    arr[SIZE - 1] = 2;
    result = arr[0] + arr[SIZE - 1];
}

// It will be stack array, and it will be created every time the function is called
void stackArray(void){
    int arrays[SIZE];
    arrays[0] = 1;
    arrays[SIZE-1] = 2;
    result = arrays[0] +arrays[SIZE-1];
}

int main(void)
{
    clock_t start, end; // from time library for tracking runtime of static array
    double staticTime;
    double stackTime;
    int i;

    printf("Array size: %d integers (%d KB)\n", SIZE, (int)(SIZE * sizeof(int) / 1024));
    printf("Our calls per function: %d\n\n", CALLS);

  
    // It is time for static array
    start = clock();
    for (i = 0; i < CALLS; i++)
        staticArray();
    end = clock();
    staticTime = (double)(end - start) / CLOCKS_PER_SEC * 1000; 

    // It is time for stack array, same just call stackArray() that I have
    start = clock();
    for (i = 0; i < CALLS; i++)
        stackArray();
    end = clock();
    stackTime = (double)(end - start) / CLOCKS_PER_SEC * 1000;

    // Used to print how many times and how much per call time is taken
    printf("Static: %.3f ms (%.2f ns/call)\n", staticTime, staticTime * 1000000 / CALLS);
    printf("Stack: %.3f ms (%.2f ns/call)\n", stackTime, stackTime * 1000000 / CALLS);
    return 0;
}