	.file	"main.c"
	.intel_syntax noprefix
	.section	.text.unlikely,"x"
LCOLDB0:
	.text
LHOTB0:
	.p2align 4,,15
	.globl	_insert
	.def	_insert;	.scl	2;	.type	32;	.endef
_insert:
	push	esi
	push	ebx
	sub	esp, 20
	mov	ebx, DWORD PTR [esp+32]
	mov	esi, DWORD PTR [esp+36]
	jmp	L2
	.p2align 4,,10
L3:
	cmp	DWORD PTR [eax], esi
	lea	ebx, [eax+4]
	lea	edx, [eax+8]
	cmovle	ebx, edx
L2:
	mov	eax, DWORD PTR [ebx]
	test	eax, eax
	jne	L3
	mov	DWORD PTR [esp], 12
	call	_malloc
	mov	DWORD PTR [eax+8], 0
	mov	DWORD PTR [eax+4], 0
	mov	DWORD PTR [eax], esi
	mov	DWORD PTR [ebx], eax
	add	esp, 20
	pop	ebx
	pop	esi
	ret
	.section	.text.unlikely,"x"
LCOLDE0:
	.text
LHOTE0:
	.section .rdata,"dr"
LC1:
	.ascii "%d \0"
	.section	.text.unlikely,"x"
LCOLDB2:
	.text
LHOTB2:
	.p2align 4,,15
	.globl	_traverse
	.def	_traverse;	.scl	2;	.type	32;	.endef
_traverse:
	push	esi
	push	ebx
	sub	esp, 20
	mov	ebx, DWORD PTR [esp+32]
	mov	esi, DWORD PTR [esp+36]
	test	ebx, ebx
	je	L9
	.p2align 4,,10
L15:
	mov	DWORD PTR [esp+4], esi
	mov	eax, DWORD PTR [ebx+4]
	mov	DWORD PTR [esp], eax
	call	_traverse
	mov	eax, DWORD PTR [ebx]
	mov	DWORD PTR [esp+4], OFFSET FLAT:LC1
	mov	DWORD PTR [esp], esi
	mov	DWORD PTR [esp+8], eax
	call	_fprintf
	mov	ebx, DWORD PTR [ebx+8]
	test	ebx, ebx
	jne	L15
L9:
	add	esp, 20
	pop	ebx
	pop	esi
	ret
	.section	.text.unlikely,"x"
LCOLDE2:
	.text
LHOTE2:
	.section	.text.unlikely,"x"
LCOLDB3:
	.text
LHOTB3:
	.p2align 4,,15
	.globl	_cleanup
	.def	_cleanup;	.scl	2;	.type	32;	.endef
_cleanup:
	push	ebx
	sub	esp, 24
	mov	ebx, DWORD PTR [esp+32]
	test	ebx, ebx
	je	L18
	mov	eax, DWORD PTR [ebx+4]
	mov	DWORD PTR [esp], eax
	call	_cleanup
	mov	eax, DWORD PTR [ebx+8]
	mov	DWORD PTR [esp], eax
	call	_cleanup
	mov	DWORD PTR [esp+32], ebx
	add	esp, 24
	pop	ebx
	jmp	_free
	.p2align 4,,10
L18:
	add	esp, 24
	pop	ebx
	ret
	.section	.text.unlikely,"x"
LCOLDE3:
	.text
LHOTE3:
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
LC4:
	.ascii "r\0"
LC5:
	.ascii "in.txt\0"
LC6:
	.ascii "w\0"
LC7:
	.ascii "out.txt\0"
LC8:
	.ascii "%d\0"
	.section	.text.unlikely,"x"
LCOLDB9:
	.section	.text.startup,"x"
LHOTB9:
	.p2align 4,,15
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
	push	ebp
	mov	ebp, esp
	push	edi
	push	esi
	push	ebx
	and	esp, -16
	sub	esp, 32
	call	___main
	mov	DWORD PTR [esp+4], OFFSET FLAT:LC4
	mov	DWORD PTR [esp], OFFSET FLAT:LC5
	lea	edi, [esp+28]
	mov	DWORD PTR [esp+24], 0
	lea	esi, [esp+24]
	call	_fopen
	test	BYTE PTR [eax+12], 16
	mov	ebx, eax
	jne	L23
	.p2align 4,,10
L26:
	mov	DWORD PTR [esp+8], edi
	mov	DWORD PTR [esp+4], OFFSET FLAT:LC8
	mov	DWORD PTR [esp], ebx
	mov	DWORD PTR [esp+28], 0
	call	_fscanf
	mov	eax, DWORD PTR [esp+28]
	mov	DWORD PTR [esp], esi
	mov	DWORD PTR [esp+4], eax
	call	_insert
	test	BYTE PTR [ebx+12], 16
	je	L26
L23:
	mov	DWORD PTR [esp], ebx
	call	_fclose
	mov	DWORD PTR [esp+4], OFFSET FLAT:LC6
	mov	DWORD PTR [esp], OFFSET FLAT:LC7
	call	_fopen
	mov	ebx, eax
	mov	DWORD PTR [esp+4], eax
	mov	eax, DWORD PTR [esp+24]
	mov	DWORD PTR [esp], eax
	call	_traverse
	mov	DWORD PTR [esp], ebx
	call	_fclose
	mov	eax, DWORD PTR [esp+24]
	mov	DWORD PTR [esp], eax
	call	_cleanup
	lea	esp, [ebp-12]
	xor	eax, eax
	pop	ebx
	pop	esi
	pop	edi
	pop	ebp
	ret
	.section	.text.unlikely,"x"
LCOLDE9:
	.section	.text.startup,"x"
LHOTE9:
	.ident	"GCC: (tdm-1) 4.9.2"
	.def	_malloc;	.scl	2;	.type	32;	.endef
	.def	_fprintf;	.scl	2;	.type	32;	.endef
	.def	_free;	.scl	2;	.type	32;	.endef
	.def	_fopen;	.scl	2;	.type	32;	.endef
	.def	_fscanf;	.scl	2;	.type	32;	.endef
	.def	_fclose;	.scl	2;	.type	32;	.endef
