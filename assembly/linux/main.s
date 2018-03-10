	.file	"main.c"
	.intel_syntax noprefix
	.text
	.p2align 4,,15
	.globl	insert
	.type	insert, @function
insert:
.LFB27:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	push	rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	mov	ebp, esi
	mov	rbx, rdi
	sub	rsp, 8
	.cfi_def_cfa_offset 32
	jmp	.L2
	.p2align 4,,10
	.p2align 3
.L3:
	cmp	DWORD PTR [rax], ebp
	lea	rdx, 8[rax]
	lea	rbx, 16[rax]
	cmovg	rbx, rdx
.L2:
	mov	rax, QWORD PTR [rbx]
	test	rax, rax
	jne	.L3
	mov	edi, 24
	call	malloc@PLT
	mov	QWORD PTR 16[rax], 0
	mov	QWORD PTR 8[rax], 0
	mov	DWORD PTR [rax], ebp
	mov	QWORD PTR [rbx], rax
	add	rsp, 8
	.cfi_def_cfa_offset 24
	pop	rbx
	.cfi_def_cfa_offset 16
	pop	rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE27:
	.size	insert, .-insert
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d "
	.text
	.p2align 4,,15
	.globl	traverse
	.type	traverse, @function
traverse:
.LFB28:
	.cfi_startproc
	test	rdi, rdi
	je	.L17
	push	r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	lea	r12, .LC0[rip]
	push	rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	mov	rbp, rsi
	push	rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	mov	rbx, rdi
.L11:
	mov	rdi, QWORD PTR 8[rbx]
	mov	rsi, rbp
	call	traverse
	mov	edx, DWORD PTR [rbx]
	xor	eax, eax
	mov	rsi, r12
	mov	rdi, rbp
	call	fprintf@PLT
	mov	rbx, QWORD PTR 16[rbx]
	test	rbx, rbx
	jne	.L11
	pop	rbx
	.cfi_def_cfa_offset 24
	pop	rbp
	.cfi_def_cfa_offset 16
	pop	r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L17:
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	rep ret
	.cfi_endproc
.LFE28:
	.size	traverse, .-traverse
	.p2align 4,,15
	.globl	cleanup
	.type	cleanup, @function
cleanup:
.LFB29:
	.cfi_startproc
	test	rdi, rdi
	jne	.L25
	rep ret
	.p2align 4,,10
	.p2align 3
.L25:
	push	rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	mov	rbx, rdi
	mov	rdi, QWORD PTR 8[rdi]
	call	cleanup
	mov	rdi, QWORD PTR 16[rbx]
	call	cleanup
	mov	rdi, rbx
	pop	rbx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	jmp	free@PLT
	.cfi_endproc
.LFE29:
	.size	cleanup, .-cleanup
	.section	.rodata.str1.1
.LC1:
	.string	"r"
.LC2:
	.string	"in.txt"
.LC3:
	.string	"%d"
.LC4:
	.string	"w"
.LC5:
	.string	"out.txt"
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB30:
	.cfi_startproc
	push	r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	push	r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	lea	rsi, .LC1[rip]
	push	rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	push	rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	lea	rdi, .LC2[rip]
	lea	r12, .LC3[rip]
	sub	rsp, 40
	.cfi_def_cfa_offset 80
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR 24[rsp], rax
	xor	eax, eax
	mov	QWORD PTR 16[rsp], 0
	lea	r13, 12[rsp]
	lea	rbp, 16[rsp]
	call	fopen@PLT
	mov	rbx, rax
	jmp	.L27
	.p2align 4,,10
	.p2align 3
.L28:
	mov	rsi, r12
	mov	rdi, rbx
	mov	rdx, r13
	xor	eax, eax
	mov	DWORD PTR 12[rsp], 0
	call	__isoc99_fscanf@PLT
	mov	esi, DWORD PTR 12[rsp]
	mov	rdi, rbp
	call	insert
.L27:
	mov	rdi, rbx
	call	feof@PLT
	test	eax, eax
	je	.L28
	mov	rdi, rbx
	call	fclose@PLT
	lea	rsi, .LC4[rip]
	lea	rdi, .LC5[rip]
	call	fopen@PLT
	mov	rdi, QWORD PTR 16[rsp]
	mov	rbx, rax
	mov	rsi, rax
	call	traverse
	mov	rdi, rbx
	call	fclose@PLT
	mov	rbx, QWORD PTR 16[rsp]
	test	rbx, rbx
	je	.L29
	mov	rdi, QWORD PTR 8[rbx]
	call	cleanup
	mov	rdi, QWORD PTR 16[rbx]
	call	cleanup
	mov	rdi, rbx
	call	free@PLT
.L29:
	xor	eax, eax
	mov	rcx, QWORD PTR 24[rsp]
	xor	rcx, QWORD PTR fs:40
	jne	.L35
	add	rsp, 40
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	pop	rbx
	.cfi_def_cfa_offset 32
	pop	rbp
	.cfi_def_cfa_offset 24
	pop	r12
	.cfi_def_cfa_offset 16
	pop	r13
	.cfi_def_cfa_offset 8
	ret
.L35:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE30:
	.size	main, .-main
	.ident	"GCC: (GNU) 7.3.0"
	.section	.note.GNU-stack,"",@progbits
