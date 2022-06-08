#include "proc.h"
#include "kernel.h"
#include "interrupt.h"
#include "io.h"
#include <stdint-gcc.h>

void yield() {
   uint64_t call_num = SYSCALL_YIELD;
   asm volatile ("mov %0, %%r9" :: "dN"(call_num) :);
   asm volatile ("int $0x80");
}

void kexit() {
   asm volatile ("int $0x81");
}

void proc_init() {
   static Context cur_proc_default;
   register_syscall(SYSCALL_YIELD, (void *)proc_yield);
   irq_set_handler(TRAP_EXIT, proc_kexit, cur_proc);
   cur_proc = &cur_proc_default;
   next_proc = cur_proc;
}

void proc_yield() {
   printk("proc_yield\n");
}

void proc_kexit(int irq, int err, void *arg) {
   printk("proc_kexit\n");
}

void proc_run(void) {
}

void proc_create_kthread(kproc_t entrypoint, void *arg) {
}

void proc_reschedule(void) {
}
