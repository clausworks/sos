#include "proc.h"
#include "kernel.h"
#include "interrupt.h"
#include "io.h"
#include "memalloc.h"
#include "kmalloc.h"
#include "memory.h"
#include <stdint-gcc.h>

static scheduler_t scheduler;
Process *next_proc = 0;
Process *cur_proc = 0;
Process *head_proc = NULL;
Process kmain_proc = {0};

/* Advance head process and return it */
Process *round_robin(Process **head) {
   Process *next = *head;
   *head = (*head)->next;
   return next;
}

/* Return head process (unchanged) */
Process *run_til_complete(Process **head) {
   //printk("run_til_complete: next = %d\n", (*head)->pid);
   return *head;
}

/* Ensure thread exits cleanly (even if user doesn't */
void entrypoint_wrapper(kproc_t entrypoint, void *arg) {
   entrypoint(arg);
   //printk("entrypoint returned; backup kexit\n");
   kexit();
}

void yield() {
   uint64_t call_num = SYSCALL_YIELD;
   asm volatile ("mov %0, %%r9" :: "dN"(call_num) :);
   asm volatile ("int $0x80");
}

void kexit() {
   asm volatile ("int $0x81");
}

void proc_init(scheduler_t sched) {
   register_syscall(SYSCALL_YIELD, (void *)proc_reschedule);
   irq_set_handler(TRAP_EXIT, proc_kexit, cur_proc);
   cur_proc = &kmain_proc; /* context filled on first interrupt */
   next_proc = cur_proc;
   scheduler = sched;
}

void proc_kexit(int irq, int err, void *arg) {
   CLI_COND;
   //printk("kexit: %d\n", cur_proc->pid);
   /* Reassign head if exiting process is the head */
   if (head_proc == cur_proc) {
      head_proc = cur_proc->next;
   }
   /* Check if there's another process */
   if (cur_proc->prev != cur_proc) {
      cur_proc->next->prev = cur_proc->prev;
      cur_proc->prev->next = cur_proc->next;
   }
   else {
      /* Removing last process */
      head_proc = NULL;
   }

   /* Free cur_proc */
   mmu_free_stack(cur_proc->stack);
   kfree(cur_proc);

   /* Set next_proc */
   proc_reschedule();
   STI_COND;
}

void proc_run(void) {
   /* make sure this can run repeatedly after halt then interrupt */
   //printk("proc_run\n");
   yield();
}

Process *proc_create_kthread(kproc_t entrypoint, void *arg) {
   static uint64_t pid = 1; /* kmain gets pid=0 */
   Process *new_proc = kmalloc(sizeof(Process));
   memset(new_proc, 0, sizeof(Process));
   new_proc->pid = pid++;
   new_proc->stack = mmu_alloc_stack();

   CLI_COND;
   if (head_proc == NULL) {
      head_proc = new_proc;
      new_proc->next = new_proc;
      new_proc->prev = new_proc;
   }
   else {
      /* Add new process to tail */
      new_proc->next = head_proc;
      new_proc->prev = head_proc->prev;
      head_proc->prev = new_proc;
      new_proc->prev->next = new_proc;
   }
   new_proc->regs.rip = (uint64_t)entrypoint_wrapper;
   new_proc->regs.cs = CODE_SEG_SELECTOR;
   new_proc->regs.rsp = (uint64_t)new_proc->stack;
   new_proc->regs.ss = 0;
   new_proc->regs.rdi = (uint64_t)entrypoint;
   new_proc->regs.rsi = (uint64_t)arg;
   new_proc->regs.rflags = 0;
   new_proc->regs.rflags |= (RFLAGS_IF | RFLAGS_ONE);
   //printk("create_kthread: %d\n", new_proc->pid);
   STI_COND;
   return new_proc;
}

void proc_reschedule() {
   CLI_COND;
   if (head_proc != NULL) {
      next_proc = scheduler(&head_proc);
      //printk("proc_reschedule: %d\n", next_proc->pid);
   }
   else {
      next_proc = &kmain_proc;
      //printk("proc_reschedule: kmain (%d)\n", next_proc->pid);
   }
   STI_COND;
}

void _test_proc_basic(void *arg) {
   printk("It works!\n");
}

void _test_proc_loop(void *arg) {
   int i, j;
   for (i = 0; i < 5; ++i) {
      for (j = 0; j < cur_proc->pid; ++j) {
         printk("...");
      }
      printk("%d\n", i);
      yield();
   }
}
