#include "proc.h"
#include "kernel.h"
#include "interrupt.h"
#include "io.h"
#include <stdint-gcc.h>

static scheduler_t scheduler;
Process *next_proc = 0;
Process *cur_proc = 0;
Process *head_proc = NULL;
Process proc_kmain = {0};

Process *round_robin(Process *head) {
   return NULL;
}

Process *run_til_complete(Process *head) {
   return head;
}

void yield() {
   uint64_t call_num = SYSCALL_YIELD;
   asm volatile ("mov %0, %%r9" :: "dN"(call_num) :);
   asm volatile ("int $0x80");
}

void kexit() {
   asm volatile ("int $0x81");
}

void proc_init() {
   register_syscall(SYSCALL_YIELD, (void *)proc_reschedule);
   irq_set_handler(TRAP_EXIT, proc_kexit, cur_proc);
   cur_proc = &proc_kmain;
   next_proc = cur_proc;
   scheduler = run_til_complete;
}

void proc_kexit(int irq, int err, void *arg) {
   mmu_free_stack(cur_proc->stack);
   if (cur_proc->prev != cur_proc) {
      cur_proc->next->prev = cur_proc->prev;
      cur_proc->prev->next = cur_proc->next;
   }
   kfree(cur_proc);
   proc_reschedule();
}

void proc_run(void) {
   proc_reschedule();
}

void proc_create_kthread(kproc_t entrypoint, void *arg) {
   static uint64_t pid = 0;
   Process *new_proc = kmalloc(sizeof(Process));
   memset(head_proc, 0, sizeof(Process));
   new_proc->pid = pid++;
   new_proc->stack = mmu_alloc_stack();

   if (head_proc == NULL) {
      head_proc = new_proc;
   }
   else {
      /* Add new process to head */
      new_proc->next = head_proc;
      new_proc->prev = head_proc->prev;
      head_proc->prev = new_proc;
      new_proc->prev->next = new_proc;
   }
   new_proc->regs.rsp = (uint64_t)entrypoint;
   new_proc->regs.rdi = (uint64_t)arg;
   /* FIXME: what about the other interrupt stack values? */
   /* FIXME: should stack pointer begin by pointing at first available word? */
   memcpy(new_proc->stack - sizeof(Context) + sizeof(uint64_t));
}

void proc_reschedule() {
   static Process *head;
   if (head != NULL) {
      next_proc = scheduler(head);
   }
   else {
      next_proc = &proc_kmain;
   }
}
