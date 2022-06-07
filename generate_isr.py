import sys

errcode_irq_nums = [8, 10, 11, 12, 13, 14, 17]
normal_irq_nums = [x for x in range(256) if x not in errcode_irq_nums]
orig_stdout = sys.stdout

with open('asm_isr.asm', 'w') as isrfile:
   sys.stdout = isrfile
   print('extern handle_asm_irq')
   for x in range(256):
      print(f'global isr{x}')
   '''
   print('\nextern cur_proc')
   print('extern cur_proc_ptr')
   print('extern next_proc')
   print('extern next_proc_ptr')
   print(common_pre_str);
   print(common_post_str);
   '''
   print()

   for x in range(256):
      print()
      print(f'''isr{x}:
; push registers
push rax
push rbx
push rcx
push rdx
push rdi
push rsi
push r8
push r9
push r10
push r11
push r12
push r13
push r14
push r15
mov rax, ds
push rax
mov rax, es
push rax
push fs
push gs
push rbp
; base of context struct
mov rdx, rsp''');
      if x in errcode_irq_nums:
         print('''; save & remove error code from stack
mov rsi, [rsp + 16]
mov rdi, [rsp + 8]
mov [rsp + 16], rdi
mov rdi, [rsp]
mov [rsp + 8], rdi
add rsp, 8''')
      print(f'''
; load ISR number
mov rdi, {x}
; call C handler
call handle_asm_irq
; pop registers
pop rbp
pop gs
pop fs
pop rax
mov es, rax
pop rax
mov ds, rax
pop r15
pop r14
pop r13
pop r12
pop r11
pop r10
pop r9
pop r8
pop rsi
pop rdi
pop rdx
pop rcx
pop rbx
pop rax
; exit ISR
iretq''')
      print('\n\n')

with open('isr.c', 'w') as isrfile:
   sys.stdout = isrfile
   print('#include "isr.h"')
   print('#include "interrupt.h"')
   print()
   print('asm_isr_t asm_isr_offsets[] = {')
   print(*[f'\tisr{x}' for x in range(256)], sep=',\n')
   print('};')

with open('isr.h', 'w') as isrfile:
   sys.stdout = isrfile
   print('#ifndef ISRH')
   print('#define ISRH\n')
   print('#include "interrupt.h"')
   print('typedef void (*asm_isr_t)(void);')
   print('extern asm_isr_t asm_isr_offsets[IDT_NUM_ENTRIES];')
   for x in range(256):
      print(f'extern void isr{x}(void);')
   print('\n#endif')

sys.stdout = orig_stdout






#############################################################################

'''; push volatile registers
push rax
push rcx
push rdx
push r8
push r9
push r10
push r11
'''

common_pre_str = '''
save_context:
   mov [cur_proc], rax
   mov rax, [cur_proc_ptr] ; pointer into struct
   mov [rax], rbx
   add rax, 8
   mov [rax], rax
   add rax, 8
   mov [rax], rbx
   add rax, 8
   mov [rax], rcx
   add rax, 8
   mov [rax], rdx
   add rax, 8
   mov [rax], r8
   add rax, 8
   mov [rax], r9
   add rax, 8
   mov [rax], r10
   add rax, 8
   mov [rax], r11
   add rax, 8
   mov [rax], r12
   add rax, 8
   mov [rax], r13
   add rax, 8
   mov [rax], r14
   add rax, 8
   mov [rax], r15
   add rax, 8
   mov [rax], ds
   add rax, 8
   mov [rax], es
   add rax, 8
   mov [rax], fs
   add rax, 8
   mov [rax], gs
   add rax, 8
   mov [rax], rbp
   ; STACK: note ret addr is on bottom
   add rax, 8
   mov rbx, [rsp + 8] ; rsi
   mov [rax], rbx
   add rax, 8
   mov rbx, [rsp + 16] ; rdi
   mov [rax], rbx
   add rax, 8
   mov rbx, [rsp + 24] ; rip
   mov [rax], rbx
   add rax, 8
   mov rbx, [rsp + 32] ; cs
   mov [rax], rbx
   add rax, 8
   mov rbx, [rsp + 40] ; rflags
   mov [rax], rbx
   add rax, 8
   mov rbx, [rsp + 48] ; rsp 
   mov [rax], rbx 
   add rax, 8
   mov rbx, [rsp + 56] ; ss
   mov [rax], rbx
ret\n
'''

'''; pop volatile registers
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
pop rax
'''

common_post_str = '''
restore_context:
   ; set cur_proc = next_proc (no effect if they're the same)
   mov rax, [next_proc_ptr]
   mov [cur_proc_ptr], rax
   ; skip rax, rbx for now
   add rax, 16
   mov rcx, [rax]
	add rax, 8
   mov rdx, [rax]
	add rax, 8
   mov rdi, [rax]
	add rax, 8
   mov rsi, [rax]
	add rax, 8
   mov r8, [rax]
	add rax, 8
   mov r9, [rax]
	add rax, 8
   mov r10, [rax]
	add rax, 8
   mov r11, [rax]
	add rax, 8
   mov r12, [rax]
	add rax, 8
   mov r13, [rax]
	add rax, 8
   mov r14, [rax]
	add rax, 8
   mov r15, [rax]
	add rax, 8
   mov ds, [rax]
	add rax, 8
   mov es, [rax]
	add rax, 8
   mov fs, [rax]
	add rax, 8
   mov gs, [rax]
	add rax, 8
   mov rbp, [rax]
   ; STACK
   add rax, 8
   mov rbx, [rax]
   mov [rsp + 8], rbx ; rsi
   add rax, 8
   mov rbx, [rax]
   mov [rsp + 16], rbx ; rdi
   add rax, 8
   mov rbx, [rax]
   mov [rsp + 24], rbx ; rip
   add rax, 8
   mov rbx, [rax]
   mov [rsp + 32], rbx ; cs
   add rax, 8
   mov rbx, [rax]
   mov [rsp + 40], rbx ; rflags
   add rax, 8
   mov rbx, [rax]
   mov [rsp + 48], rbx ; rsp
   add rax, 8
   mov rbx, [rax]
   mov [rsp + 56], rbx ; ss
   ; Restore temporaries
   mov rax, [cur_proc]
   mov rbx, [cur_proc + 8]
ret\n
'''
