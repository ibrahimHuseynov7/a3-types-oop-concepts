# Static, Stack and Heap Array Allocation

## Purpose

This program compares how long it takes to use a large array stored in three different kinds of memory:

**Static:** `static int arr[SIZE];` in `staticArray()`

**Stack:** `int arr[SIZE];` in `stackArray()`

**Heap:** `malloc` / `free` in `heapArray()`

Every function uses the same array of 100,000 integers (about 390 KB) and is called 100,000 times. The program prints the total time and the time per call for each function.

## How to run
It just requires to click run button and have C on your machine, no extra command needed
## Results

| Method | Total time | Time per call |
|--------|-----------:|--------------:|
| Static | 0.238 ms   | 2.38 ns       |
| Stack  | 0.351 ms   | 3.51 ns       |
| Heap   | 2.285 ms   | 22.85 ns      |

## Explanation

**Static** was the fastest. A static array is created only once, when the program starts. After that, every call reuses the same memory, so calling the function costs no allocation work.

**Stack** was almost as fast as static. Creating a stack array only means moving the stack pointer down when the function starts and back up when it returns. That takes about one instruction, so the cost per call is not big. The main limitation is that stack space is small (usually 1 to 8 MB), so a much larger array could cause a stack overflow.

**Heap** was the slowest, about 10 times slower than static. Every call runs `malloc` to find a free block of memory and `free` to give it back, and both functions do work inside the memory allocator. The heap is still useful, because it allows sizes chosen at runtime, memory that lasts after the function return, and much more space than the stack.

