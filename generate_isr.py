import sys

errcode_irq_nums = [8, 10, 11, 12, 13, 14, 17]
normal_irq_nums = [x for x in range(256) if x not in errcode_irq_nums]
orig_stdout = sys.stdout

with open('asm_isr.asm', 'w') as isrfile:
   sys.stdout = isrfile
   for x in range(256):
      print('extern handle_asm_irq');
      print(f'global isr{x}')

   for x in range(256):
      print('')
      print(f'''isr{x}:
; push argument registers
push rdi
push rsi''', end='');
      if x in errcode_irq_nums:
         print('''; save & remove error code from stack
mov rsi, [esp + 16]
mov rdi, [esp + 8]
mov [esp + 16], rdi
mov rdi, [esp]
mov [esp + 8], rdi
add esp, 8''', end='')
      print(f'''; push volatile registers
push rax
push rcx
push rdx
push r8
push r9
push r10
push r11
; load ISR number
mov rdi, {x}
; call C handler
call handle_asm_irq
; pop volatile registers
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
pop rax
; pop argument registers
pop rsi
pop rdi
; exit ISR
iretq''', end='')
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
