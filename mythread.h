/*
 * swtest
 * Simple examples for understanding the usage of xv6 swtch
 * Copyright (C) 2017 Takuo Watanabe
 */

#include "context.h"
#include "swtch.h"

#define MAXTHREADS 256

enum state {
    MT_UNUSED,
    MT_EMBRYO,
    MT_RUNNING,
    MT_READY,
    MT_SLEEP
};

typedef struct mythread {
    enum state state;
    struct context *context;
} *mythread_t;

mythread_t new_thread(void (*)(int), int);
void start_threads();
void yield();
