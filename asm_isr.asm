extern handle_asm_irq
global isr0
global isr1
global isr2
global isr3
global isr4
global isr5
global isr6
global isr7
global isr8
global isr9
global isr10
global isr11
global isr12
global isr13
global isr14
global isr15
global isr16
global isr17
global isr18
global isr19
global isr20
global isr21
global isr22
global isr23
global isr24
global isr25
global isr26
global isr27
global isr28
global isr29
global isr30
global isr31
global isr32
global isr33
global isr34
global isr35
global isr36
global isr37
global isr38
global isr39
global isr40
global isr41
global isr42
global isr43
global isr44
global isr45
global isr46
global isr47
global isr48
global isr49
global isr50
global isr51
global isr52
global isr53
global isr54
global isr55
global isr56
global isr57
global isr58
global isr59
global isr60
global isr61
global isr62
global isr63
global isr64
global isr65
global isr66
global isr67
global isr68
global isr69
global isr70
global isr71
global isr72
global isr73
global isr74
global isr75
global isr76
global isr77
global isr78
global isr79
global isr80
global isr81
global isr82
global isr83
global isr84
global isr85
global isr86
global isr87
global isr88
global isr89
global isr90
global isr91
global isr92
global isr93
global isr94
global isr95
global isr96
global isr97
global isr98
global isr99
global isr100
global isr101
global isr102
global isr103
global isr104
global isr105
global isr106
global isr107
global isr108
global isr109
global isr110
global isr111
global isr112
global isr113
global isr114
global isr115
global isr116
global isr117
global isr118
global isr119
global isr120
global isr121
global isr122
global isr123
global isr124
global isr125
global isr126
global isr127
global isr128
global isr129
global isr130
global isr131
global isr132
global isr133
global isr134
global isr135
global isr136
global isr137
global isr138
global isr139
global isr140
global isr141
global isr142
global isr143
global isr144
global isr145
global isr146
global isr147
global isr148
global isr149
global isr150
global isr151
global isr152
global isr153
global isr154
global isr155
global isr156
global isr157
global isr158
global isr159
global isr160
global isr161
global isr162
global isr163
global isr164
global isr165
global isr166
global isr167
global isr168
global isr169
global isr170
global isr171
global isr172
global isr173
global isr174
global isr175
global isr176
global isr177
global isr178
global isr179
global isr180
global isr181
global isr182
global isr183
global isr184
global isr185
global isr186
global isr187
global isr188
global isr189
global isr190
global isr191
global isr192
global isr193
global isr194
global isr195
global isr196
global isr197
global isr198
global isr199
global isr200
global isr201
global isr202
global isr203
global isr204
global isr205
global isr206
global isr207
global isr208
global isr209
global isr210
global isr211
global isr212
global isr213
global isr214
global isr215
global isr216
global isr217
global isr218
global isr219
global isr220
global isr221
global isr222
global isr223
global isr224
global isr225
global isr226
global isr227
global isr228
global isr229
global isr230
global isr231
global isr232
global isr233
global isr234
global isr235
global isr236
global isr237
global isr238
global isr239
global isr240
global isr241
global isr242
global isr243
global isr244
global isr245
global isr246
global isr247
global isr248
global isr249
global isr250
global isr251
global isr252
global isr253
global isr254
global isr255


isr0:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 0
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr1:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 1
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr2:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 2
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr3:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 3
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr4:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 4
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr5:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 5
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr6:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 6
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr7:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 7
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr8:
; push registers
push rdi
push rsi

; save & remove error code from stack
mov rsi, [rsp + 16]
mov rdi, [rsp + 8]
mov [rsp + 16], rdi
mov rdi, [rsp]
mov [rsp + 8], rdi
add rsp, 8

push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 8
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr9:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 9
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr10:
; push registers
push rdi
push rsi

; save & remove error code from stack
mov rsi, [rsp + 16]
mov rdi, [rsp + 8]
mov [rsp + 16], rdi
mov rdi, [rsp]
mov [rsp + 8], rdi
add rsp, 8

push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 10
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr11:
; push registers
push rdi
push rsi

; save & remove error code from stack
mov rsi, [rsp + 16]
mov rdi, [rsp + 8]
mov [rsp + 16], rdi
mov rdi, [rsp]
mov [rsp + 8], rdi
add rsp, 8

push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 11
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr12:
; push registers
push rdi
push rsi

; save & remove error code from stack
mov rsi, [rsp + 16]
mov rdi, [rsp + 8]
mov [rsp + 16], rdi
mov rdi, [rsp]
mov [rsp + 8], rdi
add rsp, 8

push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 12
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr13:
; push registers
push rdi
push rsi

; save & remove error code from stack
mov rsi, [rsp + 16]
mov rdi, [rsp + 8]
mov [rsp + 16], rdi
mov rdi, [rsp]
mov [rsp + 8], rdi
add rsp, 8

push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 13
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr14:
; push registers
push rdi
push rsi

; save & remove error code from stack
mov rsi, [rsp + 16]
mov rdi, [rsp + 8]
mov [rsp + 16], rdi
mov rdi, [rsp]
mov [rsp + 8], rdi
add rsp, 8

push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 14
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr15:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 15
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr16:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 16
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr17:
; push registers
push rdi
push rsi

; save & remove error code from stack
mov rsi, [rsp + 16]
mov rdi, [rsp + 8]
mov [rsp + 16], rdi
mov rdi, [rsp]
mov [rsp + 8], rdi
add rsp, 8

