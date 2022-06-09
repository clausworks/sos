#ifndef PROCH
#define PROCH

#include <stdint-gcc.h>

typedef struct {
   uint64_t rbp;
   uint64_t gs;
   uint64_t fs;
   uint64_t es;
   uint64_t ds;
   uint64_t r15;
   uint64_t r14;
   uint64_t r13;
   uint64_t r12;
   uint64_t r11;
   uint64_t r10;
   uint64_t r9;
   uint64_t r8;
   uint64_t rdx;
   uint64_t rcx;
   uint64_t rbx;
   uint64_t rax;
   uint64_t rsi;
   uint64_t rdi;
   uint64_t rip;
   uint64_t cs;
   uint64_t rflags;
   uint64_t rsp;
   uint64_t ss;
} __attribute__((packed)) Context;

typedef struct Process {
   int pid;
   Context regs;
   uint8_t *stack;
   struct Process *next;
   struct Process *prev;
} Process;

typedef void (*kproc_t)(void *);
typedef Process *(*scheduler_t)(Process **);

/* System calls */
void yield(void);
void kexit(void);

/* Kernel functions */
void proc_yield(void);
void proc_kexit(int, int, void*);
void proc_run(void);
Process *proc_create_kthread(kproc_t entrypoint, void *arg);
void proc_reschedule(void);
void proc_init(scheduler_t);

/* Testing */
void _test_proc_basic(void *);
void _test_proc_loop(void *);

/* Schedulers */
Process *round_robin(Process **);
Process *run_til_complete(Process **);

/* Saved contexts for common interrupt handler */
extern Process *cur_proc, *next_proc;

#endif
