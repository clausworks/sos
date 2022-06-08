#ifndef PROCH
#define PROCH

#include <stdint-gcc.h>
#include "interrupt.h"

typedef void (kproc_t)(void *);

/*
typedef struct {
   uint64_t rip;
   uint64_t cs;
   uint64_t rflags;
   uint64_t rsp;
   uint64_t ss;
} __attribute__((packed)) InterruptStack;
*/

typedef struct Process {
   struct Process *next;
   Context regs;
} Process;

/* System calls */
void yield(void);
void kexit(void);

/* Kernel functions */
void proc_yield(void);
void proc_kexit(int, int, void*);
void proc_run(void);
void proc_create_kthread(kproc_t entrypoint, void *arg);
void proc_reschedule(void);
void proc_init(void);

#endif