push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 17
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr18:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 18
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr19:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 19
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr20:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 20
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr21:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 21
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr22:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 22
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr23:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 23
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr24:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 24
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr25:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 25
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr26:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 26
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr27:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 27
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr28:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 28
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr29:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 29
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr30:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 30
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr31:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 31
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr32:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 32
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr33:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 33
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr34:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 34
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr35:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 35
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr36:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 36
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr37:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 37
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr38:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 38
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr39:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 39
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr40:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 40
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr41:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 41
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr42:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 42
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr43:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 43
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr44:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 44
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr45:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 45
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr46:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 46
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr47:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 47
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr48:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 48
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr49:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 49
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr50:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 50
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr51:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 51
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr52:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 52
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr53:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 53
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr54:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 54
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr55:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 55
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr56:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 56
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr57:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 57
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr58:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 58
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr59:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 59
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr60:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 60
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr61:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 61
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr62:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 62
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr63:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 63
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr64:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 64
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr65:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 65
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr66:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 66
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr67:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 67
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr68:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 68
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr69:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 69
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr70:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 70
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr71:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 71
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr72:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 72
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr73:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 73
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr74:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 74
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr75:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 75
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr76:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 76
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr77:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 77
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr78:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 78
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr79:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 79
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr80:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 80
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr81:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 81
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr82:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 82
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr83:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 83
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr84:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 84
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr85:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 85
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr86:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 86
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr87:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 87
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr88:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 88
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr89:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 89
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr90:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 90
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr91:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 91
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr92:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 92
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr93:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 93
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr94:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 94
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr95:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 95
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr96:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 96
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr97:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 97
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr98:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 98
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr99:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 99
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr100:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 100
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr101:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 101
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr102:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 102
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr103:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 103
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr104:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 104
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr105:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 105
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr106:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 106
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr107:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 107
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr108:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 108
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr109:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 109
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr110:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 110
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr111:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 111
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr112:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 112
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr113:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 113
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr114:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 114
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr115:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 115
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr116:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 116
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr117:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 117
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr118:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 118
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr119:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 119
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr120:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 120
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr121:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 121
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr122:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 122
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr123:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 123
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr124:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 124
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr125:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 125
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr126:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 126
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr127:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 127
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr128:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 128
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr129:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 129
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr130:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 130
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr131:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 131
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr132:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 132
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr133:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 133
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr134:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 134
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr135:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 135
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr136:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 136
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr137:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 137
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr138:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 138
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr139:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 139
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr140:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 140
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr141:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 141
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr142:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 142
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr143:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 143
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr144:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 144
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr145:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 145
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr146:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 146
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr147:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 147
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr148:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 148
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr149:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 149
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr150:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 150
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr151:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 151
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr152:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 152
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr153:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 153
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr154:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 154
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr155:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 155
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr156:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 156
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr157:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 157
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr158:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 158
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr159:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 159
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr160:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 160
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr161:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 161
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr162:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 162
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr163:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 163
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr164:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 164
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr165:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 165
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr166:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 166
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr167:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 167
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr168:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 168
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr169:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 169
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr170:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 170
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr171:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 171
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr172:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 172
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr173:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 173
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr174:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 174
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr175:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 175
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr176:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 176
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr177:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 177
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr178:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 178
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr179:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 179
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr180:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 180
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr181:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 181
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr182:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 182
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr183:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 183
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr184:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 184
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr185:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 185
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr186:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 186
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr187:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 187
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr188:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 188
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr189:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 189
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr190:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 190
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr191:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 191
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr192:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 192
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr193:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 193
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr194:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 194
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr195:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 195
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr196:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 196
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr197:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 197
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr198:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 198
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr199:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 199
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr200:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 200
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr201:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 201
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr202:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 202
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr203:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 203
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr204:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 204
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr205:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 205
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr206:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 206
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr207:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 207
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr208:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 208
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr209:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 209
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr210:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 210
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr211:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 211
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr212:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 212
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr213:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 213
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr214:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 214
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr215:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 215
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr216:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 216
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr217:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 217
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr218:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 218
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr219:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 219
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr220:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 220
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr221:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 221
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr222:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 222
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr223:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 223
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr224:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 224
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr225:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 225
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr226:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 226
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr227:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 227
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr228:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 228
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr229:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 229
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr230:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 230
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr231:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 231
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr232:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 232
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr233:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 233
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr234:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 234
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr235:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 235
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr236:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 236
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr237:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 237
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr238:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 238
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr239:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 239
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr240:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 240
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr241:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 241
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr242:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 242
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr243:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 243
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr244:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 244
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr245:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 245
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr246:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 246
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr247:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 247
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr248:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 248
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr249:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 249
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr250:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 250
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr251:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 251
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr252:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 252
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr253:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 253
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr254:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 254
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq




isr255:
; push registers
push rdi
push rsi


push rax
;push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
;push r12
;push r13
;push r14
;push r15
;mov rax, ds
;push rax
;mov rax, es
;push rax
;push fs
;push gs
;push rbp
; base of context struct
mov rdx, rsp
; load ISR number
mov rdi, 255
; call C handler
call handle_asm_irq
; pop registers
;pop rbp
;pop gs
;pop fs
;pop rax
;mov es, rax
;pop rax
;mov ds, rax
;pop r15
;pop r14
;pop r13
;pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
;pop rbx
pop rax
pop rsi
pop rdi
; exit ISR
iretq



