	.text
	.section .mdebug.abiO32
	.previous
	.file	"AllTest.ll"
	.globl	FieldMulBate
	.align	2
	.type	FieldMulBate,@function
	.ent	FieldMulBate            # @FieldMulBate
FieldMulBate:
	.frame	$fp,16,$lr
	.mask 	0x00000000000000000000000000000000,0
	.set	noreorder
	.set	nomacro
# BB#0:                                 # %entry
	addiu32	$sp, $sp, -16
	st64	$gwr4, 8($sp)
	addm	$gwr1, $gwr4, $gwr4
	st64	$gwr1, 0($sp)
	addiu64	$gwr2, $gwr0, 0
	subm	$gwr2, $gwr2, $gwr1
	st64	$gwr2, 0($sp)
	addiu32	$sp, $sp, 16
	ret	$lr
	nop
	.set	macro
	.set	reorder
	.end	FieldMulBate
$func_end0:
	.size	FieldMulBate, ($func_end0)-FieldMulBate

	.globl	FieldMulBate_
	.align	2
	.type	FieldMulBate_,@function
	.ent	FieldMulBate_           # @FieldMulBate_
FieldMulBate_:
	.frame	$fp,16,$lr
	.mask 	0x00000000000000000000000000000000,0
	.set	noreorder
	.set	nomacro
# BB#0:                                 # %entry
	addiu32	$sp, $sp, -16
	st64	$gwr4, 8($sp)
	addm	$gwr2, $gwr4, $gwr4
	st64	$gwr2, 0($sp)
	addiu32	$sp, $sp, 16
	ret	$lr
	nop
	.set	macro
	.set	reorder
	.end	FieldMulBate_
$func_end1:
	.size	FieldMulBate_, ($func_end1)-FieldMulBate_

	.globl	FieldNeg
	.align	2
	.type	FieldNeg,@function
	.ent	FieldNeg                # @FieldNeg
FieldNeg:
	.frame	$fp,8,$lr
	.mask 	0x00000000000000000000000000000000,0
	.set	noreorder
	.set	nomacro
# BB#0:                                 # %entry
	addiu32	$sp, $sp, -8
	st64	$gwr4, 0($sp)
	addiu64	$gwr1, $gwr0, 0
	subm	$gwr2, $gwr1, $gwr4
	addiu32	$sp, $sp, 8
	ret	$lr
	nop
	.set	macro
	.set	reorder
	.end	FieldNeg
$func_end2:
	.size	FieldNeg, ($func_end2)-FieldNeg

	.globl	FieldInverse
	.align	2
	.type	FieldInverse,@function
	.ent	FieldInverse            # @FieldInverse
FieldInverse:
	.frame	$fp,56,$lr
	.mask 	0x00000000000000000000000000000000,0
	.set	noreorder
	.set	nomacro
# BB#0:                                 # %entry
	addiu32	$sp, $sp, -56
	ld64	$gwr1, 64($sp)
	st64	$gwr4, 48($sp)
	st64	$gwr5, 40($sp)
	st64	$gwr1, 32($sp)
	ld64	$gwr1, 48($sp)
	addiu64	$gwr2, $gwr0, 1
	mtswr1	$gwr1
	mtswr2	$gwr2
	montmult
	add64swr	$gwr1
	st64	$gwr1, 24($sp)
	ld64	$gwr1, 32($sp)
	st64	$gwr1, 16($sp)
	st64	$gwr2, 8($sp)
	addiu64	$gwr1, $gwr0, 0
	st64	$gwr1, 0($sp)
	addiu32	$r2, $zero, 1
$BB3_1:                                 # %while.cond
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB3_4 Depth 2
                                        #     Child Loop BB3_8 Depth 2
	ld64	$gwr2, 24($sp)
	cmplong	$r1, $gwr2, $gwr1
	beq	$r1, $zero, $BB3_14
	nop
# BB#2:                                 # %while.cond
                                        #   in Loop: Header=BB3_1 Depth=1
	jmp	$BB3_4
	nop
$BB3_3:                                 # %if.else
                                        #   in Loop: Header=BB3_4 Depth=2
	ld64	$gwr2, 32($sp)
	ld64	$gwr3, 8($sp)
	add64	$gwr2, $gwr3, $gwr2
	sra64	$gwr2, $gwr2, 1
	st64	$gwr2, 8($sp)
$BB3_4:                                 # %while.cond.1
                                        #   Parent Loop BB3_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	ld64	$gwr2, 24($sp)
	andi64	$gwr2, $gwr2, 1
	cmplong	$r1, $gwr2, $gwr1
	bne	$r1, $zero, $BB3_8
	nop
# BB#5:                                 # %while.body.3
                                        #   in Loop: Header=BB3_4 Depth=2
	ld64	$gwr2, 24($sp)
	sra64	$gwr2, $gwr2, 1
	st64	$gwr2, 24($sp)
	ld64	$gwr2, 8($sp)
	andi64	$gwr2, $gwr2, 1
	cmplong	$r1, $gwr2, $gwr1
	bne	$r1, $zero, $BB3_3
	nop
# BB#6:                                 # %if.then
                                        #   in Loop: Header=BB3_4 Depth=2
	ld64	$gwr2, 8($sp)
	sra64	$gwr2, $gwr2, 1
	st64	$gwr2, 8($sp)
	jmp	$BB3_4
	nop
$BB3_7:                                 # %if.else.17
                                        #   in Loop: Header=BB3_8 Depth=2
	ld64	$gwr2, 32($sp)
	ld64	$gwr3, 0($sp)
	add64	$gwr2, $gwr3, $gwr2
	sra64	$gwr2, $gwr2, 1
	st64	$gwr2, 0($sp)
$BB3_8:                                 # %while.cond.8
                                        #   Parent Loop BB3_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	ld64	$gwr2, 16($sp)
	andi64	$gwr2, $gwr2, 1
	cmplong	$r1, $gwr2, $gwr1
	bne	$r1, $zero, $BB3_11
	nop
# BB#9:                                 # %while.body.11
                                        #   in Loop: Header=BB3_8 Depth=2
	ld64	$gwr2, 16($sp)
	sra64	$gwr2, $gwr2, 1
	st64	$gwr2, 16($sp)
	ld64	$gwr2, 0($sp)
	andi64	$gwr2, $gwr2, 1
	cmplong	$r1, $gwr2, $gwr1
	bne	$r1, $zero, $BB3_7
	nop
# BB#10:                                # %if.then.15
                                        #   in Loop: Header=BB3_8 Depth=2
	ld64	$gwr2, 0($sp)
	sra64	$gwr2, $gwr2, 1
	st64	$gwr2, 0($sp)
	jmp	$BB3_8
	nop
$BB3_11:                                # %while.end.21
                                        #   in Loop: Header=BB3_1 Depth=1
	ld64	$gwr2, 16($sp)
	ld64	$gwr3, 24($sp)
	cmplong	$r1, $gwr3, $gwr2
	beq	$r1, $r2, $BB3_13
	nop
# BB#12:                                # %if.then.23
                                        #   in Loop: Header=BB3_1 Depth=1
	ld64	$gwr2, 16($sp)
	ld64	$gwr3, 24($sp)
	subm	$gwr2, $gwr3, $gwr2
	st64	$gwr2, 24($sp)
	ld64	$gwr2, 0($sp)
	ld64	$gwr3, 8($sp)
	subm	$gwr2, $gwr3, $gwr2
	st64	$gwr2, 8($sp)
	jmp	$BB3_1
	nop
$BB3_13:                                # %if.else.24
                                        #   in Loop: Header=BB3_1 Depth=1
	ld64	$gwr2, 24($sp)
	ld64	$gwr3, 16($sp)
	subm	$gwr2, $gwr3, $gwr2
	st64	$gwr2, 16($sp)
	ld64	$gwr2, 8($sp)
	ld64	$gwr3, 0($sp)
	subm	$gwr2, $gwr3, $gwr2
	st64	$gwr2, 0($sp)
	jmp	$BB3_1
	nop
$BB3_14:                                # %while.end.26
	ld64	$gwr1, 40($sp)
	ld64	$gwr2, 0($sp)
	mtswr1	$gwr2
	mtswr2	$gwr1
	montmult
	add64swr	$gwr2
	st64	$gwr2, 0($sp)
	addiu32	$sp, $sp, 56
	ret	$lr
	nop
	.set	macro
	.set	reorder
	.end	FieldInverse
$func_end3:
	.size	FieldInverse, ($func_end3)-FieldInverse

	.globl	Field2SetOne
	.align	2
	.type	Field2SetOne,@function
	.ent	Field2SetOne            # @Field2SetOne
Field2SetOne:
	.frame	$fp,16,$lr
	.mask 	0x00200000002000000020000000200000,-8
	.set	noreorder
	.set	nomacro
# BB#0:                                 # %entry
	addiu32	$sp, $sp, -16
	st32	$fp, 12($sp)            # 4-byte Folded Spill
	st32	$r4, 8($sp)
	st64	$gwr4, 0($sp)
	ld32	$fp, 8($sp)
	st64	$gwr4, 0($fp)
	ld32	$fp, 8($sp)
	addiu64	$gwr1, $gwr0, 0
	st64	$gwr1, 8($fp)
	addiu32	$r2, $zero, 0
	ld32	$fp, 12($sp)            # 4-byte Folded Reload
	addiu32	$sp, $sp, 16
	ret	$lr
	nop
	.set	macro
	.set	reorder
	.end	Field2SetOne
$func_end4:
	.size	Field2SetOne, ($func_end4)-Field2SetOne

	.globl	Field2SetZero
	.align	2
	.type	Field2SetZero,@function
	.ent	Field2SetZero           # @Field2SetZero
Field2SetZero:
	.frame	$fp,8,$lr
	.mask 	0x00200000002000000020000000200000,-8
	.set	noreorder
	.set	nomacro
# BB#0:                                 # %entry
	addiu32	$sp, $sp, -8
	st32	$fp, 4($sp)             # 4-byte Folded Spill
	addu	$fp, $zero, $r4
	st32	$fp, 0($sp)
	addiu64	$gwr1, $gwr0, 0
	st64	$gwr1, 0($fp)
	ld32	$fp, 0($sp)
	st64	$gwr1, 8($fp)
	addiu32	$r2, $zero, 0
	ld32	$fp, 4($sp)             # 4-byte Folded Reload
	addiu32	$sp, $sp, 8
	ret	$lr
	nop
	.set	macro
	.set	reorder
	.end	Field2SetZero
$func_end5:
	.size	Field2SetZero, ($func_end5)-Field2SetZero

	.globl	Field2Squaring
	.align	2
	.type	Field2Squaring,@function
	.ent	Field2Squaring          # @Field2Squaring
Field2Squaring:
	.frame	$fp,72,$lr
	.mask 	0x00a0000000a0000000a0000000a00000,-8
	.set	noreorder
	.cpload	$t9
	.set	nomacro
# BB#0:                                 # %entry
	lui	$r2, %hi(_gp_disp)
	addiu32	$r2, $r2, %lo(_gp_disp)
	addiu32	$sp, $sp, -72
	st32	$lr, 68($sp)            # 4-byte Folded Spill
	st32	$fp, 64($sp)            # 4-byte Folded Spill
	st32	$r4, 60($sp)
	st32	$r5, 56($sp)
	ld32	$fp, 60($sp)
	ld64	$gwr1, 0($fp)
	st64	$gwr1, 16($sp)
	ld32	$fp, 60($sp)
	ld64	$gwr1, 8($fp)
	st64	$gwr1, 8($sp)
	ld64	$gwr1, 16($sp)
	mtswr1	$gwr1
	mtswr2	$gwr1
	montmult
	add64swr	$gwr1
	st64	$gwr1, 48($sp)
	ld64	$gwr1, 8($sp)
	mtswr1	$gwr1
	mtswr2	$gwr1
	montmult
	add64swr	$gwr4
	st64	$gwr4, 40($sp)
	ld32	$r6, %call16(FieldMulBate)($gp)
	jalr	$r6
	nop
	st64	$gwr2, 32($sp)
	ld64	$gwr1, 48($sp)
	addm	$gwr1, $gwr2, $gwr1
	st64	$gwr1, 32($sp)
	ld64	$gwr1, 8($sp)
	ld64	$gwr2, 16($sp)
	addm	$gwr1, $gwr2, $gwr1
	st64	$gwr1, 24($sp)
	mtswr1	$gwr1
	mtswr2	$gwr1
	montmult
	add64swr	$gwr1
	st64	$gwr1, 24($sp)
	ld64	$gwr2, 48($sp)
	subm	$gwr1, $gwr1, $gwr2
	st64	$gwr1, 24($sp)
	ld64	$gwr2, 40($sp)
	subm	$gwr1, $gwr1, $gwr2
	st64	$gwr1, 24($sp)
	ld32	$fp, 56($sp)
	ld64	$gwr1, 32($sp)
	st64	$gwr1, 0($fp)
	ld32	$fp, 56($sp)
	ld64	$gwr1, 24($sp)
	st64	$gwr1, 8($fp)
	addiu32	$r2, $zero, 0
	ld32	$fp, 64($sp)            # 4-byte Folded Reload
	ld32	$lr, 68($sp)            # 4-byte Folded Reload
	addiu32	$sp, $sp, 72
	ret	$lr
	nop
	.set	macro
	.set	reorder
	.end	Field2Squaring
$func_end6:
	.size	Field2Squaring, ($func_end6)-Field2Squaring

	.globl	Field2Mul
	.align	2
	.type	Field2Mul,@function
	.ent	Field2Mul               # @Field2Mul
Field2Mul:
	.frame	$fp,104,$lr
	.mask 	0x00a0000000a0000000a0000000a00000,-8
	.set	noreorder
	.cpload	$t9
	.set	nomacro
# BB#0:                                 # %entry
	lui	$r2, %hi(_gp_disp)
	addiu32	$r2, $r2, %lo(_gp_disp)
	addiu32	$sp, $sp, -104
	st32	$lr, 100($sp)           # 4-byte Folded Spill
	st32	$fp, 96($sp)            # 4-byte Folded Spill
	ld32	$r1, 112($sp)
	st32	$r4, 92($sp)
	st32	$r5, 88($sp)
	st32	$r1, 84($sp)
	ld32	$fp, 92($sp)
	ld64	$gwr1, 0($fp)
	st64	$gwr1, 72($sp)
	ld32	$fp, 92($sp)
	ld64	$gwr1, 8($fp)
	st64	$gwr1, 64($sp)
	ld32	$fp, 88($sp)
	ld64	$gwr1, 0($fp)
	st64	$gwr1, 56($sp)
	ld32	$fp, 88($sp)
	ld64	$gwr1, 8($fp)
	st64	$gwr1, 48($sp)
	ld64	$gwr1, 64($sp)
	ld64	$gwr2, 72($sp)
	addm	$gwr1, $gwr2, $gwr1
	st64	$gwr1, 40($sp)
	ld64	$gwr1, 48($sp)
	ld64	$gwr2, 56($sp)
	addm	$gwr1, $gwr2, $gwr1
	st64	$gwr1, 32($sp)
	ld64	$gwr2, 40($sp)
	mtswr1	$gwr2
	mtswr2	$gwr1
	montmult
	add64swr	$gwr1
	st64	$gwr1, 24($sp)
	ld64	$gwr1, 56($sp)
	ld64	$gwr2, 72($sp)
	mtswr1	$gwr2
	mtswr2	$gwr1
	montmult
	add64swr	$gwr1
	st64	$gwr1, 16($sp)
	ld64	$gwr1, 48($sp)
	ld64	$gwr2, 64($sp)
	mtswr1	$gwr2
	mtswr2	$gwr1
	montmult
	add64swr	$gwr1
	st64	$gwr1, 8($sp)
	ld64	$gwr1, 16($sp)
	ld64	$gwr2, 24($sp)
	subm	$gwr1, $gwr2, $gwr1
	st64	$gwr1, 24($sp)
	ld64	$gwr2, 8($sp)
	subm	$gwr1, $gwr1, $gwr2
	st64	$gwr1, 24($sp)
	ld64	$gwr4, 8($sp)
	ld32	$r6, %call16(FieldMulBate_)($gp)
	jalr	$r6
	nop
	st64	$gwr2, 8($sp)
	ld64	$gwr1, 16($sp)
	subm	$gwr1, $gwr1, $gwr2
	st64	$gwr1, 16($sp)
	ld32	$fp, 84($sp)
	st64	$gwr1, 0($fp)
	ld32	$fp, 84($sp)
	ld64	$gwr1, 24($sp)
	st64	$gwr1, 8($fp)
	addiu32	$r2, $zero, 0
	ld32	$fp, 96($sp)            # 4-byte Folded Reload
	ld32	$lr, 100($sp)           # 4-byte Folded Reload
	addiu32	$sp, $sp, 104
	ret	$lr
	nop
	.set	macro
	.set	reorder
	.end	Field2Mul
$func_end7:
	.size	Field2Mul, ($func_end7)-Field2Mul

	.globl	Field2Add
	.align	2
	.type	Field2Add,@function
	.ent	Field2Add               # @Field2Add
Field2Add:
	.frame	$fp,24,$lr
	.mask 	0x00200000002000000020000000200000,-8
	.set	noreorder
	.set	nomacro
# BB#0:                                 # %entry
	addiu32	$sp, $sp, -24
	st32	$fp, 20($sp)            # 4-byte Folded Spill
	ld32	$fp, 32($sp)
	st32	$fp, 4($sp)             # 4-byte Folded Spill
	st32	$r4, 16($sp)
	st32	$r5, 12($sp)
	st32	$fp, 8($sp)
	ld32	$fp, 12($sp)
	ld64	$gwr1, 0($fp)
	ld32	$fp, 16($sp)
	ld64	$gwr2, 0($fp)
	addm	$gwr1, $gwr2, $gwr1
	ld32	$fp, 4($sp)             # 4-byte Folded Reload
	st64	$gwr1, 0($fp)
	ld32	$fp, 12($sp)
	ld64	$gwr1, 8($fp)
	ld32	$fp, 16($sp)
	ld64	$gwr2, 8($fp)
	addm	$gwr1, $gwr2, $gwr1
	ld32	$fp, 8($sp)
	st64	$gwr1, 8($fp)
	addiu32	$r2, $zero, 0
	ld32	$fp, 20($sp)            # 4-byte Folded Reload
	addiu32	$sp, $sp, 24
	ret	$lr
	nop
	.set	macro
	.set	reorder
	.end	Field2Add
$func_end8:
	.size	Field2Add, ($func_end8)-Field2Add

	.globl	Field2Sub
	.align	2
	.type	Field2Sub,@function
	.ent	Field2Sub               # @Field2Sub
Field2Sub:
	.frame	$fp,24,$lr
	.mask 	0x00200000002000000020000000200000,-8
	.set	noreorder
	.set	nomacro
# BB#0:                                 # %entry
	addiu32	$sp, $sp, -24
	st32	$fp, 20($sp)            # 4-byte Folded Spill
	ld32	$fp, 32($sp)
	st32	$fp, 4($sp)             # 4-byte Folded Spill
	st32	$r4, 16($sp)
	st32	$r5, 12($sp)
	st32	$fp, 8($sp)
	ld32	$fp, 12($sp)
	ld64	$gwr1, 0($fp)
	ld32	$fp, 16($sp)
	ld64	$gwr2, 0($fp)
	subm	$gwr1, $gwr2, $gwr1
	ld32	$fp, 4($sp)             # 4-byte Folded Reload
	st64	$gwr1, 0($fp)
	ld32	$fp, 12($sp)
	ld64	$gwr1, 8($fp)
	ld32	$fp, 16($sp)
	ld64	$gwr2, 8($fp)
	subm	$gwr1, $gwr2, $gwr1
	ld32	$fp, 8($sp)
	st64	$gwr1, 8($fp)
	addiu32	$r2, $zero, 0
	ld32	$fp, 20($sp)            # 4-byte Folded Reload
	addiu32	$sp, $sp, 24
	ret	$lr
	nop
	.set	macro
	.set	reorder
	.end	Field2Sub
$func_end9:
	.size	Field2Sub, ($func_end9)-Field2Sub

	.globl	Field2Neg
	.align	2
	.type	Field2Neg,@function
	.ent	Field2Neg               # @Field2Neg
Field2Neg:
	.frame	$fp,16,$lr
	.mask 	0x00200000002000000020000000200000,-8
	.set	noreorder
	.set	nomacro
# BB#0:                                 # %entry
	addiu32	$sp, $sp, -16
	st32	$fp, 12($sp)            # 4-byte Folded Spill
	addu	$fp, $zero, $r5
	st32	$fp, 0($sp)             # 4-byte Folded Spill
	st32	$r4, 8($sp)
	st32	$fp, 4($sp)
	ld32	$fp, 8($sp)
	ld64	$gwr1, 0($fp)
	addiu64	$gwr2, $gwr0, 0
	subm	$gwr1, $gwr2, $gwr1
	ld32	$fp, 0($sp)             # 4-byte Folded Reload
	st64	$gwr1, 0($fp)
	ld32	$fp, 8($sp)
	ld64	$gwr1, 8($fp)
	subm	$gwr1, $gwr2, $gwr1
	ld32	$fp, 4($sp)
	st64	$gwr1, 8($fp)
	addiu32	$r2, $zero, 0
	ld32	$fp, 12($sp)            # 4-byte Folded Reload
	addiu32	$sp, $sp, 16
	ret	$lr
	nop
	.set	macro
	.set	reorder
	.end	Field2Neg
$func_end10:
	.size	Field2Neg, ($func_end10)-Field2Neg

	.globl	Field2Conjugate
	.align	2
	.type	Field2Conjugate,@function
	.ent	Field2Conjugate         # @Field2Conjugate
Field2Conjugate:
	.frame	$fp,16,$lr
	.mask 	0x00200000002000000020000000200000,-8
	.set	noreorder
	.set	nomacro
# BB#0:                                 # %entry
	addiu32	$sp, $sp, -16
	st32	$fp, 12($sp)            # 4-byte Folded Spill
	addu	$fp, $zero, $r5
	st32	$fp, 0($sp)             # 4-byte Folded Spill
	st32	$r4, 8($sp)
	st32	$fp, 4($sp)
	ld32	$fp, 8($sp)
	ld64	$gwr1, 0($fp)
	ld32	$fp, 0($sp)             # 4-byte Folded Reload
	st64	$gwr1, 0($fp)
	ld32	$fp, 8($sp)
	ld64	$gwr1, 8($fp)
	addiu64	$gwr2, $gwr0, 0
	subm	$gwr1, $gwr2, $gwr1
	ld32	$fp, 4($sp)
	st64	$gwr1, 8($fp)
	addiu32	$r2, $zero, 0
	ld32	$fp, 12($sp)            # 4-byte Folded Reload
	addiu32	$sp, $sp, 16
	ret	$lr
	nop
	.set	macro
	.set	reorder
	.end	Field2Conjugate
$func_end11:
	.size	Field2Conjugate, ($func_end11)-Field2Conjugate

	.globl	Field2MulYemeseilong
	.align	2
	.type	Field2MulYemeseilong,@function
	.ent	Field2MulYemeseilong    # @Field2MulYemeseilong
Field2MulYemeseilong:
	.frame	$fp,24,$lr
	.mask 	0x00a0000000a0000000a0000000a00000,-8
	.set	noreorder
	.cpload	$t9
	.set	nomacro
# BB#0:                                 # %entry
	lui	$r2, %hi(_gp_disp)
	addiu32	$r2, $r2, %lo(_gp_disp)
	addiu32	$sp, $sp, -24
	st32	$lr, 20($sp)            # 4-byte Folded Spill
	st32	$fp, 16($sp)            # 4-byte Folded Spill
	st32	$r4, 12($sp)
	st32	$r5, 8($sp)
	ld32	$fp, 12($sp)
	ld64	$gwr4, 8($fp)
	ld32	$r6, %call16(FieldMulBate)($gp)
	jalr	$r6
	nop
	ld32	$fp, 8($sp)
	st64	$gwr2, 0($fp)
	ld32	$fp, 12($sp)
	ld64	$gwr1, 0($fp)
	ld32	$fp, 8($sp)
	st64	$gwr1, 8($fp)
	addiu32	$r2, $zero, 0
	ld32	$fp, 16($sp)            # 4-byte Folded Reload
	ld32	$lr, 20($sp)            # 4-byte Folded Reload
	addiu32	$sp, $sp, 24
	ret	$lr
	nop
	.set	macro
	.set	reorder
	.end	Field2MulYemeseilong
$func_end12:
	.size	Field2MulYemeseilong, ($func_end12)-Field2MulYemeseilong

	.globl	Field2MulConst
	.align	2
	.type	Field2MulConst,@function
	.ent	Field2MulConst          # @Field2MulConst
Field2MulConst:
	.frame	$fp,24,$lr
	.mask 	0x00200000002000000020000000200000,-8
	.set	noreorder
	.set	nomacro
# BB#0:                                 # %entry
	addiu32	$sp, $sp, -24
	st32	$fp, 20($sp)            # 4-byte Folded Spill
	addu	$fp, $zero, $r5
	st32	$fp, 0($sp)             # 4-byte Folded Spill
	st32	$r4, 16($sp)
	st64	$gwr4, 8($sp)
	st32	$fp, 4($sp)
	ld32	$fp, 16($sp)
	ld64	$gwr1, 0($fp)
	ld64	$gwr2, 8($sp)
	mtswr1	$gwr1
	mtswr2	$gwr2
	montmult
	add64swr	$gwr1
	ld32	$fp, 0($sp)             # 4-byte Folded Reload
	st64	$gwr1, 0($fp)
	ld32	$fp, 16($sp)
	ld64	$gwr1, 8($fp)
	ld64	$gwr2, 8($sp)
	mtswr1	$gwr1
	mtswr2	$gwr2
	montmult
	add64swr	$gwr1
	ld32	$fp, 4($sp)
	st64	$gwr1, 8($fp)
	addiu32	$r2, $zero, 0
	ld32	$fp, 20($sp)            # 4-byte Folded Reload
	addiu32	$sp, $sp, 24
	ret	$lr
	nop
	.set	macro
	.set	reorder
	.end	Field2MulConst
$func_end13:
	.size	Field2MulConst, ($func_end13)-Field2MulConst

	.globl	Field2Copy
	.align	2
	.type	Field2Copy,@function
	.ent	Field2Copy              # @Field2Copy
Field2Copy:
	.frame	$fp,16,$lr
	.mask 	0x00200000002000000020000000200000,-8
	.set	noreorder
	.set	nomacro
# BB#0:                                 # %entry
	addiu32	$sp, $sp, -16
	st32	$fp, 12($sp)            # 4-byte Folded Spill
	addu	$fp, $zero, $r5
	st32	$fp, 0($sp)             # 4-byte Folded Spill
	st32	$r4, 8($sp)
	st32	$fp, 4($sp)
	ld32	$fp, 8($sp)
	ld64	$gwr1, 0($fp)
	ld32	$fp, 0($sp)             # 4-byte Folded Reload
	st64	$gwr1, 0($fp)
	ld32	$fp, 8($sp)
	ld64	$gwr1, 8($fp)
	ld32	$fp, 4($sp)
	st64	$gwr1, 8($fp)
	addiu32	$r2, $zero, 0
	ld32	$fp, 12($sp)            # 4-byte Folded Reload
	addiu32	$sp, $sp, 16
	ret	$lr
	nop
	.set	macro
	.set	reorder
	.end	Field2Copy
$func_end14:
	.size	Field2Copy, ($func_end14)-Field2Copy

	.globl	Field2Inverse
	.align	2
	.type	Field2Inverse,@function
	.ent	Field2Inverse           # @Field2Inverse
Field2Inverse:
	.frame	$fp,80,$lr
	.mask 	0x00a0000000a0000000a0000000a00000,-8
	.set	noreorder
	.cpload	$t9
	.set	nomacro
# BB#0:                                 # %entry
	lui	$r2, %hi(_gp_disp)
	addiu32	$r2, $r2, %lo(_gp_disp)
	addiu32	$sp, $sp, -80
	st32	$lr, 76($sp)            # 4-byte Folded Spill
	st32	$fp, 72($sp)            # 4-byte Folded Spill
	st32	$r4, 68($sp)
	st64	$gwr4, 56($sp)
	st64	$gwr5, 48($sp)
	st32	$r5, 44($sp)
	ld32	$fp, 68($sp)
	ld64	$gwr1, 0($fp)
	mtswr1	$gwr1
	mtswr2	$gwr1
	montmult
	add64swr	$gwr1
	st64	$gwr1, 32($sp)
	ld32	$fp, 68($sp)
	ld64	$gwr1, 8($fp)
	mtswr1	$gwr1
	mtswr2	$gwr1
	montmult
	add64swr	$gwr4
	st64	$gwr4, 24($sp)
	ld64	$gwr1, 32($sp)
	st64	$gwr1, 16($sp)          # 8-byte Folded Spill
	ld32	$r6, %call16(FieldMulBate_)($gp)
	jalr	$r6
	nop
	ld64	$gwr1, 16($sp)          # 8-byte Folded Reload
	addm	$gwr4, $gwr1, $gwr2
	st64	$gwr4, 32($sp)
	ld64	$gwr5, 56($sp)
	ld64	$gwr1, 48($sp)
	st64	$gwr1, 8($sp)
	ld32	$r6, %call16(FieldInverse)($gp)
	jalr	$r6
	nop
	st64	$gwr2, 24($sp)
	ld32	$fp, 68($sp)
	ld64	$gwr1, 0($fp)
	mtswr1	$gwr1
	mtswr2	$gwr2
	montmult
	add64swr	$gwr1
	ld32	$fp, 44($sp)
	st64	$gwr1, 0($fp)
	ld32	$fp, 68($sp)
	ld64	$gwr1, 8($fp)
	ld64	$gwr2, 24($sp)
	mtswr1	$gwr1
	mtswr2	$gwr2
	montmult
	add64swr	$gwr4
	ld32	$r6, %call16(FieldNeg)($gp)
	jalr	$r6
	nop
	ld32	$fp, 44($sp)
	st64	$gwr2, 8($fp)
	addiu32	$r2, $zero, 0
	ld32	$fp, 72($sp)            # 4-byte Folded Reload
	ld32	$lr, 76($sp)            # 4-byte Folded Reload
	addiu32	$sp, $sp, 80
	ret	$lr
	nop
	.set	macro
	.set	reorder
	.end	Field2Inverse
$func_end15:
	.size	Field2Inverse, ($func_end15)-Field2Inverse

	.globl	Field6SetOne
	.align	2
	.type	Field6SetOne,@function
	.ent	Field6SetOne            # @Field6SetOne
Field6SetOne:
	.frame	$fp,24,$lr
	.mask 	0x00800000008000000080000000800000,-8
	.set	noreorder
	.cpload	$t9
	.set	nomacro
# BB#0:                                 # %entry
	lui	$r2, %hi(_gp_disp)
	addiu32	$r2, $r2, %lo(_gp_disp)
	addiu32	$sp, $sp, -24
	st32	$lr, 20($sp)            # 4-byte Folded Spill
	st32	$r4, 16($sp)
	st64	$gwr4, 8($sp)
	ld32	$r4, 16($sp)
	ld32	$r6, %call16(Field2SetOne)($gp)
	jalr	$r6
	nop
	ld32	$r1, 16($sp)
	addiu32	$r4, $r1, 16
	ld32	$r6, %call16(Field2SetZero)($gp)
	jalr	$r6
	nop
	ld32	$r1, 16($sp)
	addiu32	$r4, $r1, 32
	ld32	$r6, %call16(Field2SetZero)($gp)
	jalr	$r6
	nop
	addiu32	$r2, $zero, 0
	ld32	$lr, 20($sp)            # 4-byte Folded Reload
	addiu32	$sp, $sp, 24
	ret	$lr
	nop
	.set	macro
	.set	reorder
	.end	Field6SetOne
$func_end16:
	.size	Field6SetOne, ($func_end16)-Field6SetOne

	.globl	Field6SetZero
	.align	2
	.type	Field6SetZero,@function
	.ent	Field6SetZero           # @Field6SetZero
Field6SetZero:
	.frame	$fp,16,$lr
	.mask 	0x00800000008000000080000000800000,-8
	.set	noreorder
	.cpload	$t9
	.set	nomacro
# BB#0:                                 # %entry
	lui	$r2, %hi(_gp_disp)
	addiu32	$r2, $r2, %lo(_gp_disp)
	addiu32	$sp, $sp, -16
	st32	$lr, 12($sp)            # 4-byte Folded Spill
	st32	$r4, 8($sp)
	ld32	$r6, %call16(Field2SetZero)($gp)
	jalr	$r6
	nop
	ld32	$r1, 8($sp)
	addiu32	$r4, $r1, 16
	ld32	$r6, %call16(Field2SetZero)($gp)
	jalr	$r6
	nop
	ld32	$r1, 8($sp)
	addiu32	$r4, $r1, 32
	ld32	$r6, %call16(Field2SetZero)($gp)
	jalr	$r6
	nop
	addiu32	$r2, $zero, 0
	ld32	$lr, 12($sp)            # 4-byte Folded Reload
	addiu32	$sp, $sp, 16
	ret	$lr
	nop
	.set	macro
	.set	reorder
	.end	Field6SetZero
$func_end17:
	.size	Field6SetZero, ($func_end17)-Field6SetZero

	.globl	Field6Add
	.align	2
	.type	Field6Add,@function
	.ent	Field6Add               # @Field6Add
Field6Add:
	.frame	$fp,32,$lr
	.mask 	0x00800000008000000080000000800000,-8
	.set	noreorder
	.cpload	$t9
	.set	nomacro
# BB#0:                                 # %entry
	lui	$r2, %hi(_gp_disp)
	addiu32	$r2, $r2, %lo(_gp_disp)
	addiu32	$sp, $sp, -32
	st32	$lr, 28($sp)            # 4-byte Folded Spill
	ld32	$r1, 40($sp)
	st32	$r4, 24($sp)
	st32	$r5, 20($sp)
	st32	$r1, 16($sp)
	ld32	$r5, 20($sp)
	ld32	$r4, 24($sp)
	st32	$r1, 8($sp)
	ld32	$r6, %call16(Field2Add)($gp)
	jalr	$r6
	nop
	ld32	$r1, 20($sp)
	ld32	$r2, 24($sp)
	ld32	$r3, 16($sp)
	addiu32	$r3, $r3, 16
	st32	$r3, 8($sp)
	addiu32	$r4, $r2, 16
	addiu32	$r5, $r1, 16
	ld32	$r6, %call16(Field2Add)($gp)
	jalr	$r6
	nop
	ld32	$r1, 20($sp)
	ld32	$r2, 24($sp)
	ld32	$r3, 16($sp)
	addiu32	$r3, $r3, 32
	st32	$r3, 8($sp)
	addiu32	$r4, $r2, 32
	addiu32	$r5, $r1, 32
	ld32	$r6, %call16(Field2Add)($gp)
	jalr	$r6
	nop
	addiu32	$r2, $zero, 0
	ld32	$lr, 28($sp)            # 4-byte Folded Reload
	addiu32	$sp, $sp, 32
	ret	$lr
	nop
	.set	macro
	.set	reorder
	.end	Field6Add
$func_end18:
	.size	Field6Add, ($func_end18)-Field6Add

	.globl	Field6Sub
	.align	2
	.type	Field6Sub,@function
	.ent	Field6Sub               # @Field6Sub
Field6Sub:
	.frame	$fp,32,$lr
	.mask 	0x00800000008000000080000000800000,-8
	.set	noreorder
	.cpload	$t9
	.set	nomacro
# BB#0:                                 # %entry
	lui	$r2, %hi(_gp_disp)
	addiu32	$r2, $r2, %lo(_gp_disp)
	addiu32	$sp, $sp, -32
	st32	$lr, 28($sp)            # 4-byte Folded Spill
	ld32	$r1, 40($sp)
	st32	$r4, 24($sp)
	st32	$r5, 20($sp)
	st32	$r1, 16($sp)
	ld32	$r5, 20($sp)
	ld32	$r4, 24($sp)
	st32	$r1, 8($sp)
	ld32	$r6, %call16(Field2Sub)($gp)
	jalr	$r6
	nop
	ld32	$r1, 20($sp)
	ld32	$r2, 24($sp)
	ld32	$r3, 16($sp)
	addiu32	$r3, $r3, 16
	st32	$r3, 8($sp)
	addiu32	$r4, $r2, 16
	addiu32	$r5, $r1, 16
	ld32	$r6, %call16(Field2Sub)($gp)
	jalr	$r6
	nop
	ld32	$r1, 20($sp)
	ld32	$r2, 24($sp)
	ld32	$r3, 16($sp)
	addiu32	$r3, $r3, 32
	st32	$r3, 8($sp)
	addiu32	$r4, $r2, 32
	addiu32	$r5, $r1, 32
	ld32	$r6, %call16(Field2Sub)($gp)
	jalr	$r6
	nop
	addiu32	$r2, $zero, 0
	ld32	$lr, 28($sp)            # 4-byte Folded Reload
	addiu32	$sp, $sp, 32
	ret	$lr
	nop
	.set	macro
	.set	reorder
	.end	Field6Sub
$func_end19:
	.size	Field6Sub, ($func_end19)-Field6Sub

	.globl	Field6Neg
	.align	2
	.type	Field6Neg,@function
	.ent	Field6Neg               # @Field6Neg
Field6Neg:
	.frame	$fp,24,$lr
	.mask 	0x00800000008000000080000000800000,-8
	.set	noreorder
	.cpload	$t9
	.set	nomacro
# BB#0:                                 # %entry
	lui	$r2, %hi(_gp_disp)
	addiu32	$r2, $r2, %lo(_gp_disp)
	addiu32	$sp, $sp, -24
	st32	$lr, 20($sp)            # 4-byte Folded Spill
	st32	$r4, 16($sp)
	st32	$r5, 12($sp)
	ld32	$r4, 16($sp)
	ld32	$r6, %call16(Field2Neg)($gp)
	jalr	$r6
	nop
	ld32	$r1, 12($sp)
	ld32	$r2, 16($sp)
	addiu32	$r4, $r2, 16
	addiu32	$r5, $r1, 16
	ld32	$r6, %call16(Field2Neg)($gp)
	jalr	$r6
	nop
	ld32	$r1, 12($sp)
	ld32	$r2, 16($sp)
	addiu32	$r4, $r2, 32
	addiu32	$r5, $r1, 32
	ld32	$r6, %call16(Field2Neg)($gp)
	jalr	$r6
	nop
	addiu32	$r2, $zero, 0
	ld32	$lr, 20($sp)            # 4-byte Folded Reload
	addiu32	$sp, $sp, 24
	ret	$lr
	nop
	.set	macro
	.set	reorder
	.end	Field6Neg
$func_end20:
	.size	Field6Neg, ($func_end20)-Field6Neg

	.globl	Field6Mul
	.align	2
	.type	Field6Mul,@function
	.ent	Field6Mul               # @Field6Mul
Field6Mul:
	.frame	$fp,160,$lr
	.mask 	0x00a0000000a0000000a0000000a00000,-8
	.set	noreorder
	.cpload	$t9
	.set	nomacro
# BB#0:                                 # %entry
	lui	$r2, %hi(_gp_disp)
	addiu32	$r2, $r2, %lo(_gp_disp)
	addiu32	$sp, $sp, -160
	st32	$lr, 156($sp)           # 4-byte Folded Spill
	st32	$fp, 152($sp)           # 4-byte Folded Spill
	ld32	$r1, 168($sp)
	st32	$r4, 148($sp)
	st32	$r5, 144($sp)
	st32	$r1, 140($sp)
	ld32	$r5, 144($sp)
	ld32	$r4, 148($sp)
	addiu	$r1, $sp, 120
	st32	$r1, 20($sp)            # 4-byte Folded Spill
	st32	$r1, 8($sp)
	ld32	$r6, %call16(Field2Mul)($gp)
	jalr	$r6
	nop
	ld32	$r1, 144($sp)
	ld32	$r2, 148($sp)
	addiu	$r3, $sp, 104
	st32	$r3, 24($sp)            # 4-byte Folded Spill
	st32	$r3, 8($sp)
	addiu32	$r4, $r2, 16
	addiu32	$r5, $r1, 16
	ld32	$r6, %call16(Field2Mul)($gp)
	jalr	$r6
	nop
	ld32	$r1, 144($sp)
	ld32	$r2, 148($sp)
	addiu	$r3, $sp, 88
	st32	$r3, 16($sp)            # 4-byte Folded Spill
	st32	$r3, 8($sp)
	addiu32	$r4, $r2, 32
	addiu32	$r5, $r1, 32
	ld32	$r6, %call16(Field2Mul)($gp)
	jalr	$r6
	nop
	ld32	$r1, 148($sp)
	addiu	$r2, $sp, 72
	st32	$r2, 32($sp)            # 4-byte Folded Spill
	st32	$r2, 32($sp)            # 4-byte Folded Spill
	st32	$r2, 8($sp)
	addu	$fp, $zero, $r2
	addiu32	$r4, $r1, 16
	addiu32	$r5, $r1, 32
	ld32	$r6, %call16(Field2Add)($gp)
	jalr	$r6
	nop
	ld32	$r1, 144($sp)
	addiu	$r2, $sp, 56
	st32	$r2, 36($sp)            # 4-byte Folded Spill
	st32	$r2, 36($sp)            # 4-byte Folded Spill
	st32	$r2, 8($sp)
	addiu32	$r4, $r1, 16
	addiu32	$r5, $r1, 32
	ld32	$r6, %call16(Field2Add)($gp)
	jalr	$r6
	nop
	addiu	$r1, $sp, 40
	st32	$r1, 28($sp)            # 4-byte Folded Spill
	st32	$r1, 28($sp)            # 4-byte Folded Spill
	st32	$r1, 8($sp)
	ld32	$r6, %call16(Field2Mul)($gp)
	addu	$r4, $zero, $fp
	ld32	$fp, 36($sp)            # 4-byte Folded Reload
	st32	$fp, 36($sp)            # 4-byte Folded Spill
	addu	$r5, $zero, $fp
	jalr	$r6
	nop
	ld32	$r1, 32($sp)            # 4-byte Folded Reload
	st32	$r1, 8($sp)
	ld32	$r6, %call16(Field2Add)($gp)
	ld32	$r4, 24($sp)            # 4-byte Folded Reload
	ld32	$r5, 16($sp)            # 4-byte Folded Reload
	jalr	$r6
	nop
	st32	$fp, 8($sp)
	ld32	$r6, %call16(Field2Sub)($gp)
	ld32	$fp, 28($sp)            # 4-byte Folded Reload
	addu	$r4, $zero, $fp
	ld32	$r5, 32($sp)            # 4-byte Folded Reload
	jalr	$r6
	nop
	ld32	$r6, %call16(Field2MulYemeseilong)($gp)
	ld32	$r4, 36($sp)            # 4-byte Folded Reload
	addu	$r5, $zero, $fp
	jalr	$r6
	nop
	ld32	$r1, 140($sp)
	st32	$r1, 8($sp)
	ld32	$r6, %call16(Field2Add)($gp)
	addu	$r4, $zero, $fp
	ld32	$r5, 20($sp)            # 4-byte Folded Reload
	jalr	$r6
	nop
	ld32	$r4, 148($sp)
	ld32	$fp, 32($sp)            # 4-byte Folded Reload
	st32	$fp, 32($sp)            # 4-byte Folded Spill
	st32	$fp, 8($sp)
	addiu32	$r5, $r4, 16
	ld32	$r6, %call16(Field2Add)($gp)
	jalr	$r6
	nop
	ld32	$r4, 144($sp)
	ld32	$r1, 36($sp)            # 4-byte Folded Reload
	st32	$r1, 8($sp)
	addiu32	$r5, $r4, 16
	ld32	$r6, %call16(Field2Add)($gp)
	jalr	$r6
	nop
	ld32	$r1, 28($sp)            # 4-byte Folded Reload
	st32	$r1, 8($sp)
	ld32	$r6, %call16(Field2Mul)($gp)
	addu	$r4, $zero, $fp
	ld32	$r5, 36($sp)            # 4-byte Folded Reload
	jalr	$r6
	nop
	st32	$fp, 8($sp)
	ld32	$r6, %call16(Field2Add)($gp)
	ld32	$r4, 20($sp)            # 4-byte Folded Reload
	ld32	$r5, 24($sp)            # 4-byte Folded Reload
	jalr	$r6
	nop
	ld32	$r1, 36($sp)            # 4-byte Folded Reload
	st32	$r1, 8($sp)
	ld32	$r6, %call16(Field2Sub)($gp)
	ld32	$r4, 28($sp)            # 4-byte Folded Reload
	addu	$r5, $zero, $fp
	jalr	$r6
	nop
	ld32	$r6, %call16(Field2MulYemeseilong)($gp)
	ld32	$r4, 16($sp)            # 4-byte Folded Reload
	addu	$r5, $zero, $fp
	jalr	$r6
	nop
	ld32	$r1, 140($sp)
	addiu32	$r1, $r1, 16
	st32	$r1, 8($sp)
	ld32	$r6, %call16(Field2Add)($gp)
	ld32	$r4, 36($sp)            # 4-byte Folded Reload
	addu	$r5, $zero, $fp
	jalr	$r6
	nop
	ld32	$r4, 148($sp)
	st32	$fp, 8($sp)
	addiu32	$r5, $r4, 32
	ld32	$r6, %call16(Field2Add)($gp)
	jalr	$r6
	nop
	ld32	$r4, 144($sp)
	ld32	$fp, 36($sp)            # 4-byte Folded Reload
	st32	$fp, 36($sp)            # 4-byte Folded Spill
	st32	$fp, 8($sp)
	addiu32	$r5, $r4, 32
	ld32	$r6, %call16(Field2Add)($gp)
	jalr	$r6
	nop
	ld32	$r1, 28($sp)            # 4-byte Folded Reload
	st32	$r1, 8($sp)
	ld32	$r6, %call16(Field2Mul)($gp)
	ld32	$r4, 32($sp)            # 4-byte Folded Reload
	addu	$r5, $zero, $fp
	jalr	$r6
	nop
	ld32	$fp, 32($sp)            # 4-byte Folded Reload
	st32	$fp, 8($sp)
	ld32	$r6, %call16(Field2Add)($gp)
	ld32	$r4, 20($sp)            # 4-byte Folded Reload
	ld32	$r5, 16($sp)            # 4-byte Folded Reload
	jalr	$r6
	nop
	ld32	$r1, 36($sp)            # 4-byte Folded Reload
	st32	$r1, 8($sp)
	ld32	$r6, %call16(Field2Sub)($gp)
	ld32	$r4, 28($sp)            # 4-byte Folded Reload
	addu	$r5, $zero, $fp
	jalr	$r6
	nop
	ld32	$r1, 140($sp)
	addiu32	$r1, $r1, 32
	st32	$r1, 8($sp)
	ld32	$r6, %call16(Field2Add)($gp)
	ld32	$r4, 36($sp)            # 4-byte Folded Reload
	ld32	$r5, 24($sp)            # 4-byte Folded Reload
	jalr	$r6
	nop
	addiu32	$r2, $zero, 0
	ld32	$fp, 152($sp)           # 4-byte Folded Reload
	ld32	$lr, 156($sp)           # 4-byte Folded Reload
	addiu32	$sp, $sp, 160
	ret	$lr
	nop
	.set	macro
	.set	reorder
	.end	Field6Mul
$func_end21:
	.size	Field6Mul, ($func_end21)-Field6Mul

	.globl	Field6Squaring
	.align	2
	.type	Field6Squaring,@function
	.ent	Field6Squaring          # @Field6Squaring
Field6Squaring:
	.frame	$fp,32,$lr
	.mask 	0x00800000008000000080000000800000,-8
	.set	noreorder
	.cpload	$t9
	.set	nomacro
# BB#0:                                 # %entry
	lui	$r2, %hi(_gp_disp)
	addiu32	$r2, $r2, %lo(_gp_disp)
	addiu32	$sp, $sp, -32
	st32	$lr, 28($sp)            # 4-byte Folded Spill
	st32	$r4, 24($sp)
	st32	$r5, 20($sp)
	ld32	$r4, 24($sp)
	st32	$r5, 8($sp)
	ld32	$r6, %call16(Field6Mul)($gp)
	addu	$r5, $zero, $r4
	jalr	$r6
	nop
	addiu32	$r2, $zero, 0
	ld32	$lr, 28($sp)            # 4-byte Folded Reload
	addiu32	$sp, $sp, 32
	ret	$lr
	nop
	.set	macro
	.set	reorder
	.end	Field6Squaring
$func_end22:
	.size	Field6Squaring, ($func_end22)-Field6Squaring

	.globl	Field6MulGama
	.align	2
	.type	Field6MulGama,@function
	.ent	Field6MulGama           # @Field6MulGama
Field6MulGama:
	.frame	$fp,32,$lr
	.mask 	0x00a0000000a0000000a0000000a00000,-8
	.set	noreorder
	.cpload	$t9
	.set	nomacro
# BB#0:                                 # %entry
	lui	$r2, %hi(_gp_disp)
	addiu32	$r2, $r2, %lo(_gp_disp)
	addiu32	$sp, $sp, -32
	st32	$lr, 28($sp)            # 4-byte Folded Spill
	st32	$fp, 24($sp)            # 4-byte Folded Spill
	st32	$r4, 20($sp)
	st32	$r5, 16($sp)
	ld32	$r1, 20($sp)
	addiu32	$r4, $r1, 32
	ld32	$r6, %call16(Field2MulYemeseilong)($gp)
	jalr	$r6
	nop
	ld32	$fp, 16($sp)
	st32	$fp, 12($sp)            # 4-byte Folded Spill
	ld32	$fp, 20($sp)
	st32	$fp, 8($sp)             # 4-byte Folded Spill
	ld32	$r1, 12($fp)
	ld32	$fp, 12($sp)            # 4-byte Folded Reload
	st32	$r1, 28($fp)
	ld32	$fp, 8($sp)             # 4-byte Folded Reload
	ld32	$r1, 8($fp)
	ld32	$fp, 12($sp)            # 4-byte Folded Reload
	st32	$r1, 24($fp)
	ld32	$fp, 8($sp)             # 4-byte Folded Reload
	ld32	$r1, 4($fp)
	ld32	$fp, 12($sp)            # 4-byte Folded Reload
	st32	$r1, 20($fp)
	ld32	$fp, 8($sp)             # 4-byte Folded Reload
	ld32	$r1, 0($fp)
	ld32	$fp, 12($sp)            # 4-byte Folded Reload
	st32	$r1, 16($fp)
	ld32	$fp, 16($sp)
	st32	$fp, 12($sp)            # 4-byte Folded Spill
	ld32	$fp, 20($sp)
	st32	$fp, 8($sp)             # 4-byte Folded Spill
	ld32	$r1, 28($fp)
	ld32	$fp, 12($sp)            # 4-byte Folded Reload
	st32	$r1, 44($fp)
	ld32	$fp, 8($sp)             # 4-byte Folded Reload
	ld32	$r1, 24($fp)
	ld32	$fp, 12($sp)            # 4-byte Folded Reload
	st32	$r1, 40($fp)
	ld32	$fp, 8($sp)             # 4-byte Folded Reload
	ld32	$r1, 20($fp)
	ld32	$fp, 12($sp)            # 4-byte Folded Reload
	st32	$r1, 36($fp)
	ld32	$fp, 8($sp)             # 4-byte Folded Reload
	ld32	$r1, 16($fp)
	ld32	$fp, 12($sp)            # 4-byte Folded Reload
	st32	$r1, 32($fp)
	addiu32	$r2, $zero, 0
	ld32	$fp, 24($sp)            # 4-byte Folded Reload
	ld32	$lr, 28($sp)            # 4-byte Folded Reload
	addiu32	$sp, $sp, 32
	ret	$lr
	nop
	.set	macro
	.set	reorder
	.end	Field6MulGama
$func_end23:
	.size	Field6MulGama, ($func_end23)-Field6MulGama

	.globl	Field6Copy
	.align	2
	.type	Field6Copy,@function
	.ent	Field6Copy              # @Field6Copy
Field6Copy:
	.frame	$fp,24,$lr
	.mask 	0x00800000008000000080000000800000,-8
	.set	noreorder
	.cpload	$t9
	.set	nomacro
# BB#0:                                 # %entry
	lui	$r2, %hi(_gp_disp)
	addiu32	$r2, $r2, %lo(_gp_disp)
	addiu32	$sp, $sp, -24
	st32	$lr, 20($sp)            # 4-byte Folded Spill
	st32	$r4, 16($sp)
	st32	$r5, 12($sp)
	ld32	$r4, 16($sp)
	ld32	$r6, %call16(Field2Copy)($gp)
	jalr	$r6
	nop
	ld32	$r1, 12($sp)
	ld32	$r2, 16($sp)
	addiu32	$r4, $r2, 16
	addiu32	$r5, $r1, 16
	ld32	$r6, %call16(Field2Copy)($gp)
	jalr	$r6
	nop
	ld32	$r1, 12($sp)
	ld32	$r2, 16($sp)
	addiu32	$r4, $r2, 32
	addiu32	$r5, $r1, 32
	ld32	$r6, %call16(Field2Copy)($gp)
	jalr	$r6
	nop
	addiu32	$r2, $zero, 0
	ld32	$lr, 20($sp)            # 4-byte Folded Reload
	addiu32	$sp, $sp, 24
	ret	$lr
	nop
	.set	macro
	.set	reorder
	.end	Field6Copy
$func_end24:
	.size	Field6Copy, ($func_end24)-Field6Copy

	.globl	Field6Inverse
	.align	2
	.type	Field6Inverse,@function
	.ent	Field6Inverse           # @Field6Inverse
Field6Inverse:
	.frame	$fp,280,$lr
	.mask 	0x00a0000000a0000000a0000000a00000,-8
	.set	noreorder
	.cpload	$t9
	.set	nomacro
# BB#0:                                 # %entry
	lui	$r2, %hi(_gp_disp)
	addiu32	$r2, $r2, %lo(_gp_disp)
	addiu32	$sp, $sp, -280
	st32	$lr, 276($sp)           # 4-byte Folded Spill
	st32	$fp, 272($sp)           # 4-byte Folded Spill
	st32	$r4, 268($sp)
	st64	$gwr4, 256($sp)
	st64	$gwr5, 248($sp)
	st32	$r5, 244($sp)
	ld32	$r4, 268($sp)
	ld32	$r6, %call16(Field2Squaring)($gp)
	addiu	$r5, $sp, 224
	st32	$r5, 36($sp)            # 4-byte Folded Spill
	jalr	$r6
	nop
	ld32	$r1, 268($sp)
	addiu32	$r4, $r1, 16
	addiu	$r5, $sp, 208
	st32	$r5, 44($sp)            # 4-byte Folded Spill
	ld32	$r6, %call16(Field2Squaring)($gp)
	jalr	$r6
	nop
	ld32	$r1, 268($sp)
	addiu32	$r4, $r1, 32
	addiu	$r5, $sp, 192
	st32	$r5, 24($sp)            # 4-byte Folded Spill
	ld32	$r6, %call16(Field2Squaring)($gp)
	jalr	$r6
	nop
	ld32	$r4, 268($sp)
	addiu	$r1, $sp, 176
	st32	$r1, 28($sp)            # 4-byte Folded Spill
	st32	$r1, 8($sp)
	addiu32	$r5, $r4, 16
	ld32	$r6, %call16(Field2Mul)($gp)
	jalr	$r6
	nop
	ld32	$r4, 268($sp)
	addiu	$r1, $sp, 160
	st32	$r1, 20($sp)            # 4-byte Folded Spill
	st32	$r1, 8($sp)
	addiu32	$r5, $r4, 32
	ld32	$r6, %call16(Field2Mul)($gp)
	jalr	$r6
	nop
	ld32	$r1, 268($sp)
	addiu	$r2, $sp, 144
	st32	$r2, 32($sp)            # 4-byte Folded Spill
	st32	$r2, 8($sp)
	addiu32	$r4, $r1, 16
	addiu32	$r5, $r1, 32
	ld32	$r6, %call16(Field2Mul)($gp)
	jalr	$r6
	nop
	addiu	$fp, $sp, 112
	st32	$fp, 40($sp)            # 4-byte Folded Spill
	st32	$fp, 40($sp)            # 4-byte Folded Spill
	ld32	$r6, %call16(Field2MulYemeseilong)($gp)
	ld32	$r4, 32($sp)            # 4-byte Folded Reload
	addu	$r5, $zero, $fp
	jalr	$r6
	nop
	addiu	$r1, $sp, 80
	st32	$r1, 32($sp)            # 4-byte Folded Spill
	st32	$r1, 8($sp)
	ld32	$r6, %call16(Field2Sub)($gp)
	ld32	$r4, 36($sp)            # 4-byte Folded Reload
	addu	$r5, $zero, $fp
	jalr	$r6
	nop
	ld32	$r6, %call16(Field2MulYemeseilong)($gp)
	ld32	$r4, 24($sp)            # 4-byte Folded Reload
	addu	$r5, $zero, $fp
	jalr	$r6
	nop
	addiu	$r1, $sp, 64
	st32	$r1, 24($sp)            # 4-byte Folded Spill
	st32	$r1, 8($sp)
	ld32	$r6, %call16(Field2Sub)($gp)
	addu	$r4, $zero, $fp
	ld32	$r5, 28($sp)            # 4-byte Folded Reload
	jalr	$r6
	nop
	addiu	$r1, $sp, 48
	st32	$r1, 28($sp)            # 4-byte Folded Spill
	st32	$r1, 8($sp)
	ld32	$r6, %call16(Field2Sub)($gp)
	ld32	$r4, 44($sp)            # 4-byte Folded Reload
	ld32	$r5, 20($sp)            # 4-byte Folded Reload
	jalr	$r6
	nop
	ld32	$r4, 268($sp)
	addiu	$r1, $sp, 128
	st32	$r1, 44($sp)            # 4-byte Folded Spill
	st32	$r1, 8($sp)
	ld32	$r6, %call16(Field2Mul)($gp)
	ld32	$r5, 32($sp)            # 4-byte Folded Reload
	jalr	$r6
	nop
	ld32	$r1, 268($sp)
	st32	$fp, 8($sp)
	addiu32	$r4, $r1, 32
	ld32	$r6, %call16(Field2Mul)($gp)
	ld32	$r5, 24($sp)            # 4-byte Folded Reload
	jalr	$r6
	nop
	addiu	$r5, $sp, 96
	st32	$r5, 36($sp)            # 4-byte Folded Spill
	ld32	$r6, %call16(Field2MulYemeseilong)($gp)
	addu	$r4, $zero, $fp
	jalr	$r6
	nop
	st32	$fp, 8($sp)
	ld32	$r6, %call16(Field2Add)($gp)
	ld32	$fp, 44($sp)            # 4-byte Folded Reload
	st32	$fp, 44($sp)            # 4-byte Folded Spill
	addu	$r4, $zero, $fp
	ld32	$r5, 36($sp)            # 4-byte Folded Reload
	jalr	$r6
	nop
	ld32	$r6, %call16(Field2Copy)($gp)
	ld32	$r4, 40($sp)            # 4-byte Folded Reload
	addu	$r5, $zero, $fp
	jalr	$r6
	nop
	ld32	$r1, 268($sp)
	ld32	$fp, 40($sp)            # 4-byte Folded Reload
	st32	$fp, 8($sp)
	addiu32	$r4, $r1, 16
	ld32	$r6, %call16(Field2Mul)($gp)
	ld32	$r5, 28($sp)            # 4-byte Folded Reload
	jalr	$r6
	nop
	ld32	$r6, %call16(Field2MulYemeseilong)($gp)
	addu	$r4, $zero, $fp
	ld32	$r5, 36($sp)            # 4-byte Folded Reload
	jalr	$r6
	nop
	st32	$fp, 8($sp)
	ld32	$r6, %call16(Field2Add)($gp)
	ld32	$fp, 44($sp)            # 4-byte Folded Reload
	st32	$fp, 44($sp)            # 4-byte Folded Spill
	addu	$r4, $zero, $fp
	ld32	$r5, 36($sp)            # 4-byte Folded Reload
	jalr	$r6
	nop
	ld32	$r6, %call16(Field2Copy)($gp)
	ld32	$r4, 40($sp)            # 4-byte Folded Reload
	addu	$r5, $zero, $fp
	jalr	$r6
	nop
	ld64	$gwr5, 248($sp)
	ld64	$gwr4, 256($sp)
	ld32	$r6, %call16(Field2Inverse)($gp)
	addu	$r4, $zero, $fp
	ld32	$fp, 40($sp)            # 4-byte Folded Reload
	addu	$r5, $zero, $fp
	jalr	$r6
	nop
	ld32	$r6, %call16(Field2Copy)($gp)
	addu	$r4, $zero, $fp
	ld32	$fp, 44($sp)            # 4-byte Folded Reload
	addu	$r5, $zero, $fp
	jalr	$r6
	nop
	ld32	$r1, 244($sp)
	st32	$r1, 8($sp)
	ld32	$r6, %call16(Field2Mul)($gp)
	ld32	$r4, 32($sp)            # 4-byte Folded Reload
	addu	$r5, $zero, $fp
	jalr	$r6
	nop
	ld32	$r1, 244($sp)
	addiu32	$r1, $r1, 16
	st32	$r1, 8($sp)
	ld32	$r6, %call16(Field2Mul)($gp)
	ld32	$r4, 24($sp)            # 4-byte Folded Reload
	addu	$r5, $zero, $fp
	jalr	$r6
	nop
	ld32	$r1, 244($sp)
	addiu32	$r1, $r1, 32
	st32	$r1, 8($sp)
	ld32	$r6, %call16(Field2Mul)($gp)
	ld32	$r4, 28($sp)            # 4-byte Folded Reload
	addu	$r5, $zero, $fp
	jalr	$r6
	nop
	addiu32	$r2, $zero, 0
	ld32	$fp, 272($sp)           # 4-byte Folded Reload
	ld32	$lr, 276($sp)           # 4-byte Folded Reload
	addiu32	$sp, $sp, 280
	ret	$lr
	nop
	.set	macro
	.set	reorder
	.end	Field6Inverse
$func_end25:
	.size	Field6Inverse, ($func_end25)-Field6Inverse

	.globl	Field12Add
	.align	2
	.type	Field12Add,@function
	.ent	Field12Add              # @Field12Add
Field12Add:
	.frame	$fp,32,$lr
	.mask 	0x00800000008000000080000000800000,-8
	.set	noreorder
	.cpload	$t9
	.set	nomacro
# BB#0:                                 # %entry
	lui	$r2, %hi(_gp_disp)
	addiu32	$r2, $r2, %lo(_gp_disp)
	addiu32	$sp, $sp, -32
	st32	$lr, 28($sp)            # 4-byte Folded Spill
	ld32	$r1, 40($sp)
	st32	$r4, 24($sp)
	st32	$r5, 20($sp)
	st32	$r1, 16($sp)
	ld32	$r5, 20($sp)
	ld32	$r4, 24($sp)
	st32	$r1, 8($sp)
	ld32	$r6, %call16(Field6Add)($gp)
	jalr	$r6
	nop
	ld32	$r1, 20($sp)
	ld32	$r2, 24($sp)
	ld32	$r3, 16($sp)
	addiu32	$r3, $r3, 48
	st32	$r3, 8($sp)
	addiu32	$r4, $r2, 48
	addiu32	$r5, $r1, 48
	ld32	$r6, %call16(Field6Add)($gp)
	jalr	$r6
	nop
	addiu32	$r2, $zero, 0
	ld32	$lr, 28($sp)            # 4-byte Folded Reload
	addiu32	$sp, $sp, 32
	ret	$lr
	nop
	.set	macro
	.set	reorder
	.end	Field12Add
$func_end26:
	.size	Field12Add, ($func_end26)-Field12Add

	.globl	Field12Sub
	.align	2
	.type	Field12Sub,@function
	.ent	Field12Sub              # @Field12Sub
Field12Sub:
	.frame	$fp,32,$lr
	.mask 	0x00800000008000000080000000800000,-8
	.set	noreorder
	.cpload	$t9
	.set	nomacro
# BB#0:                                 # %entry
	lui	$r2, %hi(_gp_disp)
	addiu32	$r2, $r2, %lo(_gp_disp)
	addiu32	$sp, $sp, -32
	st32	$lr, 28($sp)            # 4-byte Folded Spill
	ld32	$r1, 40($sp)
	st32	$r4, 24($sp)
	st32	$r5, 20($sp)
	st32	$r1, 16($sp)
	ld32	$r5, 20($sp)
	ld32	$r4, 24($sp)
	st32	$r1, 8($sp)
	ld32	$r6, %call16(Field6Sub)($gp)
	jalr	$r6
	nop
	ld32	$r1, 20($sp)
	ld32	$r2, 24($sp)
	ld32	$r3, 16($sp)
	addiu32	$r3, $r3, 48
	st32	$r3, 8($sp)
	addiu32	$r4, $r2, 48
	addiu32	$r5, $r1, 48
	ld32	$r6, %call16(Field6Sub)($gp)
	jalr	$r6
	nop
	addiu32	$r2, $zero, 0
	ld32	$lr, 28($sp)            # 4-byte Folded Reload
	addiu32	$sp, $sp, 32
	ret	$lr
	nop
	.set	macro
	.set	reorder
	.end	Field12Sub
$func_end27:
	.size	Field12Sub, ($func_end27)-Field12Sub

	.globl	Field12Conjugate
	.align	2
	.type	Field12Conjugate,@function
	.ent	Field12Conjugate        # @Field12Conjugate
Field12Conjugate:
	.frame	$fp,24,$lr
	.mask 	0x00800000008000000080000000800000,-8
	.set	noreorder
	.cpload	$t9
	.set	nomacro
# BB#0:                                 # %entry
	lui	$r2, %hi(_gp_disp)
	addiu32	$r2, $r2, %lo(_gp_disp)
	addiu32	$sp, $sp, -24
	st32	$lr, 20($sp)            # 4-byte Folded Spill
	st32	$r4, 16($sp)
	st32	$r5, 12($sp)
	ld32	$r4, 16($sp)
	ld32	$r6, %call16(Field6Copy)($gp)
	jalr	$r6
	nop
	ld32	$r1, 12($sp)
	ld32	$r2, 16($sp)
	addiu32	$r4, $r2, 48
	addiu32	$r5, $r1, 48
	ld32	$r6, %call16(Field6Neg)($gp)
	jalr	$r6
	nop
	addiu32	$r2, $zero, 0
	ld32	$lr, 20($sp)            # 4-byte Folded Reload
	addiu32	$sp, $sp, 24
	ret	$lr
	nop
	.set	macro
	.set	reorder
	.end	Field12Conjugate
$func_end28:
	.size	Field12Conjugate, ($func_end28)-Field12Conjugate

	.globl	Field12Mul
	.align	2
	.type	Field12Mul,@function
	.ent	Field12Mul              # @Field12Mul
Field12Mul:
	.frame	$fp,352,$lr
	.mask 	0x00a0000000a0000000a0000000a00000,-8
	.set	noreorder
	.cpload	$t9
	.set	nomacro
# BB#0:                                 # %entry
	lui	$r2, %hi(_gp_disp)
	addiu32	$r2, $r2, %lo(_gp_disp)
	addiu32	$sp, $sp, -352
	st32	$lr, 348($sp)           # 4-byte Folded Spill
	st32	$fp, 344($sp)           # 4-byte Folded Spill
	ld32	$r1, 360($sp)
	st32	$r4, 340($sp)
	st32	$r5, 336($sp)
	st32	$r1, 332($sp)
	ld32	$r5, 336($sp)
	ld32	$r4, 340($sp)
	addiu	$r1, $sp, 280
	st32	$r1, 36($sp)            # 4-byte Folded Spill
	st32	$r1, 8($sp)
	ld32	$r6, %call16(Field6Mul)($gp)
	jalr	$r6
	nop
	ld32	$r1, 336($sp)
	ld32	$r2, 340($sp)
	addiu	$fp, $sp, 232
	st32	$fp, 32($sp)            # 4-byte Folded Spill
	st32	$fp, 8($sp)
	addiu32	$r4, $r2, 48
	addiu32	$r5, $r1, 48
	ld32	$r6, %call16(Field6Mul)($gp)
	jalr	$r6
	nop
	addiu	$r5, $sp, 184
	st32	$r5, 28($sp)            # 4-byte Folded Spill
	ld32	$r6, %call16(Field6MulGama)($gp)
	addu	$r4, $zero, $fp
	addu	$fp, $zero, $r5
	jalr	$r6
	nop
	ld32	$r1, 332($sp)
	st32	$r1, 8($sp)
	ld32	$r6, %call16(Field6Add)($gp)
	ld32	$r4, 36($sp)            # 4-byte Folded Reload
	addu	$r5, $zero, $fp
	jalr	$r6
	nop
	ld32	$r4, 340($sp)
	addiu	$r1, $sp, 136
	st32	$r1, 24($sp)            # 4-byte Folded Spill
	st32	$r1, 8($sp)
	addiu32	$r5, $r4, 48
	ld32	$r6, %call16(Field6Add)($gp)
	jalr	$r6
	nop
	ld32	$r4, 336($sp)
	addiu	$fp, $sp, 88
	st32	$fp, 8($sp)
	addiu32	$r5, $r4, 48
	ld32	$r6, %call16(Field6Add)($gp)
	jalr	$r6
	nop
	addiu	$r1, $sp, 40
	st32	$r1, 20($sp)            # 4-byte Folded Spill
	st32	$r1, 8($sp)
	ld32	$r6, %call16(Field6Mul)($gp)
	ld32	$r4, 24($sp)            # 4-byte Folded Reload
	addu	$r5, $zero, $fp
	jalr	$r6
	nop
	ld32	$fp, 28($sp)            # 4-byte Folded Reload
	st32	$fp, 8($sp)
	ld32	$r6, %call16(Field6Add)($gp)
	ld32	$r4, 36($sp)            # 4-byte Folded Reload
	ld32	$r5, 32($sp)            # 4-byte Folded Reload
	jalr	$r6
	nop
	ld32	$r1, 332($sp)
	addiu32	$r1, $r1, 48
	st32	$r1, 8($sp)
	ld32	$r6, %call16(Field6Sub)($gp)
	ld32	$r4, 20($sp)            # 4-byte Folded Reload
	addu	$r5, $zero, $fp
	jalr	$r6
	nop
	addiu32	$r2, $zero, 0
	ld32	$fp, 344($sp)           # 4-byte Folded Reload
	ld32	$lr, 348($sp)           # 4-byte Folded Reload
	addiu32	$sp, $sp, 352
	ret	$lr
	nop
	.set	macro
	.set	reorder
	.end	Field12Mul
$func_end29:
	.size	Field12Mul, ($func_end29)-Field12Mul

	.globl	Field12Squaring
	.align	2
	.type	Field12Squaring,@function
	.ent	Field12Squaring         # @Field12Squaring
Field12Squaring:
	.frame	$fp,32,$lr
	.mask 	0x00800000008000000080000000800000,-8
	.set	noreorder
	.cpload	$t9
	.set	nomacro
# BB#0:                                 # %entry
	lui	$r2, %hi(_gp_disp)
	addiu32	$r2, $r2, %lo(_gp_disp)
	addiu32	$sp, $sp, -32
	st32	$lr, 28($sp)            # 4-byte Folded Spill
	st32	$r4, 24($sp)
	st32	$r5, 20($sp)
	ld32	$r4, 24($sp)
	st32	$r5, 8($sp)
	ld32	$r6, %call16(Field12Mul)($gp)
	addu	$r5, $zero, $r4
	jalr	$r6
	nop
	addiu32	$r2, $zero, 0
	ld32	$lr, 28($sp)            # 4-byte Folded Reload
	addiu32	$sp, $sp, 32
	ret	$lr
	nop
	.set	macro
	.set	reorder
	.end	Field12Squaring
$func_end30:
	.size	Field12Squaring, ($func_end30)-Field12Squaring

	.globl	Field12Copy
	.align	2
	.type	Field12Copy,@function
	.ent	Field12Copy             # @Field12Copy
Field12Copy:
	.frame	$fp,24,$lr
	.mask 	0x00800000008000000080000000800000,-8
	.set	noreorder
	.cpload	$t9
	.set	nomacro
# BB#0:                                 # %entry
	lui	$r2, %hi(_gp_disp)
	addiu32	$r2, $r2, %lo(_gp_disp)
	addiu32	$sp, $sp, -24
	st32	$lr, 20($sp)            # 4-byte Folded Spill
	st32	$r4, 16($sp)
	st32	$r5, 12($sp)
	ld32	$r4, 16($sp)
	ld32	$r6, %call16(Field6Copy)($gp)
	jalr	$r6
	nop
	ld32	$r1, 12($sp)
	ld32	$r2, 16($sp)
	addiu32	$r4, $r2, 48
	addiu32	$r5, $r1, 48
	ld32	$r6, %call16(Field6Copy)($gp)
	jalr	$r6
	nop
	addiu32	$r2, $zero, 0
	ld32	$lr, 20($sp)            # 4-byte Folded Reload
	addiu32	$sp, $sp, 24
	ret	$lr
	nop
	.set	macro
	.set	reorder
	.end	Field12Copy
$func_end31:
	.size	Field12Copy, ($func_end31)-Field12Copy

	.globl	Field12Inverse
	.align	2
	.type	Field12Inverse,@function
	.ent	Field12Inverse          # @Field12Inverse
Field12Inverse:
	.frame	$fp,264,$lr
	.mask 	0x00a0000000a0000000a0000000a00000,-8
	.set	noreorder
	.cpload	$t9
	.set	nomacro
# BB#0:                                 # %entry
	lui	$r2, %hi(_gp_disp)
	addiu32	$r2, $r2, %lo(_gp_disp)
	addiu32	$sp, $sp, -264
	st32	$lr, 260($sp)           # 4-byte Folded Spill
	st32	$fp, 256($sp)           # 4-byte Folded Spill
	st32	$r4, 252($sp)
	st64	$gwr4, 240($sp)
	st64	$gwr5, 232($sp)
	st32	$r5, 228($sp)
	ld32	$r4, 252($sp)
	ld32	$r6, %call16(Field6Squaring)($gp)
	addiu	$r5, $sp, 176
	st32	$r5, 20($sp)            # 4-byte Folded Spill
	jalr	$r6
	nop
	ld32	$r1, 252($sp)
	addiu32	$r4, $r1, 48
	addiu	$fp, $sp, 128
	st32	$fp, 28($sp)            # 4-byte Folded Spill
	ld32	$r6, %call16(Field6Squaring)($gp)
	addu	$r5, $zero, $fp
	jalr	$r6
	nop
	addiu	$r5, $sp, 80
	st32	$r5, 24($sp)            # 4-byte Folded Spill
	ld32	$r6, %call16(Field6MulGama)($gp)
	addu	$r4, $zero, $fp
	jalr	$r6
	nop
	addiu	$r1, $sp, 32
	st32	$r1, 16($sp)            # 4-byte Folded Spill
	st32	$r1, 8($sp)
	ld32	$r6, %call16(Field6Sub)($gp)
	ld32	$fp, 20($sp)            # 4-byte Folded Reload
	addu	$r4, $zero, $fp
	ld32	$r5, 24($sp)            # 4-byte Folded Reload
	jalr	$r6
	nop
	ld32	$r6, %call16(Field6Copy)($gp)
	ld32	$r4, 16($sp)            # 4-byte Folded Reload
	addu	$r5, $zero, $fp
	jalr	$r6
	nop
	ld64	$gwr5, 232($sp)
	ld64	$gwr4, 240($sp)
	ld32	$r6, %call16(Field6Inverse)($gp)
	addu	$r4, $zero, $fp
	ld32	$fp, 28($sp)            # 4-byte Folded Reload
	st32	$fp, 28($sp)            # 4-byte Folded Spill
	addu	$r5, $zero, $fp
	jalr	$r6
	nop
	ld32	$r4, 252($sp)
	ld32	$r1, 228($sp)
	st32	$r1, 8($sp)
	ld32	$r6, %call16(Field6Mul)($gp)
	addu	$r5, $zero, $fp
	jalr	$r6
	nop
	ld32	$r1, 252($sp)
	ld32	$fp, 24($sp)            # 4-byte Folded Reload
	st32	$fp, 8($sp)
	addiu32	$r4, $r1, 48
	ld32	$r6, %call16(Field6Mul)($gp)
	ld32	$r5, 28($sp)            # 4-byte Folded Reload
	jalr	$r6
	nop
	ld32	$r1, 228($sp)
	addiu32	$r5, $r1, 48
	ld32	$r6, %call16(Field6Neg)($gp)
	addu	$r4, $zero, $fp
	jalr	$r6
	nop
	addiu32	$r2, $zero, 0
	ld32	$fp, 256($sp)           # 4-byte Folded Reload
	ld32	$lr, 260($sp)           # 4-byte Folded Reload
	addiu32	$sp, $sp, 264
	ret	$lr
	nop
	.set	macro
	.set	reorder
	.end	Field12Inverse
$func_end32:
	.size	Field12Inverse, ($func_end32)-Field12Inverse

	.globl	Field12SetOne
	.align	2
	.type	Field12SetOne,@function
	.ent	Field12SetOne           # @Field12SetOne
Field12SetOne:
	.frame	$fp,24,$lr
	.mask 	0x00800000008000000080000000800000,-8
	.set	noreorder
	.cpload	$t9
	.set	nomacro
# BB#0:                                 # %entry
	lui	$r2, %hi(_gp_disp)
	addiu32	$r2, $r2, %lo(_gp_disp)
	addiu32	$sp, $sp, -24
	st32	$lr, 20($sp)            # 4-byte Folded Spill
	st32	$r4, 16($sp)
	st64	$gwr4, 8($sp)
	ld32	$r4, 16($sp)
	ld32	$r6, %call16(Field6SetOne)($gp)
	jalr	$r6
	nop
	ld32	$r1, 16($sp)
	addiu32	$r4, $r1, 48
	ld32	$r6, %call16(Field6SetZero)($gp)
	jalr	$r6
	nop
	addiu32	$r2, $zero, 0
	ld32	$lr, 20($sp)            # 4-byte Folded Reload
	addiu32	$sp, $sp, 24
	ret	$lr
	nop
	.set	macro
	.set	reorder
	.end	Field12SetOne
$func_end33:
	.size	Field12SetOne, ($func_end33)-Field12SetOne

	.globl	Field12Exp
	.align	2
	.type	Field12Exp,@function
	.ent	Field12Exp              # @Field12Exp
Field12Exp:
	.frame	$fp,368,$lr
	.mask 	0x00a0000000a0000000a0000000a00000,-8
	.set	noreorder
	.cpload	$t9
	.set	nomacro
# BB#0:                                 # %entry
	lui	$r2, %hi(_gp_disp)
	addiu32	$r2, $r2, %lo(_gp_disp)
	addiu32	$sp, $sp, -368
	st32	$lr, 364($sp)           # 4-byte Folded Spill
	st32	$fp, 360($sp)           # 4-byte Folded Spill
	st32	$r4, 356($sp)
	st64	$gwr4, 344($sp)
	st64	$gwr5, 336($sp)
	st32	$r5, 332($sp)
	ld64	$gwr1, 344($sp)
	st64	$gwr1, 320($sp)
	ld64	$gwr4, 336($sp)
	ld32	$r4, 332($sp)
	ld32	$r6, %call16(Field12SetOne)($gp)
	jalr	$r6
	nop
	ld32	$r4, 356($sp)
	addiu	$r5, $sp, 128
	st32	$r5, 28($sp)            # 4-byte Folded Spill
	st32	$r5, 28($sp)            # 4-byte Folded Spill
	ld32	$r6, %call16(Field12Copy)($gp)
	jalr	$r6
	nop
	addiu	$r1, $sp, 224
	st32	$r1, 20($sp)            # 4-byte Folded Spill
	addiu	$r1, $sp, 32
	st32	$r1, 24($sp)            # 4-byte Folded Spill
$BB34_1:                                # %while.cond
                                        # =>This Inner Loop Header: Depth=1
	ld64	$gwr1, 320($sp)
	addiu64	$gwr2, $gwr0, 0
	cmplong	$r1, $gwr1, $gwr2
	beq	$r1, $zero, $BB34_5
	nop
# BB#2:                                 # %while.body
                                        #   in Loop: Header=BB34_1 Depth=1
	ld64	$gwr1, 320($sp)
	andi64	$gwr1, $gwr1, 1
	addiu64	$gwr2, $gwr0, 1
	cmplong	$r1, $gwr1, $gwr2
	bne	$r1, $zero, $BB34_4
	nop
# BB#3:                                 # %if.then
                                        #   in Loop: Header=BB34_1 Depth=1
	ld32	$r4, 332($sp)
	ld32	$fp, 20($sp)            # 4-byte Folded Reload
	st32	$fp, 20($sp)            # 4-byte Folded Spill
	st32	$fp, 8($sp)
	ld32	$r6, %call16(Field12Mul)($gp)
	ld32	$r5, 28($sp)            # 4-byte Folded Reload
	jalr	$r6
	nop
	ld32	$r5, 332($sp)
	ld32	$r6, %call16(Field12Copy)($gp)
	addu	$r4, $zero, $fp
	jalr	$r6
	nop
$BB34_4:                                # %if.end
                                        #   in Loop: Header=BB34_1 Depth=1
	ld32	$r6, %call16(Field12Squaring)($gp)
	ld32	$r4, 28($sp)            # 4-byte Folded Reload
	st32	$r4, 28($sp)            # 4-byte Folded Spill
	ld32	$fp, 24($sp)            # 4-byte Folded Reload
	st32	$fp, 24($sp)            # 4-byte Folded Spill
	addu	$r5, $zero, $fp
	jalr	$r6
	nop
	ld32	$r6, %call16(Field12Copy)($gp)
	addu	$r4, $zero, $fp
	ld32	$r5, 28($sp)            # 4-byte Folded Reload
	jalr	$r6
	nop
	ld64	$gwr1, 320($sp)
	sra64	$gwr1, $gwr1, 1
	st64	$gwr1, 320($sp)
	jmp	$BB34_1
	nop
$BB34_5:                                # %while.end
	addiu32	$r2, $zero, 0
	ld32	$fp, 360($sp)           # 4-byte Folded Reload
	ld32	$lr, 364($sp)           # 4-byte Folded Reload
	addiu32	$sp, $sp, 368
	ret	$lr
	nop
	.set	macro
	.set	reorder
	.end	Field12Exp
$func_end34:
	.size	Field12Exp, ($func_end34)-Field12Exp

	.globl	Point1Copy
	.align	2
	.type	Point1Copy,@function
	.ent	Point1Copy              # @Point1Copy
Point1Copy:
	.frame	$fp,16,$lr
	.mask 	0x00200000002000000020000000200000,-8
	.set	noreorder
	.set	nomacro
# BB#0:                                 # %entry
	addiu32	$sp, $sp, -16
	st32	$fp, 12($sp)            # 4-byte Folded Spill
	addu	$fp, $zero, $r5
	st32	$fp, 0($sp)             # 4-byte Folded Spill
	st32	$r4, 8($sp)
	st32	$fp, 4($sp)
	ld32	$fp, 8($sp)
	ld64	$gwr1, 0($fp)
	ld32	$fp, 0($sp)             # 4-byte Folded Reload
	st64	$gwr1, 0($fp)
	ld32	$fp, 8($sp)
	ld64	$gwr1, 8($fp)
	ld32	$fp, 4($sp)
	st64	$gwr1, 8($fp)
	ld32	$fp, 8($sp)
	ld64	$gwr1, 16($fp)
	ld32	$fp, 4($sp)
	st64	$gwr1, 16($fp)
	addiu32	$r2, $zero, 0
	ld32	$fp, 12($sp)            # 4-byte Folded Reload
	addiu32	$sp, $sp, 16
	ret	$lr
	nop
	.set	macro
	.set	reorder
	.end	Point1Copy
$func_end35:
	.size	Point1Copy, ($func_end35)-Point1Copy

	.globl	Point1Neg
	.align	2
	.type	Point1Neg,@function
	.ent	Point1Neg               # @Point1Neg
Point1Neg:
	.frame	$fp,32,$lr
	.mask 	0x00a0000000a0000000a0000000a00000,-8
	.set	noreorder
	.cpload	$t9
	.set	nomacro
# BB#0:                                 # %entry
	lui	$r2, %hi(_gp_disp)
	addiu32	$r2, $r2, %lo(_gp_disp)
	addiu32	$sp, $sp, -32
	st32	$lr, 28($sp)            # 4-byte Folded Spill
	st32	$fp, 24($sp)            # 4-byte Folded Spill
	addu	$fp, $zero, $r5
	st32	$fp, 12($sp)            # 4-byte Folded Spill
	st32	$r4, 20($sp)
	st32	$fp, 16($sp)
	ld32	$fp, 20($sp)
	ld64	$gwr1, 0($fp)
	ld32	$fp, 12($sp)            # 4-byte Folded Reload
	st64	$gwr1, 0($fp)
	ld32	$fp, 20($sp)
	ld64	$gwr4, 8($fp)
	ld32	$r6, %call16(FieldNeg)($gp)
	jalr	$r6
	nop
	ld32	$fp, 16($sp)
	st64	$gwr2, 8($fp)
	ld32	$fp, 20($sp)
	ld64	$gwr1, 16($fp)
	ld32	$fp, 16($sp)
	st64	$gwr1, 16($fp)
	addiu32	$r2, $zero, 0
	ld32	$fp, 24($sp)            # 4-byte Folded Reload
	ld32	$lr, 28($sp)            # 4-byte Folded Reload
	addiu32	$sp, $sp, 32
	ret	$lr
	nop
	.set	macro
	.set	reorder
	.end	Point1Neg
$func_end36:
	.size	Point1Neg, ($func_end36)-Point1Neg

	.globl	Point1Double
	.align	2
	.type	Point1Double,@function
	.ent	Point1Double            # @Point1Double
Point1Double:
	.frame	$fp,80,$lr
	.mask 	0x00200000002000000020000000200000,-8
	.set	noreorder
	.set	nomacro
# BB#0:                                 # %entry
	addiu32	$sp, $sp, -80
	st32	$fp, 76($sp)            # 4-byte Folded Spill
	st32	$r4, 72($sp)
	st32	$r5, 68($sp)
	ld32	$fp, 72($sp)
	ld64	$gwr1, 0($fp)
	mtswr1	$gwr1
	mtswr2	$gwr1
	montmult
	add64swr	$gwr1
	st64	$gwr1, 56($sp)
	ld32	$fp, 72($sp)
	ld64	$gwr1, 8($fp)
	mtswr1	$gwr1
	mtswr2	$gwr1
	montmult
	add64swr	$gwr1
	st64	$gwr1, 48($sp)
	mtswr1	$gwr1
	mtswr2	$gwr1
	montmult
	add64swr	$gwr1
	st64	$gwr1, 40($sp)
	ld32	$fp, 72($sp)
	ld64	$gwr1, 0($fp)
	ld64	$gwr2, 48($sp)
	addm	$gwr1, $gwr2, $gwr1
	st64	$gwr1, 32($sp)
	mtswr1	$gwr1
	mtswr2	$gwr1
	montmult
	add64swr	$gwr1
	st64	$gwr1, 32($sp)
	ld64	$gwr2, 56($sp)
	subm	$gwr1, $gwr1, $gwr2
	st64	$gwr1, 32($sp)
	ld64	$gwr2, 40($sp)
	subm	$gwr1, $gwr1, $gwr2
	st64	$gwr1, 32($sp)
	addm	$gwr1, $gwr1, $gwr1
	st64	$gwr1, 32($sp)
	ld64	$gwr1, 56($sp)
	addm	$gwr1, $gwr1, $gwr1
	st64	$gwr1, 24($sp)
	ld64	$gwr2, 56($sp)
	addm	$gwr1, $gwr2, $gwr1
	st64	$gwr1, 24($sp)
	ld32	$fp, 72($sp)
	ld64	$gwr2, 0($fp)
	addm	$gwr1, $gwr2, $gwr1
	st64	$gwr1, 8($sp)
	ld64	$gwr1, 24($sp)
	mtswr1	$gwr1
	mtswr2	$gwr1
	montmult
	add64swr	$gwr1
	st64	$gwr1, 16($sp)
	ld64	$gwr2, 32($sp)
	addm	$gwr2, $gwr2, $gwr2
	subm	$gwr1, $gwr1, $gwr2
	ld32	$fp, 68($sp)
	st64	$gwr1, 0($fp)
	ld32	$fp, 72($sp)
	ld64	$gwr1, 16($fp)
	ld64	$gwr2, 8($fp)
	addm	$gwr1, $gwr2, $gwr1
	ld32	$fp, 68($sp)
	st64	$gwr1, 16($fp)
	ld32	$fp, 68($sp)
	ld64	$gwr1, 16($fp)
	mtswr1	$gwr1
	mtswr2	$gwr1
	montmult
	add64swr	$gwr1
	st64	$gwr1, 16($fp)
	ld32	$fp, 68($sp)
	ld64	$gwr1, 16($fp)
	ld64	$gwr2, 48($sp)
	subm	$gwr1, $gwr1, $gwr2
	st64	$gwr1, 16($fp)
	ld32	$fp, 72($sp)
	ld64	$gwr1, 16($fp)
	mtswr1	$gwr1
	mtswr2	$gwr1
	montmult
	add64swr	$gwr1
	ld32	$fp, 68($sp)
	ld64	$gwr2, 16($fp)
	subm	$gwr1, $gwr2, $gwr1
	st64	$gwr1, 16($fp)
	ld32	$fp, 68($sp)
	ld64	$gwr1, 0($fp)
	ld64	$gwr2, 32($sp)
	subm	$gwr1, $gwr2, $gwr1
	st64	$gwr1, 8($fp)
	ld32	$fp, 68($sp)
	ld64	$gwr1, 8($fp)
	ld64	$gwr2, 24($sp)
	mtswr1	$gwr1
	mtswr2	$gwr2
	montmult
	add64swr	$gwr1
	st64	$gwr1, 8($fp)
	ld64	$gwr1, 40($sp)
	addm	$gwr1, $gwr1, $gwr1
	st64	$gwr1, 0($sp)
	addm	$gwr1, $gwr1, $gwr1
	st64	$gwr1, 0($sp)
	addm	$gwr1, $gwr1, $gwr1
	st64	$gwr1, 0($sp)
	ld32	$fp, 68($sp)
	ld64	$gwr2, 8($fp)
	subm	$gwr1, $gwr2, $gwr1
	st64	$gwr1, 8($fp)
	addiu32	$r2, $zero, 0
	ld32	$fp, 76($sp)            # 4-byte Folded Reload
	addiu32	$sp, $sp, 80
	ret	$lr
	nop
	.set	macro
	.set	reorder
	.end	Point1Double
$func_end37:
	.size	Point1Double, ($func_end37)-Point1Double

	.globl	Point1Add
	.align	2
	.type	Point1Add,@function
	.ent	Point1Add               # @Point1Add
Point1Add:
	.frame	$fp,104,$lr
	.mask 	0x00200000002000000020000000200000,-8
	.set	noreorder
	.set	nomacro
# BB#0:                                 # %entry
	addiu32	$sp, $sp, -104
	st32	$fp, 100($sp)           # 4-byte Folded Spill
	ld32	$r1, 112($sp)
	st32	$r4, 96($sp)
	st32	$r5, 92($sp)
	st32	$r1, 88($sp)
	ld32	$fp, 92($sp)
	ld64	$gwr1, 16($fp)
	mtswr1	$gwr1
	mtswr2	$gwr1
	montmult
	add64swr	$gwr1
	st64	$gwr1, 0($sp)
	ld32	$fp, 96($sp)
	ld64	$gwr2, 0($fp)
	mtswr1	$gwr2
	mtswr2	$gwr1
	montmult
	add64swr	$gwr1
	st64	$gwr1, 80($sp)
	ld32	$fp, 92($sp)
	ld64	$gwr1, 16($fp)
	ld32	$fp, 96($sp)
	ld64	$gwr2, 8($fp)
	mtswr1	$gwr2
	mtswr2	$gwr1
	montmult
	add64swr	$gwr1
	st64	$gwr1, 72($sp)
	addm	$gwr1, $gwr1, $gwr1
	st64	$gwr1, 72($sp)
	ld64	$gwr2, 0($sp)
	mtswr1	$gwr1
	mtswr2	$gwr2
	montmult
	add64swr	$gwr1
	st64	$gwr1, 72($sp)
	ld32	$fp, 92($sp)
	ld64	$gwr1, 0($fp)
	ld64	$gwr2, 80($sp)
	subm	$gwr1, $gwr2, $gwr1
	st64	$gwr1, 64($sp)
	mtswr1	$gwr1
	mtswr2	$gwr1
	montmult
	add64swr	$gwr1
	st64	$gwr1, 56($sp)
	addm	$gwr1, $gwr1, $gwr1
	st64	$gwr1, 48($sp)
	addm	$gwr1, $gwr1, $gwr1
	st64	$gwr1, 48($sp)
	ld64	$gwr2, 64($sp)
	mtswr1	$gwr1
	mtswr2	$gwr2
	montmult
	add64swr	$gwr1
	st64	$gwr1, 40($sp)
	ld32	$fp, 92($sp)
	ld64	$gwr1, 8($fp)
	addm	$gwr1, $gwr1, $gwr1
	st64	$gwr1, 32($sp)
	ld64	$gwr2, 72($sp)
	subm	$gwr1, $gwr2, $gwr1
	st64	$gwr1, 32($sp)
	ld32	$fp, 96($sp)
	ld64	$gwr2, 0($fp)
	mtswr1	$gwr1
	mtswr2	$gwr2
	montmult
	add64swr	$gwr1
	st64	$gwr1, 8($sp)
	ld32	$fp, 92($sp)
	ld64	$gwr1, 0($fp)
	ld64	$gwr2, 48($sp)
	mtswr1	$gwr1
	mtswr2	$gwr2
	montmult
	add64swr	$gwr1
	st64	$gwr1, 24($sp)
	ld64	$gwr1, 32($sp)
	mtswr1	$gwr1
	mtswr2	$gwr1
	montmult
	add64swr	$gwr1
	ld32	$fp, 88($sp)
	st64	$gwr1, 0($fp)
	ld32	$fp, 88($sp)
	ld64	$gwr1, 0($fp)
	ld64	$gwr2, 40($sp)
	subm	$gwr1, $gwr1, $gwr2
	st64	$gwr1, 0($fp)
	ld64	$gwr1, 24($sp)
	addm	$gwr1, $gwr1, $gwr1
	ld32	$fp, 88($sp)
	ld64	$gwr2, 0($fp)
	subm	$gwr1, $gwr2, $gwr1
	st64	$gwr1, 0($fp)
	ld32	$fp, 92($sp)
	ld64	$gwr1, 16($fp)
	ld64	$gwr2, 64($sp)
	addm	$gwr1, $gwr1, $gwr2
	ld32	$fp, 88($sp)
	st64	$gwr1, 16($fp)
	ld32	$fp, 88($sp)
	ld64	$gwr1, 16($fp)
	mtswr1	$gwr1
	mtswr2	$gwr1
	montmult
	add64swr	$gwr1
	st64	$gwr1, 16($fp)
	ld32	$fp, 88($sp)
	ld64	$gwr1, 16($fp)
	ld64	$gwr2, 0($sp)
	subm	$gwr1, $gwr1, $gwr2
	st64	$gwr1, 16($fp)
	ld32	$fp, 88($sp)
	ld64	$gwr1, 16($fp)
	ld64	$gwr2, 56($sp)
	subm	$gwr1, $gwr1, $gwr2
	st64	$gwr1, 16($fp)
	ld32	$fp, 88($sp)
	ld64	$gwr1, 0($fp)
	ld64	$gwr2, 24($sp)
	subm	$gwr1, $gwr2, $gwr1
	st64	$gwr1, 16($sp)
	ld64	$gwr2, 32($sp)
	mtswr1	$gwr1
	mtswr2	$gwr2
	montmult
	add64swr	$gwr1
	st64	$gwr1, 16($sp)
	ld32	$fp, 92($sp)
	ld64	$gwr1, 8($fp)
	ld64	$gwr2, 40($sp)
	mtswr1	$gwr1
	mtswr2	$gwr2
	montmult
	add64swr	$gwr1
	st64	$gwr1, 80($sp)
	addm	$gwr1, $gwr1, $gwr1
	st64	$gwr1, 80($sp)
	ld64	$gwr2, 16($sp)
	subm	$gwr1, $gwr2, $gwr1
	ld32	$fp, 88($sp)
	st64	$gwr1, 8($fp)
	addiu32	$r2, $zero, 0
	ld32	$fp, 100($sp)           # 4-byte Folded Reload
	addiu32	$sp, $sp, 104
	ret	$lr
	nop
	.set	macro
	.set	reorder
	.end	Point1Add
$func_end38:
	.size	Point1Add, ($func_end38)-Point1Add

	.globl	Point1Normalize
	.align	2
	.type	Point1Normalize,@function
	.ent	Point1Normalize         # @Point1Normalize
Point1Normalize:
	.frame	$fp,80,$lr
	.mask 	0x00a0000000a0000000a0000000a00000,-8
	.set	noreorder
	.cpload	$t9
	.set	nomacro
# BB#0:                                 # %entry
	lui	$r2, %hi(_gp_disp)
	addiu32	$r2, $r2, %lo(_gp_disp)
	addiu32	$sp, $sp, -80
	st32	$lr, 76($sp)            # 4-byte Folded Spill
	st32	$fp, 72($sp)            # 4-byte Folded Spill
	ld64	$gwr1, 88($sp)
	st32	$r4, 68($sp)
	st64	$gwr4, 56($sp)
	st64	$gwr5, 48($sp)
	st64	$gwr1, 40($sp)
	ld32	$fp, 68($sp)
	ld64	$gwr4, 16($fp)
	ld64	$gwr5, 56($sp)
	st64	$gwr1, 8($sp)
	ld32	$r6, %call16(FieldInverse)($gp)
	jalr	$r6
	nop
	st64	$gwr2, 32($sp)
	mtswr1	$gwr2
	mtswr2	$gwr2
	montmult
	add64swr	$gwr1
	st64	$gwr1, 24($sp)
	ld64	$gwr2, 32($sp)
	mtswr1	$gwr1
	mtswr2	$gwr2
	montmult
	add64swr	$gwr1
	st64	$gwr1, 16($sp)
	ld32	$fp, 68($sp)
	ld64	$gwr1, 0($fp)
	ld64	$gwr2, 24($sp)
	mtswr1	$gwr1
	mtswr2	$gwr2
	montmult
	add64swr	$gwr1
	st64	$gwr1, 0($fp)
	ld32	$fp, 68($sp)
	ld64	$gwr1, 8($fp)
	ld64	$gwr2, 16($sp)
	mtswr1	$gwr1
	mtswr2	$gwr2
	montmult
	add64swr	$gwr1
	st64	$gwr1, 8($fp)
	ld32	$fp, 68($sp)
	ld64	$gwr1, 48($sp)
	st64	$gwr1, 16($fp)
	addiu32	$r2, $zero, 0
	ld32	$fp, 72($sp)            # 4-byte Folded Reload
	ld32	$lr, 76($sp)            # 4-byte Folded Reload
	addiu32	$sp, $sp, 80
	ret	$lr
	nop
	.set	macro
	.set	reorder
	.end	Point1Normalize
$func_end39:
	.size	Point1Normalize, ($func_end39)-Point1Normalize

	.globl	Point1Scalar
	.align	2
	.type	Point1Scalar,@function
	.ent	Point1Scalar            # @Point1Scalar
Point1Scalar:
	.frame	$fp,136,$lr
	.mask 	0x00a0000000a0000000a0000000a00000,-8
	.set	noreorder
	.cpload	$t9
	.set	nomacro
# BB#0:                                 # %entry
	lui	$r2, %hi(_gp_disp)
	addiu32	$r2, $r2, %lo(_gp_disp)
	addiu32	$sp, $sp, -136
	st32	$lr, 132($sp)           # 4-byte Folded Spill
	st32	$fp, 128($sp)           # 4-byte Folded Spill
	ld64	$gwr1, 152($sp)
	ld64	$gwr2, 144($sp)
	st32	$r4, 124($sp)
	st64	$gwr4, 112($sp)
	st64	$gwr5, 104($sp)
	st64	$gwr2, 96($sp)
	st64	$gwr1, 88($sp)
	st32	$r5, 84($sp)
	ld64	$gwr1, 112($sp)
	st64	$gwr1, 72($sp)
	ld32	$r4, 124($sp)
	addiu	$r5, $sp, 24
	st32	$r5, 16($sp)            # 4-byte Folded Spill
	st32	$r5, 16($sp)            # 4-byte Folded Spill
	ld32	$r6, %call16(Point1Copy)($gp)
	jalr	$r6
	nop
	addiu64	$gwr1, $gwr0, 0
	ld32	$fp, 84($sp)
	st64	$gwr1, 16($fp)
	ld32	$fp, 16($sp)            # 4-byte Folded Reload
	addiu	$r1, $sp, 48
	st32	$r1, 20($sp)            # 4-byte Folded Spill
$BB40_1:                                # %while.cond
                                        # =>This Inner Loop Header: Depth=1
	ld64	$gwr1, 72($sp)
	addiu64	$gwr2, $gwr0, 0
	cmplong	$r1, $gwr1, $gwr2
	beq	$r1, $zero, $BB40_7
	nop
# BB#2:                                 # %while.body
                                        #   in Loop: Header=BB40_1 Depth=1
	ld64	$gwr1, 72($sp)
	andi64	$gwr1, $gwr1, 1
	addiu64	$gwr2, $gwr0, 1
	cmplong	$r1, $gwr1, $gwr2
	bne	$r1, $zero, $BB40_6
	nop
# BB#3:                                 # %if.then
                                        #   in Loop: Header=BB40_1 Depth=1
	addu	$r2, $zero, $fp
	ld32	$fp, 84($sp)
	ld64	$gwr1, 16($fp)
	addiu64	$gwr2, $gwr0, 0
	cmplong	$r1, $gwr1, $gwr2
	bne	$r1, $zero, $BB40_5
	nop
# BB#4:                                 # %if.then.4
                                        #   in Loop: Header=BB40_1 Depth=1
	ld32	$r5, 84($sp)
	ld32	$r6, %call16(Point1Copy)($gp)
	addu	$r4, $zero, $r2
	addu	$fp, $zero, $r4
	jalr	$r6
	nop
	ld64	$gwr5, 96($sp)
	ld64	$gwr4, 104($sp)
	ld32	$r4, 84($sp)
	ld64	$gwr1, 88($sp)
	st64	$gwr1, 8($sp)
	ld32	$r6, %call16(Point1Normalize)($gp)
	jalr	$r6
	nop
	jmp	$BB40_6
	nop
$BB40_5:                                # %if.else
                                        #   in Loop: Header=BB40_1 Depth=1
	ld32	$r4, 84($sp)
	ld32	$r1, 20($sp)            # 4-byte Folded Reload
	st32	$r1, 20($sp)            # 4-byte Folded Spill
	st32	$r1, 20($sp)            # 4-byte Folded Spill
	st32	$r1, 8($sp)
	ld32	$r6, %call16(Point1Add)($gp)
	addu	$r5, $zero, $r2
	addu	$fp, $zero, $r5
	jalr	$r6
	nop
	ld32	$r5, 84($sp)
	ld32	$r6, %call16(Point1Copy)($gp)
	ld32	$r4, 20($sp)            # 4-byte Folded Reload
	jalr	$r6
	nop
	ld64	$gwr5, 96($sp)
	ld64	$gwr4, 104($sp)
	ld32	$r4, 84($sp)
	ld64	$gwr1, 88($sp)
	st64	$gwr1, 8($sp)
	ld32	$r6, %call16(Point1Normalize)($gp)
	jalr	$r6
	nop
$BB40_6:                                # %if.end.10
                                        #   in Loop: Header=BB40_1 Depth=1
	ld32	$r6, %call16(Point1Double)($gp)
	addu	$r4, $zero, $fp
	ld32	$fp, 20($sp)            # 4-byte Folded Reload
	st32	$fp, 20($sp)            # 4-byte Folded Spill
	addu	$r5, $zero, $fp
	jalr	$r6
	nop
	ld32	$r6, %call16(Point1Copy)($gp)
	addu	$r4, $zero, $fp
	ld32	$r5, 16($sp)            # 4-byte Folded Reload
	addu	$fp, $zero, $r5
	jalr	$r6
	nop
	ld64	$gwr1, 72($sp)
	sra64	$gwr1, $gwr1, 1
	st64	$gwr1, 72($sp)
	jmp	$BB40_1
	nop
$BB40_7:                                # %while.end
	addiu32	$r2, $zero, 0
	ld32	$fp, 128($sp)           # 4-byte Folded Reload
	ld32	$lr, 132($sp)           # 4-byte Folded Reload
	addiu32	$sp, $sp, 136
	ret	$lr
	nop
	.set	macro
	.set	reorder
	.end	Point1Scalar
$func_end40:
	.size	Point1Scalar, ($func_end40)-Point1Scalar

	.globl	Point2Copy
	.align	2
	.type	Point2Copy,@function
	.ent	Point2Copy              # @Point2Copy
Point2Copy:
	.frame	$fp,24,$lr
	.mask 	0x00800000008000000080000000800000,-8
	.set	noreorder
	.cpload	$t9
	.set	nomacro
# BB#0:                                 # %entry
	lui	$r2, %hi(_gp_disp)
	addiu32	$r2, $r2, %lo(_gp_disp)
	addiu32	$sp, $sp, -24
	st32	$lr, 20($sp)            # 4-byte Folded Spill
	st32	$r4, 16($sp)
	st32	$r5, 12($sp)
	ld32	$r4, 16($sp)
	ld32	$r6, %call16(Field2Copy)($gp)
	jalr	$r6
	nop
	ld32	$r1, 12($sp)
	ld32	$r2, 16($sp)
	addiu32	$r4, $r2, 16
	addiu32	$r5, $r1, 16
	ld32	$r6, %call16(Field2Copy)($gp)
	jalr	$r6
	nop
	ld32	$r1, 12($sp)
	ld32	$r2, 16($sp)
	addiu32	$r4, $r2, 32
	addiu32	$r5, $r1, 32
	ld32	$r6, %call16(Field2Copy)($gp)
	jalr	$r6
	nop
	addiu32	$r2, $zero, 0
	ld32	$lr, 20($sp)            # 4-byte Folded Reload
	addiu32	$sp, $sp, 24
	ret	$lr
	nop
	.set	macro
	.set	reorder
	.end	Point2Copy
$func_end41:
	.size	Point2Copy, ($func_end41)-Point2Copy

	.globl	Point2Neg
	.align	2
	.type	Point2Neg,@function
	.ent	Point2Neg               # @Point2Neg
Point2Neg:
	.frame	$fp,24,$lr
	.mask 	0x00800000008000000080000000800000,-8
	.set	noreorder
	.cpload	$t9
	.set	nomacro
# BB#0:                                 # %entry
	lui	$r2, %hi(_gp_disp)
	addiu32	$r2, $r2, %lo(_gp_disp)
	addiu32	$sp, $sp, -24
	st32	$lr, 20($sp)            # 4-byte Folded Spill
	st32	$r4, 16($sp)
	st32	$r5, 12($sp)
	ld32	$r4, 16($sp)
	ld32	$r6, %call16(Field2Copy)($gp)
	jalr	$r6
	nop
	ld32	$r1, 12($sp)
	ld32	$r2, 16($sp)
	addiu32	$r4, $r2, 16
	addiu32	$r5, $r1, 16
	ld32	$r6, %call16(Field2Neg)($gp)
	jalr	$r6
	nop
	ld32	$r1, 12($sp)
	ld32	$r2, 16($sp)
	addiu32	$r4, $r2, 32
	addiu32	$r5, $r1, 32
	ld32	$r6, %call16(Field2Copy)($gp)
	jalr	$r6
	nop
	addiu32	$r2, $zero, 0
	ld32	$lr, 20($sp)            # 4-byte Folded Reload
	addiu32	$sp, $sp, 24
	ret	$lr
	nop
	.set	macro
	.set	reorder
	.end	Point2Neg
$func_end42:
	.size	Point2Neg, ($func_end42)-Point2Neg

	.globl	Point2Double
	.align	2
	.type	Point2Double,@function
	.ent	Point2Double            # @Point2Double
Point2Double:
	.frame	$fp,208,$lr
	.mask 	0x00a0000000a0000000a0000000a00000,-8
	.set	noreorder
	.cpload	$t9
	.set	nomacro
# BB#0:                                 # %entry
	lui	$r2, %hi(_gp_disp)
	addiu32	$r2, $r2, %lo(_gp_disp)
	addiu32	$sp, $sp, -208
	st32	$lr, 204($sp)           # 4-byte Folded Spill
	st32	$fp, 200($sp)           # 4-byte Folded Spill
	st32	$r4, 196($sp)
	st32	$r5, 192($sp)
	ld32	$r4, 196($sp)
	ld32	$r6, %call16(Field2Squaring)($gp)
	addiu	$r5, $sp, 176
	st32	$r5, 24($sp)            # 4-byte Folded Spill
	jalr	$r6
	nop
	ld32	$r1, 196($sp)
	addiu32	$r4, $r1, 16
	addiu	$fp, $sp, 160
	st32	$fp, 28($sp)            # 4-byte Folded Spill
	ld32	$r6, %call16(Field2Squaring)($gp)
	addu	$r5, $zero, $fp
	jalr	$r6
	nop
	addiu	$r5, $sp, 144
	st32	$r5, 32($sp)            # 4-byte Folded Spill
	ld32	$r6, %call16(Field2Squaring)($gp)
	addu	$r4, $zero, $fp
	jalr	$r6
	nop
	ld32	$r5, 196($sp)
	addiu	$fp, $sp, 64
	st32	$fp, 20($sp)            # 4-byte Folded Spill
	st32	$fp, 8($sp)
	ld32	$r6, %call16(Field2Add)($gp)
	ld32	$r4, 28($sp)            # 4-byte Folded Reload
	jalr	$r6
	nop
	addiu	$r5, $sp, 48
	st32	$r5, 44($sp)            # 4-byte Folded Spill
	ld32	$r6, %call16(Field2Squaring)($gp)
	addu	$r4, $zero, $fp
	jalr	$r6
	nop
	st32	$fp, 8($sp)
	ld32	$r6, %call16(Field2Add)($gp)
	ld32	$r4, 24($sp)            # 4-byte Folded Reload
	ld32	$r5, 32($sp)            # 4-byte Folded Reload
	jalr	$r6
	nop
	addiu	$r1, $sp, 128
	st32	$r1, 40($sp)            # 4-byte Folded Spill
	st32	$r1, 40($sp)            # 4-byte Folded Spill
	st32	$r1, 40($sp)            # 4-byte Folded Spill
	st32	$r1, 8($sp)
	ld32	$r6, %call16(Field2Sub)($gp)
	ld32	$r4, 44($sp)            # 4-byte Folded Reload
	addu	$r5, $zero, $fp
	jalr	$r6
	nop
	ld32	$r4, 40($sp)            # 4-byte Folded Reload
	st32	$r4, 8($sp)
	ld32	$r6, %call16(Field2Add)($gp)
	addu	$r5, $zero, $r4
	jalr	$r6
	nop
	addiu	$r1, $sp, 112
	st32	$r1, 36($sp)            # 4-byte Folded Spill
	st32	$r1, 36($sp)            # 4-byte Folded Spill
	st32	$r1, 8($sp)
	ld32	$r6, %call16(Field2Add)($gp)
	ld32	$r4, 24($sp)            # 4-byte Folded Reload
	addu	$r5, $zero, $r4
	addu	$fp, $zero, $r4
	jalr	$r6
	nop
	ld32	$r5, 36($sp)            # 4-byte Folded Reload
	st32	$r5, 8($sp)
	ld32	$r6, %call16(Field2Add)($gp)
	addu	$r4, $zero, $fp
	addu	$fp, $zero, $r5
	jalr	$r6
	nop
	ld32	$r4, 196($sp)
	addiu	$r1, $sp, 80
	st32	$r1, 8($sp)
	ld32	$r6, %call16(Field2Add)($gp)
	addu	$r5, $zero, $fp
	jalr	$r6
	nop
	addiu	$r5, $sp, 96
	st32	$r5, 24($sp)            # 4-byte Folded Spill
	ld32	$r6, %call16(Field2Squaring)($gp)
	addu	$r4, $zero, $fp
	jalr	$r6
	nop
	ld32	$fp, 20($sp)            # 4-byte Folded Reload
	st32	$fp, 8($sp)
	ld32	$r6, %call16(Field2Add)($gp)
	ld32	$r4, 40($sp)            # 4-byte Folded Reload
	addu	$r5, $zero, $r4
	jalr	$r6
	nop
	ld32	$r1, 192($sp)
	st32	$r1, 8($sp)
	ld32	$r6, %call16(Field2Sub)($gp)
	ld32	$r4, 24($sp)            # 4-byte Folded Reload
	addu	$r5, $zero, $fp
	jalr	$r6
	nop
	ld32	$r1, 196($sp)
	st32	$fp, 8($sp)
	addiu32	$r4, $r1, 16
	addiu32	$r5, $r1, 32
	ld32	$r6, %call16(Field2Add)($gp)
	jalr	$r6
	nop
	ld32	$r6, %call16(Field2Squaring)($gp)
	addu	$r4, $zero, $fp
	ld32	$r5, 44($sp)            # 4-byte Folded Reload
	jalr	$r6
	nop
	ld32	$r1, 196($sp)
	addiu32	$r4, $r1, 32
	ld32	$r6, %call16(Field2Squaring)($gp)
	addu	$r5, $zero, $fp
	jalr	$r6
	nop
	addu	$r5, $zero, $fp
	st32	$r5, 8($sp)
	ld32	$r6, %call16(Field2Add)($gp)
	ld32	$r4, 28($sp)            # 4-byte Folded Reload
	jalr	$r6
	nop
	ld32	$r1, 192($sp)
	addiu32	$r1, $r1, 32
	st32	$r1, 8($sp)
	ld32	$r6, %call16(Field2Sub)($gp)
	ld32	$r4, 44($sp)            # 4-byte Folded Reload
	addu	$r5, $zero, $fp
	jalr	$r6
	nop
	ld32	$r5, 192($sp)
	st32	$fp, 8($sp)
	ld32	$r6, %call16(Field2Sub)($gp)
	ld32	$r4, 40($sp)            # 4-byte Folded Reload
	jalr	$r6
	nop
	ld32	$r1, 44($sp)            # 4-byte Folded Reload
	st32	$r1, 8($sp)
	ld32	$r6, %call16(Field2Mul)($gp)
	addu	$r4, $zero, $fp
	ld32	$r5, 36($sp)            # 4-byte Folded Reload
	jalr	$r6
	nop
	st32	$fp, 8($sp)
	ld32	$r6, %call16(Field2Add)($gp)
	ld32	$r4, 32($sp)            # 4-byte Folded Reload
	addu	$r5, $zero, $r4
	jalr	$r6
	nop
	addu	$r4, $zero, $fp
	st32	$r4, 8($sp)
	ld32	$r6, %call16(Field2Add)($gp)
	addu	$r5, $zero, $r4
	jalr	$r6
	nop
	addu	$r4, $zero, $fp
	st32	$r4, 8($sp)
	ld32	$r6, %call16(Field2Add)($gp)
	addu	$r5, $zero, $r4
	jalr	$r6
	nop
	ld32	$r1, 192($sp)
	addiu32	$r1, $r1, 16
	st32	$r1, 8($sp)
	ld32	$r6, %call16(Field2Sub)($gp)
	ld32	$r4, 44($sp)            # 4-byte Folded Reload
	addu	$r5, $zero, $fp
	jalr	$r6
	nop
	addiu32	$r2, $zero, 0
	ld32	$fp, 200($sp)           # 4-byte Folded Reload
	ld32	$lr, 204($sp)           # 4-byte Folded Reload
	addiu32	$sp, $sp, 208
	ret	$lr
	nop
	.set	macro
	.set	reorder
	.end	Point2Double
$func_end43:
	.size	Point2Double, ($func_end43)-Point2Double

	.globl	Point2Add
	.align	2
	.type	Point2Add,@function
	.ent	Point2Add               # @Point2Add
Point2Add:
	.frame	$fp,320,$lr
	.mask 	0x00a0000000a0000000a0000000a00000,-8
	.set	noreorder
	.cpload	$t9
	.set	nomacro
# BB#0:                                 # %entry
	lui	$r2, %hi(_gp_disp)
	addiu32	$r2, $r2, %lo(_gp_disp)
	addiu32	$sp, $sp, -320
	st32	$lr, 316($sp)           # 4-byte Folded Spill
	st32	$fp, 312($sp)           # 4-byte Folded Spill
	ld32	$r1, 328($sp)
	st32	$r4, 308($sp)
	st32	$r5, 304($sp)
	st32	$r1, 300($sp)
	ld32	$r1, 304($sp)
	addiu32	$r4, $r1, 32
	ld32	$r6, %call16(Field2Squaring)($gp)
	addiu	$r5, $sp, 104
	st32	$r5, 44($sp)            # 4-byte Folded Spill
	st32	$r5, 44($sp)            # 4-byte Folded Spill
	addu	$fp, $zero, $r5
	jalr	$r6
	nop
	ld32	$r4, 308($sp)
	addiu	$r1, $sp, 280
	st32	$r1, 24($sp)            # 4-byte Folded Spill
	st32	$r1, 8($sp)
	ld32	$r6, %call16(Field2Mul)($gp)
	addu	$r5, $zero, $fp
	jalr	$r6
	nop
	ld32	$r1, 304($sp)
	ld32	$r2, 308($sp)
	addiu	$fp, $sp, 72
	st32	$fp, 48($sp)            # 4-byte Folded Spill
	st32	$fp, 48($sp)            # 4-byte Folded Spill
	st32	$fp, 8($sp)
	addiu32	$r4, $r2, 16
	addiu32	$r5, $r1, 32
	ld32	$r6, %call16(Field2Add)($gp)
	jalr	$r6
	nop
	addiu	$r5, $sp, 56
	st32	$r5, 52($sp)            # 4-byte Folded Spill
	ld32	$r6, %call16(Field2Squaring)($gp)
	addu	$r4, $zero, $fp
	jalr	$r6
	nop
	ld32	$r1, 308($sp)
	addiu32	$r4, $r1, 16
	addiu	$r5, $sp, 88
	st32	$r5, 40($sp)            # 4-byte Folded Spill
	ld32	$r6, %call16(Field2Squaring)($gp)
	jalr	$r6
	nop
	st32	$fp, 8($sp)
	ld32	$r6, %call16(Field2Add)($gp)
	ld32	$r4, 40($sp)            # 4-byte Folded Reload
	ld32	$r5, 44($sp)            # 4-byte Folded Reload
	st32	$r5, 44($sp)            # 4-byte Folded Spill
	jalr	$r6
	nop
	addiu	$r1, $sp, 264
	st32	$r1, 28($sp)            # 4-byte Folded Spill
	st32	$r1, 28($sp)            # 4-byte Folded Spill
	st32	$r1, 8($sp)
	ld32	$r6, %call16(Field2Sub)($gp)
	ld32	$r4, 52($sp)            # 4-byte Folded Reload
	addu	$r5, $zero, $fp
	jalr	$r6
	nop
	st32	$fp, 8($sp)
	ld32	$r6, %call16(Field2Mul)($gp)
	ld32	$fp, 28($sp)            # 4-byte Folded Reload
	addu	$r4, $zero, $fp
	ld32	$r5, 44($sp)            # 4-byte Folded Reload
	jalr	$r6
	nop
	ld32	$r6, %call16(Field2Copy)($gp)
	ld32	$r4, 48($sp)            # 4-byte Folded Reload
	addu	$r5, $zero, $fp
	jalr	$r6
	nop
	ld32	$r5, 304($sp)
	addiu	$r1, $sp, 248
	st32	$r1, 40($sp)            # 4-byte Folded Spill
	st32	$r1, 8($sp)
	ld32	$r6, %call16(Field2Sub)($gp)
	ld32	$r4, 24($sp)            # 4-byte Folded Reload
	jalr	$r6
	nop
	addiu	$r5, $sp, 232
	st32	$r5, 36($sp)            # 4-byte Folded Spill
	st32	$r5, 36($sp)            # 4-byte Folded Spill
	ld32	$r6, %call16(Field2Squaring)($gp)
	ld32	$r4, 40($sp)            # 4-byte Folded Reload
	jalr	$r6
	nop
	addiu	$fp, $sp, 216
	st32	$fp, 16($sp)            # 4-byte Folded Spill
	st32	$fp, 8($sp)
	ld32	$r6, %call16(Field2Add)($gp)
	ld32	$r4, 36($sp)            # 4-byte Folded Reload
	addu	$r5, $zero, $r4
	jalr	$r6
	nop
	st32	$fp, 8($sp)
	ld32	$r6, %call16(Field2Add)($gp)
	addu	$r4, $zero, $fp
	addu	$r5, $zero, $fp
	jalr	$r6
	nop
	addiu	$r1, $sp, 200
	st32	$r1, 20($sp)            # 4-byte Folded Spill
	st32	$r1, 8($sp)
	ld32	$r6, %call16(Field2Mul)($gp)
	addu	$r4, $zero, $fp
	ld32	$r5, 40($sp)            # 4-byte Folded Reload
	jalr	$r6
	nop
	ld32	$r1, 304($sp)
	ld32	$fp, 48($sp)            # 4-byte Folded Reload
	st32	$fp, 48($sp)            # 4-byte Folded Spill
	st32	$fp, 8($sp)
	addiu32	$r4, $r1, 16
	ld32	$r6, %call16(Field2Add)($gp)
	addu	$r5, $zero, $r4
	jalr	$r6
	nop
	addiu	$r1, $sp, 184
	st32	$r1, 32($sp)            # 4-byte Folded Spill
	st32	$r1, 32($sp)            # 4-byte Folded Spill
	st32	$r1, 8($sp)
	ld32	$r6, %call16(Field2Sub)($gp)
	ld32	$r4, 28($sp)            # 4-byte Folded Reload
	addu	$r5, $zero, $fp
	jalr	$r6
	nop
	ld32	$r5, 308($sp)
	addiu	$r1, $sp, 136
	st32	$r1, 8($sp)
	ld32	$r6, %call16(Field2Mul)($gp)
	ld32	$r4, 32($sp)            # 4-byte Folded Reload
	addu	$fp, $zero, $r4
	jalr	$r6
	nop
	ld32	$r4, 304($sp)
	addiu	$r1, $sp, 168
	st32	$r1, 28($sp)            # 4-byte Folded Spill
	st32	$r1, 28($sp)            # 4-byte Folded Spill
	st32	$r1, 8($sp)
	ld32	$r6, %call16(Field2Mul)($gp)
	ld32	$r5, 16($sp)            # 4-byte Folded Reload
	jalr	$r6
	nop
	ld32	$r6, %call16(Field2Squaring)($gp)
	addu	$r4, $zero, $fp
	ld32	$fp, 48($sp)            # 4-byte Folded Reload
	st32	$fp, 48($sp)            # 4-byte Folded Spill
	addu	$r5, $zero, $fp
	jalr	$r6
	nop
	ld32	$r1, 52($sp)            # 4-byte Folded Reload
	st32	$r1, 8($sp)
	ld32	$r6, %call16(Field2Add)($gp)
	ld32	$r4, 28($sp)            # 4-byte Folded Reload
	addu	$r5, $zero, $r4
	jalr	$r6
	nop
	ld32	$r5, 52($sp)            # 4-byte Folded Reload
	st32	$r5, 52($sp)            # 4-byte Folded Spill
	st32	$r5, 8($sp)
	ld32	$r6, %call16(Field2Add)($gp)
	ld32	$r4, 20($sp)            # 4-byte Folded Reload
	jalr	$r6
	nop
	ld32	$r1, 300($sp)
	st32	$r1, 8($sp)
	ld32	$r6, %call16(Field2Sub)($gp)
	addu	$r4, $zero, $fp
	ld32	$r5, 52($sp)            # 4-byte Folded Reload
	jalr	$r6
	nop
	ld32	$r1, 304($sp)
	st32	$fp, 8($sp)
	addiu32	$r4, $r1, 32
	ld32	$r6, %call16(Field2Add)($gp)
	ld32	$r5, 40($sp)            # 4-byte Folded Reload
	jalr	$r6
	nop
	ld32	$r6, %call16(Field2Squaring)($gp)
	addu	$r4, $zero, $fp
	ld32	$r5, 52($sp)            # 4-byte Folded Reload
	jalr	$r6
	nop
	st32	$fp, 8($sp)
	ld32	$r6, %call16(Field2Add)($gp)
	ld32	$r4, 44($sp)            # 4-byte Folded Reload
	ld32	$r5, 36($sp)            # 4-byte Folded Reload
	jalr	$r6
	nop
	ld32	$r1, 300($sp)
	addiu32	$r1, $r1, 32
	st32	$r1, 8($sp)
	ld32	$r6, %call16(Field2Sub)($gp)
	ld32	$r4, 52($sp)            # 4-byte Folded Reload
	addu	$r5, $zero, $fp
	jalr	$r6
	nop
	ld32	$r1, 300($sp)
	ld32	$r2, 308($sp)
	addiu	$r3, $sp, 120
	st32	$r3, 8($sp)
	addiu32	$r4, $r2, 16
	addiu32	$r5, $r1, 32
	ld32	$r6, %call16(Field2Add)($gp)
	jalr	$r6
	nop
	ld32	$r5, 300($sp)
	st32	$fp, 8($sp)
	ld32	$r6, %call16(Field2Sub)($gp)
	ld32	$r4, 28($sp)            # 4-byte Folded Reload
	jalr	$r6
	nop
	addiu	$r1, $sp, 152
	st32	$r1, 52($sp)            # 4-byte Folded Spill
	st32	$r1, 8($sp)
	ld32	$r6, %call16(Field2Mul)($gp)
	addu	$r4, $zero, $fp
	ld32	$r5, 32($sp)            # 4-byte Folded Reload
	jalr	$r6
	nop
	ld32	$r1, 304($sp)
	st32	$fp, 8($sp)
	addiu32	$r4, $r1, 16
	ld32	$r6, %call16(Field2Mul)($gp)
	ld32	$r5, 20($sp)            # 4-byte Folded Reload
	jalr	$r6
	nop
	ld32	$fp, 24($sp)            # 4-byte Folded Reload
	st32	$fp, 8($sp)
	ld32	$r6, %call16(Field2Add)($gp)
	ld32	$r4, 48($sp)            # 4-byte Folded Reload
	addu	$r5, $zero, $r4
	jalr	$r6
	nop
	ld32	$r1, 300($sp)
	addiu32	$r1, $r1, 16
	st32	$r1, 8($sp)
	ld32	$r6, %call16(Field2Sub)($gp)
	ld32	$r4, 52($sp)            # 4-byte Folded Reload
	addu	$r5, $zero, $fp
	jalr	$r6
	nop
	addiu32	$r2, $zero, 0
	ld32	$fp, 312($sp)           # 4-byte Folded Reload
	ld32	$lr, 316($sp)           # 4-byte Folded Reload
	addiu32	$sp, $sp, 320
	ret	$lr
	nop
	.set	macro
	.set	reorder
	.end	Point2Add
$func_end44:
	.size	Point2Add, ($func_end44)-Point2Add

	.globl	Point2Normalize
	.align	2
	.type	Point2Normalize,@function
	.ent	Point2Normalize         # @Point2Normalize
Point2Normalize:
	.frame	$fp,152,$lr
	.mask 	0x00a0000000a0000000a0000000a00000,-8
	.set	noreorder
	.cpload	$t9
	.set	nomacro
# BB#0:                                 # %entry
	lui	$r2, %hi(_gp_disp)
	addiu32	$r2, $r2, %lo(_gp_disp)
	addiu32	$sp, $sp, -152
	st32	$lr, 148($sp)           # 4-byte Folded Spill
	st32	$fp, 144($sp)           # 4-byte Folded Spill
	ld64	$gwr1, 160($sp)
	st32	$r4, 140($sp)
	st64	$gwr4, 128($sp)
	st64	$gwr5, 120($sp)
	st64	$gwr1, 112($sp)
	ld32	$r1, 140($sp)
	addiu32	$r4, $r1, 32
	addiu	$fp, $sp, 96
	ld32	$r6, %call16(Field2Squaring)($gp)
	addu	$r5, $zero, $fp
	jalr	$r6
	nop
	ld32	$r1, 140($sp)
	addiu	$r2, $sp, 80
	st32	$r2, 24($sp)            # 4-byte Folded Spill
	st32	$r2, 8($sp)
	addiu32	$r5, $r1, 32
	ld32	$r6, %call16(Field2Mul)($gp)
	addu	$r4, $zero, $fp
	jalr	$r6
	nop
	ld64	$gwr5, 112($sp)
	ld64	$gwr4, 128($sp)
	addiu	$r5, $sp, 64
	st32	$r5, 20($sp)            # 4-byte Folded Spill
	ld32	$r6, %call16(Field2Inverse)($gp)
	addu	$r4, $zero, $fp
	jalr	$r6
	nop
	ld64	$gwr5, 112($sp)
	ld64	$gwr4, 128($sp)
	addiu	$r5, $sp, 48
	st32	$r5, 28($sp)            # 4-byte Folded Spill
	ld32	$r6, %call16(Field2Inverse)($gp)
	ld32	$r4, 24($sp)            # 4-byte Folded Reload
	jalr	$r6
	nop
	ld32	$r4, 140($sp)
	addiu	$fp, $sp, 32
	st32	$fp, 8($sp)
	ld32	$r6, %call16(Field2Mul)($gp)
	ld32	$r5, 20($sp)            # 4-byte Folded Reload
	jalr	$r6
	nop
	ld32	$r5, 140($sp)
	ld32	$r6, %call16(Field2Copy)($gp)
	addu	$r4, $zero, $fp
	jalr	$r6
	nop
	ld32	$r1, 140($sp)
	st32	$fp, 8($sp)
	addiu32	$r4, $r1, 16
	ld32	$r6, %call16(Field2Mul)($gp)
	ld32	$r5, 28($sp)            # 4-byte Folded Reload
	jalr	$r6
	nop
	ld32	$r1, 140($sp)
	addiu32	$r5, $r1, 16
	ld32	$r6, %call16(Field2Copy)($gp)
	addu	$r4, $zero, $fp
	jalr	$r6
	nop
	ld64	$gwr4, 120($sp)
	ld32	$r1, 140($sp)
	addiu32	$r4, $r1, 32
	ld32	$r6, %call16(Field2SetOne)($gp)
	jalr	$r6
	nop
	addiu32	$r2, $zero, 0
	ld32	$fp, 144($sp)           # 4-byte Folded Reload
	ld32	$lr, 148($sp)           # 4-byte Folded Reload
	addiu32	$sp, $sp, 152
	ret	$lr
	nop
	.set	macro
	.set	reorder
	.end	Point2Normalize
$func_end45:
	.size	Point2Normalize, ($func_end45)-Point2Normalize

	.globl	Point2Scalar
	.align	2
	.type	Point2Scalar,@function
	.ent	Point2Scalar            # @Point2Scalar
Point2Scalar:
	.frame	$fp,184,$lr
	.mask 	0x00a0000000a0000000a0000000a00000,-8
	.set	noreorder
	.cpload	$t9
	.set	nomacro
# BB#0:                                 # %entry
	lui	$r2, %hi(_gp_disp)
	addiu32	$r2, $r2, %lo(_gp_disp)
	addiu32	$sp, $sp, -184
	st32	$lr, 180($sp)           # 4-byte Folded Spill
	st32	$fp, 176($sp)           # 4-byte Folded Spill
	ld64	$gwr1, 200($sp)
	ld64	$gwr2, 192($sp)
	st32	$r4, 172($sp)
	st64	$gwr4, 160($sp)
	st64	$gwr5, 152($sp)
	st64	$gwr2, 144($sp)
	st64	$gwr1, 136($sp)
	st32	$r5, 132($sp)
	ld64	$gwr1, 160($sp)
	st64	$gwr1, 120($sp)
	ld32	$r4, 172($sp)
	addiu	$r5, $sp, 24
	st32	$r5, 20($sp)            # 4-byte Folded Spill
	st32	$r5, 20($sp)            # 4-byte Folded Spill
	st32	$r5, 20($sp)            # 4-byte Folded Spill
	st32	$r5, 20($sp)            # 4-byte Folded Spill
	ld32	$r6, %call16(Point2Copy)($gp)
	jalr	$r6
	nop
	ld32	$r1, 132($sp)
	addiu32	$r4, $r1, 32
	ld32	$r6, %call16(Field2SetZero)($gp)
	jalr	$r6
	nop
	addiu	$r1, $sp, 72
	st32	$r1, 16($sp)            # 4-byte Folded Spill
$BB46_1:                                # %while.cond
                                        # =>This Inner Loop Header: Depth=1
	ld64	$gwr1, 120($sp)
	addiu64	$gwr2, $gwr0, 0
	cmplong	$r1, $gwr1, $gwr2
	beq	$r1, $zero, $BB46_8
	nop
# BB#2:                                 # %while.body
                                        #   in Loop: Header=BB46_1 Depth=1
	ld64	$gwr1, 120($sp)
	andi64	$gwr1, $gwr1, 1
	addiu64	$gwr2, $gwr0, 1
	cmplong	$r1, $gwr1, $gwr2
	bne	$r1, $zero, $BB46_7
	nop
# BB#3:                                 # %if.then
                                        #   in Loop: Header=BB46_1 Depth=1
	ld32	$r2, 20($sp)            # 4-byte Folded Reload
	ld32	$fp, 132($sp)
	ld64	$gwr1, 32($fp)
	addiu64	$gwr2, $gwr0, 0
	cmplong	$r1, $gwr1, $gwr2
	bne	$r1, $zero, $BB46_6
	nop
# BB#4:                                 # %land.lhs.true
                                        #   in Loop: Header=BB46_1 Depth=1
	ld32	$fp, 132($sp)
	ld64	$gwr1, 40($fp)
	addiu64	$gwr2, $gwr0, 0
	cmplong	$r1, $gwr1, $gwr2
	bne	$r1, $zero, $BB46_6
	nop
# BB#5:                                 # %if.then.7
                                        #   in Loop: Header=BB46_1 Depth=1
	ld32	$r5, 132($sp)
	ld32	$r6, %call16(Point2Copy)($gp)
	addu	$r4, $zero, $r2
	jalr	$r6
	nop
	ld64	$gwr5, 144($sp)
	ld64	$gwr4, 152($sp)
	ld32	$r4, 132($sp)
	ld64	$gwr1, 136($sp)
	st64	$gwr1, 8($sp)
	ld32	$r6, %call16(Point2Normalize)($gp)
	jalr	$r6
	nop
	jmp	$BB46_7
	nop
$BB46_6:                                # %if.else
                                        #   in Loop: Header=BB46_1 Depth=1
	ld32	$r4, 132($sp)
	ld32	$fp, 16($sp)            # 4-byte Folded Reload
	st32	$fp, 16($sp)            # 4-byte Folded Spill
	st32	$fp, 8($sp)
	ld32	$r6, %call16(Point2Add)($gp)
	addu	$r5, $zero, $r2
	jalr	$r6
	nop
	ld32	$r5, 132($sp)
	ld32	$r6, %call16(Point2Copy)($gp)
	addu	$r4, $zero, $fp
	jalr	$r6
	nop
	ld64	$gwr5, 144($sp)
	ld64	$gwr4, 152($sp)
	ld32	$r4, 132($sp)
	ld64	$gwr1, 136($sp)
	st64	$gwr1, 8($sp)
	ld32	$r6, %call16(Point2Normalize)($gp)
	jalr	$r6
	nop
$BB46_7:                                # %if.end.13
                                        #   in Loop: Header=BB46_1 Depth=1
	ld32	$r6, %call16(Point2Double)($gp)
	ld32	$r4, 20($sp)            # 4-byte Folded Reload
	st32	$r4, 20($sp)            # 4-byte Folded Spill
	ld32	$fp, 16($sp)            # 4-byte Folded Reload
	st32	$fp, 16($sp)            # 4-byte Folded Spill
	addu	$r5, $zero, $fp
	jalr	$r6
	nop
	ld32	$r6, %call16(Point2Copy)($gp)
	addu	$r4, $zero, $fp
	ld32	$r5, 20($sp)            # 4-byte Folded Reload
	jalr	$r6
	nop
	ld64	$gwr1, 120($sp)
	sra64	$gwr1, $gwr1, 1
	st64	$gwr1, 120($sp)
	jmp	$BB46_1
	nop
$BB46_8:                                # %while.end
	addiu32	$r2, $zero, 0
	ld32	$fp, 176($sp)           # 4-byte Folded Reload
	ld32	$lr, 180($sp)           # 4-byte Folded Reload
	addiu32	$sp, $sp, 184
	ret	$lr
	nop
	.set	macro
	.set	reorder
	.end	Point2Scalar
$func_end46:
	.size	Point2Scalar, ($func_end46)-Point2Scalar

	.globl	LineDouble
	.align	2
	.type	LineDouble,@function
	.ent	LineDouble              # @LineDouble
LineDouble:
	.frame	$fp,240,$lr
	.mask 	0x00a0000000a0000000a0000000a00000,-8
	.set	noreorder
	.cpload	$t9
	.set	nomacro
# BB#0:                                 # %entry
	lui	$r2, %hi(_gp_disp)
	addiu32	$r2, $r2, %lo(_gp_disp)
	addiu32	$sp, $sp, -240
	st32	$lr, 236($sp)           # 4-byte Folded Spill
	st32	$fp, 232($sp)           # 4-byte Folded Spill
	ld32	$r1, 252($sp)
	ld32	$r2, 248($sp)
	st32	$r4, 228($sp)
	st32	$r5, 224($sp)
	st32	$r2, 220($sp)
	st32	$r1, 216($sp)
	ld32	$r4, 228($sp)
	addiu	$r5, $sp, 200
	st32	$r5, 48($sp)            # 4-byte Folded Spill
	st32	$r5, 48($sp)            # 4-byte Folded Spill
	ld32	$r6, %call16(Field2Squaring)($gp)
	jalr	$r6
	nop
	ld32	$r1, 228($sp)
	addiu32	$r4, $r1, 16
	addiu	$fp, $sp, 184
	st32	$fp, 32($sp)            # 4-byte Folded Spill
	ld32	$r6, %call16(Field2Squaring)($gp)
	addu	$r5, $zero, $fp
	jalr	$r6
	nop
	addiu	$r5, $sp, 168
	st32	$r5, 24($sp)            # 4-byte Folded Spill
	ld32	$r6, %call16(Field2Squaring)($gp)
	addu	$r4, $zero, $fp
	jalr	$r6
	nop
	ld32	$r5, 228($sp)
	addiu	$fp, $sp, 88
	st32	$fp, 40($sp)            # 4-byte Folded Spill
	st32	$fp, 40($sp)            # 4-byte Folded Spill
	st32	$fp, 8($sp)
	ld32	$r6, %call16(Field2Add)($gp)
	ld32	$r4, 32($sp)            # 4-byte Folded Reload
	jalr	$r6
	nop
	addiu	$r5, $sp, 72
	st32	$r5, 52($sp)            # 4-byte Folded Spill
	ld32	$r6, %call16(Field2Squaring)($gp)
	addu	$r4, $zero, $fp
	jalr	$r6
	nop
	st32	$fp, 8($sp)
	ld32	$r6, %call16(Field2Add)($gp)
	ld32	$r4, 48($sp)            # 4-byte Folded Reload
	ld32	$r5, 24($sp)            # 4-byte Folded Reload
	jalr	$r6
	nop
	addiu	$r1, $sp, 152
	st32	$r1, 44($sp)            # 4-byte Folded Spill
	st32	$r1, 44($sp)            # 4-byte Folded Spill
	st32	$r1, 44($sp)            # 4-byte Folded Spill
	st32	$r1, 8($sp)
	ld32	$r6, %call16(Field2Sub)($gp)
	ld32	$r4, 52($sp)            # 4-byte Folded Reload
	addu	$r5, $zero, $fp
	jalr	$r6
	nop
	ld32	$r4, 44($sp)            # 4-byte Folded Reload
	st32	$r4, 8($sp)
	ld32	$r6, %call16(Field2Add)($gp)
	addu	$r5, $zero, $r4
	jalr	$r6
	nop
	addiu	$fp, $sp, 136
	st32	$fp, 20($sp)            # 4-byte Folded Spill
	st32	$fp, 8($sp)
	ld32	$r6, %call16(Field2Add)($gp)
	ld32	$r4, 48($sp)            # 4-byte Folded Reload
	addu	$r5, $zero, $r4
	jalr	$r6
	nop
	st32	$fp, 8($sp)
	ld32	$r6, %call16(Field2Add)($gp)
	ld32	$r4, 48($sp)            # 4-byte Folded Reload
	addu	$r5, $zero, $fp
	jalr	$r6
	nop
	ld32	$r4, 228($sp)
	addiu	$r1, $sp, 104
	st32	$r1, 36($sp)            # 4-byte Folded Spill
	st32	$r1, 8($sp)
	ld32	$r6, %call16(Field2Add)($gp)
	addu	$r5, $zero, $fp
	jalr	$r6
	nop
	addiu	$r5, $sp, 120
	st32	$r5, 28($sp)            # 4-byte Folded Spill
	ld32	$r6, %call16(Field2Squaring)($gp)
	addu	$r4, $zero, $fp
	jalr	$r6
	nop
	ld32	$fp, 40($sp)            # 4-byte Folded Reload
	st32	$fp, 8($sp)
	ld32	$r6, %call16(Field2Add)($gp)
	ld32	$r4, 44($sp)            # 4-byte Folded Reload
	addu	$r5, $zero, $r4
	jalr	$r6
	nop
	ld32	$r1, 216($sp)
	st32	$r1, 8($sp)
	ld32	$r6, %call16(Field2Sub)($gp)
	ld32	$r4, 28($sp)            # 4-byte Folded Reload
	addu	$r5, $zero, $fp
	jalr	$r6
	nop
	ld32	$r1, 228($sp)
	st32	$fp, 8($sp)
	addiu32	$r4, $r1, 16
	addiu32	$r5, $r1, 32
	ld32	$r6, %call16(Field2Add)($gp)
	jalr	$r6
	nop
	ld32	$r6, %call16(Field2Squaring)($gp)
	addu	$r4, $zero, $fp
	ld32	$r5, 52($sp)            # 4-byte Folded Reload
	jalr	$r6
	nop
	ld32	$r1, 228($sp)
	addiu32	$r4, $r1, 32
	ld32	$r6, %call16(Field2Squaring)($gp)
	addu	$r5, $zero, $fp
	jalr	$r6
	nop
	st32	$fp, 8($sp)
	ld32	$r6, %call16(Field2Add)($gp)
	ld32	$r4, 32($sp)            # 4-byte Folded Reload
	addu	$r5, $zero, $fp
	jalr	$r6
	nop
	ld32	$r1, 216($sp)
	addiu32	$r1, $r1, 32
	st32	$r1, 8($sp)
	ld32	$r6, %call16(Field2Sub)($gp)
	ld32	$r4, 52($sp)            # 4-byte Folded Reload
	addu	$r5, $zero, $fp
	jalr	$r6
	nop
	ld32	$r5, 216($sp)
	st32	$fp, 8($sp)
	ld32	$r6, %call16(Field2Sub)($gp)
	ld32	$r4, 44($sp)            # 4-byte Folded Reload
	jalr	$r6
	nop
	ld32	$r1, 52($sp)            # 4-byte Folded Reload
	st32	$r1, 8($sp)
	ld32	$r6, %call16(Field2Mul)($gp)
	addu	$r4, $zero, $fp
	ld32	$r5, 20($sp)            # 4-byte Folded Reload
	jalr	$r6
	nop
	st32	$fp, 8($sp)
	ld32	$r6, %call16(Field2Add)($gp)
	ld32	$r4, 24($sp)            # 4-byte Folded Reload
	addu	$r5, $zero, $r4
	jalr	$r6
	nop
	st32	$fp, 8($sp)
	ld32	$r6, %call16(Field2Add)($gp)
	addu	$r4, $zero, $fp
	addu	$r5, $zero, $fp
	jalr	$r6
	nop
	st32	$fp, 8($sp)
	ld32	$r6, %call16(Field2Add)($gp)
	addu	$r4, $zero, $fp
	addu	$r5, $zero, $fp
	jalr	$r6
	nop
	ld32	$r1, 216($sp)
	addiu32	$r1, $r1, 16
	st32	$r1, 8($sp)
	ld32	$r6, %call16(Field2Sub)($gp)
	ld32	$r4, 52($sp)            # 4-byte Folded Reload
	st32	$r4, 52($sp)            # 4-byte Folded Spill
	st32	$r4, 52($sp)            # 4-byte Folded Spill
	st32	$r4, 52($sp)            # 4-byte Folded Spill
	addu	$r5, $zero, $fp
	jalr	$r6
	nop
	ld32	$r1, 228($sp)
	addiu32	$r4, $r1, 32
	ld32	$r6, %call16(Field2Squaring)($gp)
	addu	$r5, $zero, $fp
	jalr	$r6
	nop
	ld32	$r1, 52($sp)            # 4-byte Folded Reload
	st32	$r1, 52($sp)            # 4-byte Folded Spill
	st32	$r1, 8($sp)
	ld32	$r6, %call16(Field2Mul)($gp)
	ld32	$r4, 20($sp)            # 4-byte Folded Reload
	addu	$r5, $zero, $fp
	jalr	$r6
	nop
	ld32	$r4, 52($sp)            # 4-byte Folded Reload
	st32	$r4, 8($sp)
	ld32	$r6, %call16(Field2Add)($gp)
	addu	$r5, $zero, $r4
	addu	$fp, $zero, $r4
	jalr	$r6
	nop
	ld32	$r6, %call16(Field2Neg)($gp)
	addu	$r4, $zero, $fp
	ld32	$r5, 44($sp)            # 4-byte Folded Reload
	jalr	$r6
	nop
	ld32	$fp, 224($sp)
	ld64	$gwr4, 0($fp)
	ld32	$r6, %call16(Field2MulConst)($gp)
	ld32	$r4, 44($sp)            # 4-byte Folded Reload
	st32	$r4, 44($sp)            # 4-byte Folded Spill
	addu	$r5, $zero, $r4
	jalr	$r6
	nop
	ld32	$r6, %call16(Field2Squaring)($gp)
	ld32	$r4, 36($sp)            # 4-byte Folded Reload
	ld32	$r5, 40($sp)            # 4-byte Folded Reload
	jalr	$r6
	nop
	ld32	$fp, 52($sp)            # 4-byte Folded Reload
	st32	$fp, 8($sp)
	ld32	$r6, %call16(Field2Add)($gp)
	ld32	$r4, 32($sp)            # 4-byte Folded Reload
	addu	$r5, $zero, $r4
	jalr	$r6
	nop
	st32	$fp, 8($sp)
	ld32	$r6, %call16(Field2Add)($gp)
	addu	$r4, $zero, $fp
	addu	$r5, $zero, $fp
	jalr	$r6
	nop
	st32	$fp, 8($sp)
	ld32	$r6, %call16(Field2Add)($gp)
	addu	$r4, $zero, $fp
	ld32	$r5, 28($sp)            # 4-byte Folded Reload
	jalr	$r6
	nop
	st32	$fp, 8($sp)
	ld32	$r6, %call16(Field2Add)($gp)
	addu	$r4, $zero, $fp
	ld32	$r5, 48($sp)            # 4-byte Folded Reload
	jalr	$r6
	nop
	ld32	$r1, 36($sp)            # 4-byte Folded Reload
	st32	$r1, 8($sp)
	ld32	$r6, %call16(Field2Sub)($gp)
	ld32	$fp, 40($sp)            # 4-byte Folded Reload
	st32	$fp, 40($sp)            # 4-byte Folded Spill
	addu	$r4, $zero, $fp
	ld32	$r5, 52($sp)            # 4-byte Folded Reload
	jalr	$r6
	nop
	ld32	$r1, 228($sp)
	addiu32	$r4, $r1, 32
	ld32	$r6, %call16(Field2Squaring)($gp)
	addu	$r5, $zero, $fp
	jalr	$r6
	nop
	ld32	$r1, 216($sp)
	ld32	$fp, 52($sp)            # 4-byte Folded Reload
	st32	$fp, 8($sp)
	addiu32	$r4, $r1, 32
	ld32	$r6, %call16(Field2Mul)($gp)
	ld32	$r5, 40($sp)            # 4-byte Folded Reload
	jalr	$r6
	nop
	ld32	$r1, 48($sp)            # 4-byte Folded Reload
	st32	$r1, 8($sp)
	ld32	$r6, %call16(Field2Add)($gp)
	addu	$r4, $zero, $fp
	addu	$r5, $zero, $fp
	jalr	$r6
	nop
	ld32	$fp, 224($sp)
	ld64	$gwr4, 8($fp)
	ld32	$r6, %call16(Field2MulConst)($gp)
	ld32	$r4, 48($sp)            # 4-byte Folded Reload
	st32	$r4, 48($sp)            # 4-byte Folded Spill
	addu	$r5, $zero, $r4
	jalr	$r6
	nop
	addiu	$fp, $sp, 56
	ld32	$r6, %call16(Field2SetZero)($gp)
	addu	$r4, $zero, $fp
	jalr	$r6
	nop
	ld32	$r5, 220($sp)
	ld32	$r6, %call16(Field2Copy)($gp)
	addu	$r4, $zero, $fp
	jalr	$r6
	nop
	ld32	$r1, 220($sp)
	addiu32	$r5, $r1, 16
	ld32	$r6, %call16(Field2Copy)($gp)
	addu	$r4, $zero, $fp
	jalr	$r6
	nop
	ld32	$r1, 220($sp)
	addiu32	$r5, $r1, 32
	ld32	$r6, %call16(Field2Copy)($gp)
	ld32	$r4, 48($sp)            # 4-byte Folded Reload
	jalr	$r6
	nop
	ld32	$r1, 220($sp)
	addiu32	$r5, $r1, 48
	ld32	$r6, %call16(Field2Copy)($gp)
	ld32	$r4, 36($sp)            # 4-byte Folded Reload
	jalr	$r6
	nop
	ld32	$r1, 220($sp)
	addiu32	$r5, $r1, 64
	ld32	$r6, %call16(Field2Copy)($gp)
	ld32	$r4, 44($sp)            # 4-byte Folded Reload
	jalr	$r6
	nop
	ld32	$r1, 220($sp)
	addiu32	$r5, $r1, 80
	ld32	$r6, %call16(Field2Copy)($gp)
	addu	$r4, $zero, $fp
	jalr	$r6
	nop
	addiu32	$r2, $zero, 0
	ld32	$fp, 232($sp)           # 4-byte Folded Reload
	ld32	$lr, 236($sp)           # 4-byte Folded Reload
	addiu32	$sp, $sp, 240
	ret	$lr
	nop
	.set	macro
	.set	reorder
	.end	LineDouble
$func_end47:
	.size	LineDouble, ($func_end47)-LineDouble

	.globl	LineAdd
	.align	2
	.type	LineAdd,@function
	.ent	LineAdd                 # @LineAdd
LineAdd:
	.frame	$fp,360,$lr
	.mask 	0x00a0000000a0000000a0000000a00000,-8
	.set	noreorder
	.cpload	$t9
	.set	nomacro
# BB#0:                                 # %entry
	lui	$r2, %hi(_gp_disp)
	addiu32	$r2, $r2, %lo(_gp_disp)
	addiu32	$sp, $sp, -360
	st32	$lr, 356($sp)           # 4-byte Folded Spill
	st32	$fp, 352($sp)           # 4-byte Folded Spill
	ld32	$r1, 376($sp)
	ld32	$r2, 372($sp)
	ld32	$r3, 368($sp)
	st32	$r4, 348($sp)
	st32	$r5, 344($sp)
	st32	$r3, 340($sp)
	st32	$r2, 336($sp)
	st32	$r1, 332($sp)
	ld32	$r1, 344($sp)
	addiu32	$r4, $r1, 32
	addiu	$r5, $sp, 136
	st32	$r5, 60($sp)            # 4-byte Folded Spill
	ld32	$r6, %call16(Field2Squaring)($gp)
	addu	$fp, $zero, $r5
	jalr	$r6
	nop
	ld32	$r4, 348($sp)
	addiu	$r1, $sp, 312
	st32	$r1, 32($sp)            # 4-byte Folded Spill
	st32	$r1, 8($sp)
	ld32	$r6, %call16(Field2Mul)($gp)
	addu	$r5, $zero, $fp
	jalr	$r6
	nop
	ld32	$r1, 344($sp)
	ld32	$r2, 348($sp)
	addiu	$r3, $sp, 104
	st32	$r3, 68($sp)            # 4-byte Folded Spill
	st32	$r3, 68($sp)            # 4-byte Folded Spill
	st32	$r3, 8($sp)
	addu	$fp, $zero, $r3
	addiu32	$r4, $r2, 16
	addiu32	$r5, $r1, 32
	ld32	$r6, %call16(Field2Add)($gp)
	jalr	$r6
	nop
	addiu	$r5, $sp, 88
	st32	$r5, 64($sp)            # 4-byte Folded Spill
	ld32	$r6, %call16(Field2Squaring)($gp)
	addu	$r4, $zero, $fp
	jalr	$r6
	nop
	ld32	$r1, 348($sp)
	addiu32	$r4, $r1, 16
	addiu	$fp, $sp, 120
	st32	$fp, 24($sp)            # 4-byte Folded Spill
	ld32	$r6, %call16(Field2Squaring)($gp)
	addu	$r5, $zero, $fp
	jalr	$r6
	nop
	ld32	$r1, 68($sp)            # 4-byte Folded Reload
	st32	$r1, 8($sp)
	ld32	$r6, %call16(Field2Add)($gp)
	addu	$r4, $zero, $fp
	ld32	$r5, 60($sp)            # 4-byte Folded Reload
	jalr	$r6
	nop
	addiu	$r1, $sp, 296
	st32	$r1, 56($sp)            # 4-byte Folded Spill
	st32	$r1, 56($sp)            # 4-byte Folded Spill
	st32	$r1, 8($sp)
	ld32	$r6, %call16(Field2Sub)($gp)
	ld32	$r4, 64($sp)            # 4-byte Folded Reload
	ld32	$fp, 68($sp)            # 4-byte Folded Reload
	addu	$r5, $zero, $fp
	jalr	$r6
	nop
	st32	$fp, 8($sp)
	ld32	$r6, %call16(Field2Mul)($gp)
	ld32	$r4, 56($sp)            # 4-byte Folded Reload
	ld32	$r5, 60($sp)            # 4-byte Folded Reload
	jalr	$r6
	nop
	ld32	$r6, %call16(Field2Copy)($gp)
	addu	$r4, $zero, $fp
	ld32	$r5, 56($sp)            # 4-byte Folded Reload
	jalr	$r6
	nop
	ld32	$r5, 344($sp)
	addiu	$r1, $sp, 280
	st32	$r1, 44($sp)            # 4-byte Folded Spill
	st32	$r1, 8($sp)
	ld32	$r6, %call16(Field2Sub)($gp)
	ld32	$r4, 32($sp)            # 4-byte Folded Reload
	jalr	$r6
	nop
	addiu	$r5, $sp, 264
	st32	$r5, 40($sp)            # 4-byte Folded Spill
	st32	$r5, 40($sp)            # 4-byte Folded Spill
	ld32	$r6, %call16(Field2Squaring)($gp)
	ld32	$r4, 44($sp)            # 4-byte Folded Reload
	jalr	$r6
	nop
	addiu	$fp, $sp, 248
	st32	$fp, 20($sp)            # 4-byte Folded Spill
	st32	$fp, 8($sp)
	ld32	$r6, %call16(Field2Add)($gp)
	ld32	$r4, 40($sp)            # 4-byte Folded Reload
	addu	$r5, $zero, $r4
	jalr	$r6
	nop
	st32	$fp, 8($sp)
	ld32	$r6, %call16(Field2Add)($gp)
	addu	$r4, $zero, $fp
	addu	$r5, $zero, $fp
	jalr	$r6
	nop
	addiu	$r1, $sp, 232
	st32	$r1, 28($sp)            # 4-byte Folded Spill
	st32	$r1, 8($sp)
	ld32	$r6, %call16(Field2Mul)($gp)
	addu	$r4, $zero, $fp
	ld32	$r5, 44($sp)            # 4-byte Folded Reload
	jalr	$r6
	nop
	ld32	$r1, 344($sp)
	ld32	$fp, 68($sp)            # 4-byte Folded Reload
	st32	$fp, 68($sp)            # 4-byte Folded Spill
	st32	$fp, 68($sp)            # 4-byte Folded Spill
	st32	$fp, 8($sp)
	addiu32	$r4, $r1, 16
	ld32	$r6, %call16(Field2Add)($gp)
	addu	$r5, $zero, $r4
	jalr	$r6
	nop
	addiu	$r1, $sp, 216
	st32	$r1, 52($sp)            # 4-byte Folded Spill
	st32	$r1, 52($sp)            # 4-byte Folded Spill
	st32	$r1, 8($sp)
	ld32	$r6, %call16(Field2Sub)($gp)
	ld32	$r4, 56($sp)            # 4-byte Folded Reload
	addu	$r5, $zero, $fp
	jalr	$r6
	nop
	ld32	$r5, 348($sp)
	addiu	$r1, $sp, 168
	st32	$r1, 48($sp)            # 4-byte Folded Spill
	st32	$r1, 8($sp)
	ld32	$r6, %call16(Field2Mul)($gp)
	ld32	$fp, 52($sp)            # 4-byte Folded Reload
	addu	$r4, $zero, $fp
	jalr	$r6
	nop
	ld32	$r4, 344($sp)
	addiu	$r1, $sp, 200
	st32	$r1, 36($sp)            # 4-byte Folded Spill
	st32	$r1, 36($sp)            # 4-byte Folded Spill
	st32	$r1, 8($sp)
	ld32	$r6, %call16(Field2Mul)($gp)
	ld32	$r5, 20($sp)            # 4-byte Folded Reload
	jalr	$r6
	nop
	ld32	$r6, %call16(Field2Squaring)($gp)
	addu	$r4, $zero, $fp
	ld32	$fp, 68($sp)            # 4-byte Folded Reload
	st32	$fp, 68($sp)            # 4-byte Folded Spill
	addu	$r5, $zero, $fp
	jalr	$r6
	nop
	ld32	$r1, 64($sp)            # 4-byte Folded Reload
	st32	$r1, 8($sp)
	ld32	$r6, %call16(Field2Add)($gp)
	ld32	$r4, 36($sp)            # 4-byte Folded Reload
	addu	$r5, $zero, $r4
	jalr	$r6
	nop
	ld32	$r5, 64($sp)            # 4-byte Folded Reload
	st32	$r5, 64($sp)            # 4-byte Folded Spill
	st32	$r5, 8($sp)
	ld32	$r6, %call16(Field2Add)($gp)
	ld32	$r4, 28($sp)            # 4-byte Folded Reload
	jalr	$r6
	nop
	ld32	$r1, 332($sp)
	st32	$r1, 8($sp)
	ld32	$r6, %call16(Field2Sub)($gp)
	addu	$r4, $zero, $fp
	ld32	$r5, 64($sp)            # 4-byte Folded Reload
	jalr	$r6
	nop
	ld32	$r1, 344($sp)
	st32	$fp, 8($sp)
	addiu32	$r4, $r1, 32
	ld32	$r6, %call16(Field2Add)($gp)
	ld32	$r5, 44($sp)            # 4-byte Folded Reload
	jalr	$r6
	nop
	ld32	$r6, %call16(Field2Squaring)($gp)
	addu	$r4, $zero, $fp
	ld32	$r5, 64($sp)            # 4-byte Folded Reload
	jalr	$r6
	nop
	st32	$fp, 8($sp)
	ld32	$r6, %call16(Field2Add)($gp)
	ld32	$r4, 60($sp)            # 4-byte Folded Reload
	ld32	$r5, 40($sp)            # 4-byte Folded Reload
	jalr	$r6
	nop
	ld32	$r1, 332($sp)
	addiu32	$r1, $r1, 32
	st32	$r1, 8($sp)
	ld32	$r6, %call16(Field2Sub)($gp)
	ld32	$r4, 64($sp)            # 4-byte Folded Reload
	addu	$r5, $zero, $fp
	jalr	$r6
	nop
	ld32	$r1, 332($sp)
	ld32	$r2, 348($sp)
	addiu	$r3, $sp, 152
	st32	$r3, 60($sp)            # 4-byte Folded Spill
	st32	$r3, 60($sp)            # 4-byte Folded Spill
	st32	$r3, 8($sp)
	addiu32	$r4, $r2, 16
	addiu32	$r5, $r1, 32
	ld32	$r6, %call16(Field2Add)($gp)
	jalr	$r6
	nop
	ld32	$r5, 332($sp)
	st32	$fp, 8($sp)
	ld32	$r6, %call16(Field2Sub)($gp)
	ld32	$r4, 36($sp)            # 4-byte Folded Reload
	jalr	$r6
	nop
	addiu	$r1, $sp, 184
	st32	$r1, 44($sp)            # 4-byte Folded Spill
	st32	$r1, 8($sp)
	ld32	$r6, %call16(Field2Mul)($gp)
	addu	$r4, $zero, $fp
	ld32	$r5, 52($sp)            # 4-byte Folded Reload
	jalr	$r6
	nop
	ld32	$r1, 344($sp)
	st32	$fp, 8($sp)
	addiu32	$r4, $r1, 16
	ld32	$r6, %call16(Field2Mul)($gp)
	ld32	$r5, 28($sp)            # 4-byte Folded Reload
	jalr	$r6
	nop
	ld32	$fp, 32($sp)            # 4-byte Folded Reload
	st32	$fp, 8($sp)
	ld32	$r6, %call16(Field2Add)($gp)
	ld32	$r4, 68($sp)            # 4-byte Folded Reload
	addu	$r5, $zero, $r4
	jalr	$r6
	nop
	ld32	$r1, 332($sp)
	addiu32	$r1, $r1, 16
	st32	$r1, 8($sp)
	ld32	$r6, %call16(Field2Sub)($gp)
	ld32	$r4, 44($sp)            # 4-byte Folded Reload
	addu	$r5, $zero, $fp
	jalr	$r6
	nop
	ld32	$r6, %call16(Field2Squaring)($gp)
	ld32	$r4, 60($sp)            # 4-byte Folded Reload
	st32	$r4, 60($sp)            # 4-byte Folded Spill
	ld32	$r5, 68($sp)            # 4-byte Folded Reload
	jalr	$r6
	nop
	ld32	$r1, 332($sp)
	addiu32	$r4, $r1, 32
	ld32	$r6, %call16(Field2Squaring)($gp)
	ld32	$fp, 64($sp)            # 4-byte Folded Reload
	st32	$fp, 64($sp)            # 4-byte Folded Spill
	addu	$r5, $zero, $fp
	jalr	$r6
	nop
	st32	$fp, 8($sp)
	ld32	$r6, %call16(Field2Add)($gp)
	addu	$r4, $zero, $fp
	ld32	$r5, 24($sp)            # 4-byte Folded Reload
	jalr	$r6
	nop
	ld32	$r1, 60($sp)            # 4-byte Folded Reload
	st32	$r1, 8($sp)
	ld32	$r6, %call16(Field2Sub)($gp)
	ld32	$fp, 68($sp)            # 4-byte Folded Reload
	st32	$fp, 68($sp)            # 4-byte Folded Spill
	addu	$r4, $zero, $fp
	ld32	$r5, 64($sp)            # 4-byte Folded Reload
	jalr	$r6
	nop
	st32	$fp, 8($sp)
	ld32	$r6, %call16(Field2Add)($gp)
	ld32	$fp, 48($sp)            # 4-byte Folded Reload
	st32	$fp, 48($sp)            # 4-byte Folded Spill
	addu	$r4, $zero, $fp
	addu	$r5, $zero, $fp
	jalr	$r6
	nop
	st32	$fp, 8($sp)
	ld32	$r6, %call16(Field2Sub)($gp)
	ld32	$r4, 68($sp)            # 4-byte Folded Reload
	ld32	$r5, 60($sp)            # 4-byte Folded Reload
	jalr	$r6
	nop
	ld32	$fp, 340($sp)
	ld64	$gwr4, 8($fp)
	ld32	$r1, 332($sp)
	addiu32	$r4, $r1, 32
	ld32	$r6, %call16(Field2MulConst)($gp)
	ld32	$fp, 68($sp)            # 4-byte Folded Reload
	st32	$fp, 68($sp)            # 4-byte Folded Spill
	addu	$r5, $zero, $fp
	jalr	$r6
	nop
	ld32	$r1, 60($sp)            # 4-byte Folded Reload
	st32	$r1, 8($sp)
	ld32	$r6, %call16(Field2Add)($gp)
	addu	$r4, $zero, $fp
	addu	$r5, $zero, $r4
	jalr	$r6
	nop
	ld32	$r6, %call16(Field2Neg)($gp)
	ld32	$r4, 52($sp)            # 4-byte Folded Reload
	st32	$r4, 52($sp)            # 4-byte Folded Spill
	addu	$r5, $zero, $r4
	jalr	$r6
	nop
	ld32	$fp, 340($sp)
	ld64	$gwr4, 0($fp)
	ld32	$r6, %call16(Field2MulConst)($gp)
	ld32	$r4, 52($sp)            # 4-byte Folded Reload
	ld32	$fp, 68($sp)            # 4-byte Folded Reload
	addu	$r5, $zero, $fp
	jalr	$r6
	nop
	ld32	$r1, 56($sp)            # 4-byte Folded Reload
	st32	$r1, 8($sp)
	ld32	$r6, %call16(Field2Add)($gp)
	addu	$r4, $zero, $fp
	addu	$r5, $zero, $fp
	jalr	$r6
	nop
	addiu	$fp, $sp, 72
	ld32	$r6, %call16(Field2SetZero)($gp)
	addu	$r4, $zero, $fp
	jalr	$r6
	nop
	ld32	$r5, 336($sp)
	ld32	$r6, %call16(Field2Copy)($gp)
	addu	$r4, $zero, $fp
	jalr	$r6
	nop
	ld32	$r1, 336($sp)
	addiu32	$r5, $r1, 16
	ld32	$r6, %call16(Field2Copy)($gp)
	addu	$r4, $zero, $fp
	jalr	$r6
	nop
	ld32	$r1, 336($sp)
	addiu32	$r5, $r1, 32
	ld32	$r6, %call16(Field2Copy)($gp)
	ld32	$r4, 60($sp)            # 4-byte Folded Reload
	jalr	$r6
	nop
	ld32	$r1, 336($sp)
	addiu32	$r5, $r1, 48
	ld32	$r6, %call16(Field2Copy)($gp)
	ld32	$r4, 48($sp)            # 4-byte Folded Reload
	jalr	$r6
	nop
	ld32	$r1, 336($sp)
	addiu32	$r5, $r1, 64
	ld32	$r6, %call16(Field2Copy)($gp)
	ld32	$r4, 56($sp)            # 4-byte Folded Reload
	jalr	$r6
	nop
	ld32	$r1, 336($sp)
	addiu32	$r5, $r1, 80
	ld32	$r6, %call16(Field2Copy)($gp)
	addu	$r4, $zero, $fp
	jalr	$r6
	nop
	addiu32	$r2, $zero, 0
	ld32	$fp, 352($sp)           # 4-byte Folded Reload
	ld32	$lr, 356($sp)           # 4-byte Folded Reload
	addiu32	$sp, $sp, 360
	ret	$lr
	nop
	.set	macro
	.set	reorder
	.end	LineAdd
$func_end48:
	.size	LineAdd, ($func_end48)-LineAdd

	.globl	FrobeniusMapOdd
	.align	2
	.type	FrobeniusMapOdd,@function
	.ent	FrobeniusMapOdd         # @FrobeniusMapOdd
FrobeniusMapOdd:
	.frame	$fp,32,$lr
	.mask 	0x00a0000000a0000000a0000000a00000,-8
	.set	noreorder
	.cpload	$t9
	.set	nomacro
# BB#0:                                 # %entry
	lui	$r2, %hi(_gp_disp)
	addiu32	$r2, $r2, %lo(_gp_disp)
	addiu32	$sp, $sp, -32
	st32	$lr, 28($sp)            # 4-byte Folded Spill
	st32	$fp, 24($sp)            # 4-byte Folded Spill
	ld32	$r1, 40($sp)
	st32	$r4, 20($sp)
	st32	$r5, 16($sp)
	st32	$r1, 12($sp)
	ld32	$r4, 20($sp)
	ld32	$r6, %call16(Field2Conjugate)($gp)
	addu	$r5, $zero, $r1
	jalr	$r6
	nop
	ld32	$r1, 12($sp)
	ld32	$r2, 20($sp)
	addiu32	$r4, $r2, 16
	addiu32	$r5, $r1, 16
	ld32	$r6, %call16(Field2Conjugate)($gp)
	jalr	$r6
	nop
	ld32	$r1, 12($sp)
	ld32	$r2, 20($sp)
	addiu32	$r4, $r2, 32
	addiu32	$r5, $r1, 32
	ld32	$r6, %call16(Field2Conjugate)($gp)
	jalr	$r6
	nop
	ld32	$r1, 12($sp)
	ld32	$r2, 20($sp)
	addiu32	$r4, $r2, 48
	addiu32	$r5, $r1, 48
	ld32	$r6, %call16(Field2Conjugate)($gp)
	jalr	$r6
	nop
	ld32	$r1, 12($sp)
	ld32	$r2, 20($sp)
	addiu32	$r4, $r2, 64
	addiu32	$r5, $r1, 64
	ld32	$r6, %call16(Field2Conjugate)($gp)
	jalr	$r6
	nop
	ld32	$r1, 12($sp)
	ld32	$r2, 20($sp)
	addiu32	$r4, $r2, 80
	addiu32	$r5, $r1, 80
	ld32	$r6, %call16(Field2Conjugate)($gp)
	jalr	$r6
	nop
	ld32	$fp, 16($sp)
	ld64	$gwr4, 8($fp)
	ld32	$r1, 12($sp)
	addiu32	$r4, $r1, 16
	ld32	$r6, %call16(Field2MulConst)($gp)
	addu	$r5, $zero, $r4
	jalr	$r6
	nop
	ld32	$fp, 16($sp)
	ld64	$gwr4, 24($fp)
	ld32	$r1, 12($sp)
	addiu32	$r4, $r1, 32
	ld32	$r6, %call16(Field2MulConst)($gp)
	addu	$r5, $zero, $r4
	jalr	$r6
	nop
	ld32	$fp, 16($sp)
	ld64	$gwr4, 0($fp)
	ld32	$r1, 12($sp)
	addiu32	$r4, $r1, 48
	ld32	$r6, %call16(Field2MulConst)($gp)
	addu	$r5, $zero, $r4
	jalr	$r6
	nop
	ld32	$fp, 16($sp)
	ld64	$gwr4, 16($fp)
	ld32	$r1, 12($sp)
	addiu32	$r4, $r1, 64
	ld32	$r6, %call16(Field2MulConst)($gp)
	addu	$r5, $zero, $r4
	jalr	$r6
	nop
	ld32	$fp, 16($sp)
	ld64	$gwr4, 32($fp)
	ld32	$r1, 12($sp)
	addiu32	$r4, $r1, 80
	ld32	$r6, %call16(Field2MulConst)($gp)
	addu	$r5, $zero, $r4
	jalr	$r6
	nop
	addiu32	$r2, $zero, 0
	ld32	$fp, 24($sp)            # 4-byte Folded Reload
	ld32	$lr, 28($sp)            # 4-byte Folded Reload
	addiu32	$sp, $sp, 32
	ret	$lr
	nop
	.set	macro
	.set	reorder
	.end	FrobeniusMapOdd
$func_end49:
	.size	FrobeniusMapOdd, ($func_end49)-FrobeniusMapOdd

	.globl	FrobeniusMapEven
	.align	2
	.type	FrobeniusMapEven,@function
	.ent	FrobeniusMapEven        # @FrobeniusMapEven
FrobeniusMapEven:
	.frame	$fp,32,$lr
	.mask 	0x00a0000000a0000000a0000000a00000,-8
	.set	noreorder
	.cpload	$t9
	.set	nomacro
# BB#0:                                 # %entry
	lui	$r2, %hi(_gp_disp)
	addiu32	$r2, $r2, %lo(_gp_disp)
	addiu32	$sp, $sp, -32
	st32	$lr, 28($sp)            # 4-byte Folded Spill
	st32	$fp, 24($sp)            # 4-byte Folded Spill
	ld32	$r1, 40($sp)
	st32	$r4, 20($sp)
	st32	$r5, 16($sp)
	st32	$r1, 12($sp)
	ld32	$r4, 20($sp)
	ld32	$r6, %call16(Field2Copy)($gp)
	addu	$r5, $zero, $r1
	jalr	$r6
	nop
	ld32	$fp, 16($sp)
	ld64	$gwr4, 8($fp)
	ld32	$r1, 12($sp)
	ld32	$r2, 20($sp)
	addiu32	$r4, $r2, 16
	addiu32	$r5, $r1, 16
	ld32	$r6, %call16(Field2MulConst)($gp)
	jalr	$r6
	nop
	ld32	$fp, 16($sp)
	ld64	$gwr4, 24($fp)
	ld32	$r1, 12($sp)
	ld32	$r2, 20($sp)
	addiu32	$r4, $r2, 32
	addiu32	$r5, $r1, 32
	ld32	$r6, %call16(Field2MulConst)($gp)
	jalr	$r6
	nop
	ld32	$fp, 16($sp)
	ld64	$gwr4, 0($fp)
	ld32	$r1, 12($sp)
	ld32	$r2, 20($sp)
	addiu32	$r4, $r2, 48
	addiu32	$r5, $r1, 48
	ld32	$r6, %call16(Field2MulConst)($gp)
	jalr	$r6
	nop
	ld32	$fp, 16($sp)
	ld64	$gwr4, 16($fp)
	ld32	$r1, 12($sp)
	ld32	$r2, 20($sp)
	addiu32	$r4, $r2, 64
	addiu32	$r5, $r1, 64
	ld32	$r6, %call16(Field2MulConst)($gp)
	jalr	$r6
	nop
	ld32	$fp, 16($sp)
	ld64	$gwr4, 32($fp)
	ld32	$r1, 12($sp)
	ld32	$r2, 20($sp)
	addiu32	$r4, $r2, 80
	addiu32	$r5, $r1, 80
	ld32	$r6, %call16(Field2MulConst)($gp)
	jalr	$r6
	nop
	addiu32	$r2, $zero, 0
	ld32	$fp, 24($sp)            # 4-byte Folded Reload
	ld32	$lr, 28($sp)            # 4-byte Folded Reload
	addiu32	$sp, $sp, 32
	ret	$lr
	nop
	.set	macro
	.set	reorder
	.end	FrobeniusMapEven
$func_end50:
	.size	FrobeniusMapEven, ($func_end50)-FrobeniusMapEven

	.globl	FinalExp
	.align	2
	.type	FinalExp,@function
	.ent	FinalExp                # @FinalExp
FinalExp:
	.frame	$fp,1936,$lr
	.mask 	0x00a0000000a0000000a0000000a00000,-8
	.set	noreorder
	.cpload	$t9
	.set	nomacro
# BB#0:                                 # %entry
	lui	$r2, %hi(_gp_disp)
	addiu32	$r2, $r2, %lo(_gp_disp)
	addiu32	$sp, $sp, -1936
	st32	$lr, 1932($sp)          # 4-byte Folded Spill
	st32	$fp, 1928($sp)          # 4-byte Folded Spill
	ld32	$r1, 1960($sp)
	ld64	$gwr1, 1952($sp)
	ld64	$gwr2, 1944($sp)
	st32	$r4, 1924($sp)
	st32	$r5, 1920($sp)
	st64	$gwr4, 1912($sp)
	st64	$gwr5, 1904($sp)
	st64	$gwr2, 1896($sp)
	st64	$gwr1, 1888($sp)
	st32	$r1, 1884($sp)
	ld32	$r4, 1924($sp)
	addiu	$r5, $sp, 1784
	st32	$r5, 52($sp)            # 4-byte Folded Spill
	ld32	$r6, %call16(Field12Conjugate)($gp)
	jalr	$r6
	nop
	ld64	$gwr5, 1896($sp)
	ld64	$gwr4, 1912($sp)
	ld32	$r4, 1924($sp)
	addiu	$fp, $sp, 1688
	ld32	$r6, %call16(Field12Inverse)($gp)
	addu	$r5, $zero, $fp
	jalr	$r6
	nop
	ld32	$r1, 1884($sp)
	st32	$r1, 8($sp)
	ld32	$r6, %call16(Field12Mul)($gp)
	ld32	$r4, 52($sp)            # 4-byte Folded Reload
	addu	$r5, $zero, $fp
	jalr	$r6
	nop
	ld32	$r4, 1884($sp)
	ld32	$r1, 1920($sp)
	addiu	$r2, $sp, 152
	st32	$r2, 52($sp)            # 4-byte Folded Spill
	st32	$r2, 52($sp)            # 4-byte Folded Spill
	st32	$r2, 8($sp)
	addiu32	$r5, $r1, 40
	ld32	$r6, %call16(FrobeniusMapEven)($gp)
	jalr	$r6
	nop
	ld32	$r5, 1884($sp)
	addiu	$fp, $sp, 56
	st32	$fp, 48($sp)            # 4-byte Folded Spill
	st32	$fp, 8($sp)
	ld32	$r6, %call16(Field12Mul)($gp)
	ld32	$r4, 52($sp)            # 4-byte Folded Reload
	jalr	$r6
	nop
	ld32	$r5, 1884($sp)
	ld32	$r6, %call16(Field12Copy)($gp)
	addu	$r4, $zero, $fp
	jalr	$r6
	nop
	ld64	$gwr5, 1888($sp)
	ld64	$gwr4, 1904($sp)
	ld32	$r4, 1884($sp)
	addiu	$r5, $sp, 1592
	st32	$r5, 40($sp)            # 4-byte Folded Spill
	ld32	$r6, %call16(Field12Exp)($gp)
	jalr	$r6
	nop
	ld64	$gwr5, 1888($sp)
	ld64	$gwr4, 1904($sp)
	addiu	$fp, $sp, 1496
	st32	$fp, 44($sp)            # 4-byte Folded Spill
	ld32	$r6, %call16(Field12Exp)($gp)
	ld32	$r4, 40($sp)            # 4-byte Folded Reload
	addu	$r5, $zero, $fp
	jalr	$r6
	nop
	ld64	$gwr5, 1888($sp)
	ld64	$gwr4, 1904($sp)
	addiu	$r5, $sp, 1400
	st32	$r5, 36($sp)            # 4-byte Folded Spill
	ld32	$r6, %call16(Field12Exp)($gp)
	addu	$r4, $zero, $fp
	jalr	$r6
	nop
	ld32	$r5, 1920($sp)
	ld32	$r4, 1884($sp)
	addiu	$r1, $sp, 1304
	st32	$r1, 32($sp)            # 4-byte Folded Spill
	st32	$r1, 8($sp)
	ld32	$r6, %call16(FrobeniusMapOdd)($gp)
	jalr	$r6
	nop
	ld32	$r4, 1884($sp)
	ld32	$r1, 1920($sp)
	addiu	$r2, $sp, 1208
	st32	$r2, 28($sp)            # 4-byte Folded Spill
	st32	$r2, 8($sp)
	addiu32	$r5, $r1, 40
	ld32	$r6, %call16(FrobeniusMapEven)($gp)
	jalr	$r6
	nop
	ld32	$r4, 1884($sp)
	ld32	$r1, 1920($sp)
	addiu	$r2, $sp, 1112
	st32	$r2, 24($sp)            # 4-byte Folded Spill
	st32	$r2, 8($sp)
	addiu32	$r5, $r1, 80
	ld32	$r6, %call16(FrobeniusMapOdd)($gp)
	jalr	$r6
	nop
	ld32	$fp, 52($sp)            # 4-byte Folded Reload
	st32	$fp, 52($sp)            # 4-byte Folded Spill
	st32	$fp, 52($sp)            # 4-byte Folded Spill
	st32	$fp, 8($sp)
	ld32	$r6, %call16(Field12Mul)($gp)
	ld32	$r4, 32($sp)            # 4-byte Folded Reload
	ld32	$r5, 28($sp)            # 4-byte Folded Reload
	jalr	$r6
	nop
	addiu	$r1, $sp, 1016
	st32	$r1, 32($sp)            # 4-byte Folded Spill
	st32	$r1, 8($sp)
	ld32	$r6, %call16(Field12Mul)($gp)
	ld32	$r4, 24($sp)            # 4-byte Folded Reload
	addu	$r5, $zero, $fp
	jalr	$r6
	nop
	ld32	$r4, 1884($sp)
	addiu	$r5, $sp, 920
	st32	$r5, 28($sp)            # 4-byte Folded Spill
	ld32	$r6, %call16(Field12Conjugate)($gp)
	jalr	$r6
	nop
	ld32	$r1, 1920($sp)
	addiu	$r2, $sp, 824
	st32	$r2, 24($sp)            # 4-byte Folded Spill
	st32	$r2, 8($sp)
	addiu32	$r5, $r1, 40
	ld32	$r6, %call16(FrobeniusMapEven)($gp)
	ld32	$r4, 44($sp)            # 4-byte Folded Reload
	st32	$r4, 44($sp)            # 4-byte Folded Spill
	jalr	$r6
	nop
	ld32	$r5, 1920($sp)
	addiu	$fp, $sp, 728
	st32	$fp, 20($sp)            # 4-byte Folded Spill
	st32	$fp, 8($sp)
	ld32	$r6, %call16(FrobeniusMapOdd)($gp)
	ld32	$r4, 40($sp)            # 4-byte Folded Reload
	jalr	$r6
	nop
	ld32	$r6, %call16(Field12Conjugate)($gp)
	addu	$r4, $zero, $fp
	addu	$r5, $zero, $fp
	jalr	$r6
	nop
	ld32	$r5, 1920($sp)
	ld32	$r1, 52($sp)            # 4-byte Folded Reload
	st32	$r1, 8($sp)
	ld32	$r6, %call16(FrobeniusMapOdd)($gp)
	ld32	$r4, 44($sp)            # 4-byte Folded Reload
	st32	$r4, 44($sp)            # 4-byte Folded Spill
	jalr	$r6
	nop
	addiu	$fp, $sp, 632
	st32	$fp, 16($sp)            # 4-byte Folded Spill
	st32	$fp, 8($sp)
	ld32	$r6, %call16(Field12Mul)($gp)
	ld32	$r4, 52($sp)            # 4-byte Folded Reload
	st32	$r4, 52($sp)            # 4-byte Folded Spill
	st32	$r4, 52($sp)            # 4-byte Folded Spill
	ld32	$r5, 40($sp)            # 4-byte Folded Reload
	jalr	$r6
	nop
	ld32	$r6, %call16(Field12Conjugate)($gp)
	addu	$r4, $zero, $fp
	addu	$r5, $zero, $fp
	jalr	$r6
	nop
	addiu	$r5, $sp, 536
	st32	$r5, 40($sp)            # 4-byte Folded Spill
	ld32	$r6, %call16(Field12Conjugate)($gp)
	ld32	$r4, 44($sp)            # 4-byte Folded Reload
	jalr	$r6
	nop
	ld32	$r5, 1920($sp)
	ld32	$r1, 52($sp)            # 4-byte Folded Reload
	st32	$r1, 8($sp)
	ld32	$r6, %call16(FrobeniusMapOdd)($gp)
	ld32	$r4, 36($sp)            # 4-byte Folded Reload
	jalr	$r6
	nop
	addiu	$fp, $sp, 440
	st32	$fp, 8($sp)
	ld32	$r6, %call16(Field12Mul)($gp)
	ld32	$r4, 52($sp)            # 4-byte Folded Reload
	ld32	$r5, 36($sp)            # 4-byte Folded Reload
	jalr	$r6
	nop
	ld32	$r6, %call16(Field12Conjugate)($gp)
	addu	$r4, $zero, $fp
	addu	$r5, $zero, $fp
	jalr	$r6
	nop
	ld32	$r6, %call16(Field12Squaring)($gp)
	addu	$r4, $zero, $fp
	ld32	$fp, 52($sp)            # 4-byte Folded Reload
	addu	$r5, $zero, $fp
	jalr	$r6
	nop
	ld32	$r1, 48($sp)            # 4-byte Folded Reload
	st32	$r1, 48($sp)            # 4-byte Folded Spill
	st32	$r1, 48($sp)            # 4-byte Folded Spill
	st32	$r1, 8($sp)
	ld32	$r6, %call16(Field12Mul)($gp)
	ld32	$r4, 16($sp)            # 4-byte Folded Reload
	ld32	$r5, 40($sp)            # 4-byte Folded Reload
	jalr	$r6
	nop
	addiu	$r1, $sp, 344
	st32	$r1, 44($sp)            # 4-byte Folded Spill
	st32	$r1, 44($sp)            # 4-byte Folded Spill
	st32	$r1, 8($sp)
	ld32	$r6, %call16(Field12Mul)($gp)
	addu	$r4, $zero, $fp
	ld32	$r5, 48($sp)            # 4-byte Folded Reload
	jalr	$r6
	nop
	st32	$fp, 8($sp)
	ld32	$r6, %call16(Field12Mul)($gp)
	ld32	$r4, 20($sp)            # 4-byte Folded Reload
	ld32	$r5, 40($sp)            # 4-byte Folded Reload
	jalr	$r6
	nop
	addiu	$r1, $sp, 248
	st32	$r1, 40($sp)            # 4-byte Folded Spill
	st32	$r1, 8($sp)
	ld32	$r6, %call16(Field12Mul)($gp)
	addu	$r4, $zero, $fp
	ld32	$fp, 44($sp)            # 4-byte Folded Reload
	addu	$r5, $zero, $fp
	jalr	$r6
	nop
	ld32	$r1, 52($sp)            # 4-byte Folded Reload
	st32	$r1, 8($sp)
	ld32	$r6, %call16(Field12Mul)($gp)
	addu	$r4, $zero, $fp
	ld32	$r5, 24($sp)            # 4-byte Folded Reload
	jalr	$r6
	nop
	ld32	$r6, %call16(Field12Copy)($gp)
	ld32	$r4, 52($sp)            # 4-byte Folded Reload
	addu	$r5, $zero, $fp
	jalr	$r6
	nop
	ld32	$r6, %call16(Field12Squaring)($gp)
	ld32	$r4, 40($sp)            # 4-byte Folded Reload
	ld32	$r5, 52($sp)            # 4-byte Folded Reload
	jalr	$r6
	nop
	ld32	$fp, 48($sp)            # 4-byte Folded Reload
	st32	$fp, 48($sp)            # 4-byte Folded Spill
	st32	$fp, 8($sp)
	ld32	$r6, %call16(Field12Mul)($gp)
	ld32	$r4, 52($sp)            # 4-byte Folded Reload
	ld32	$r5, 44($sp)            # 4-byte Folded Reload
	jalr	$r6
	nop
	ld32	$r6, %call16(Field12Squaring)($gp)
	addu	$r4, $zero, $fp
	ld32	$fp, 40($sp)            # 4-byte Folded Reload
	addu	$r5, $zero, $fp
	jalr	$r6
	nop
	ld32	$r1, 44($sp)            # 4-byte Folded Reload
	st32	$r1, 8($sp)
	ld32	$r6, %call16(Field12Mul)($gp)
	addu	$r4, $zero, $fp
	ld32	$r5, 28($sp)            # 4-byte Folded Reload
	jalr	$r6
	nop
	ld32	$r1, 52($sp)            # 4-byte Folded Reload
	st32	$r1, 8($sp)
	ld32	$r6, %call16(Field12Mul)($gp)
	addu	$r4, $zero, $fp
	ld32	$r5, 32($sp)            # 4-byte Folded Reload
	jalr	$r6
	nop
	ld32	$r6, %call16(Field12Squaring)($gp)
	ld32	$r4, 44($sp)            # 4-byte Folded Reload
	ld32	$fp, 48($sp)            # 4-byte Folded Reload
	addu	$r5, $zero, $fp
	jalr	$r6
	nop
	ld32	$r1, 1884($sp)
	st32	$r1, 8($sp)
	ld32	$r6, %call16(Field12Mul)($gp)
	ld32	$r4, 52($sp)            # 4-byte Folded Reload
	addu	$r5, $zero, $fp
	jalr	$r6
	nop
	addiu32	$r2, $zero, 0
	ld32	$fp, 1928($sp)          # 4-byte Folded Reload
	ld32	$lr, 1932($sp)          # 4-byte Folded Reload
	addiu32	$sp, $sp, 1936
	ret	$lr
	nop
	.set	macro
	.set	reorder
	.end	FinalExp
$func_end51:
	.size	FinalExp, ($func_end51)-FinalExp

	.globl	Point2MoveToField12
	.align	2
	.type	Point2MoveToField12,@function
	.ent	Point2MoveToField12     # @Point2MoveToField12
Point2MoveToField12:
	.frame	$fp,96,$lr
	.mask 	0x00a0000000a0000000a0000000a00000,-8
	.set	noreorder
	.cpload	$t9
	.set	nomacro
# BB#0:                                 # %entry
	lui	$r2, %hi(_gp_disp)
	addiu32	$r2, $r2, %lo(_gp_disp)
	addiu32	$sp, $sp, -96
	st32	$lr, 92($sp)            # 4-byte Folded Spill
	st32	$fp, 88($sp)            # 4-byte Folded Spill
	ld64	$gwr1, 104($sp)
	st32	$r4, 84($sp)
	st64	$gwr4, 72($sp)
	st64	$gwr5, 64($sp)
	st64	$gwr1, 56($sp)
	st32	$r5, 52($sp)
	addiu64	$gwr1, $gwr0, 0
	st64	$gwr1, 32($sp)
	ld64	$gwr1, 64($sp)
	st64	$gwr1, 40($sp)
	ld64	$gwr5, 56($sp)
	ld64	$gwr4, 72($sp)
	addiu	$r4, $sp, 32
	addiu	$fp, $sp, 16
	ld32	$r6, %call16(Field2Inverse)($gp)
	addu	$r5, $zero, $fp
	jalr	$r6
	nop
	ld32	$r4, 52($sp)
	ld32	$r6, %call16(Field2SetZero)($gp)
	jalr	$r6
	nop
	ld32	$r1, 52($sp)
	addiu32	$r4, $r1, 16
	ld32	$r6, %call16(Field2SetZero)($gp)
	jalr	$r6
	nop
	ld32	$r4, 84($sp)
	ld32	$r1, 52($sp)
	addiu32	$r1, $r1, 32
	st32	$r1, 8($sp)
	ld32	$r6, %call16(Field2Mul)($gp)
	addu	$r5, $zero, $fp
	jalr	$r6
	nop
	ld32	$r1, 52($sp)
	addiu32	$r4, $r1, 48
	ld32	$r6, %call16(Field2SetZero)($gp)
	jalr	$r6
	nop
	ld32	$r1, 84($sp)
	ld32	$r2, 52($sp)
	addiu32	$r2, $r2, 64
	st32	$r2, 8($sp)
	addiu32	$r4, $r1, 16
	ld32	$r6, %call16(Field2Mul)($gp)
	addu	$r5, $zero, $fp
	jalr	$r6
	nop
	ld32	$r1, 52($sp)
	addiu32	$r4, $r1, 80
	ld32	$r6, %call16(Field2SetZero)($gp)
	jalr	$r6
	nop
	addiu32	$r2, $zero, 0
	ld32	$fp, 88($sp)            # 4-byte Folded Reload
	ld32	$lr, 92($sp)            # 4-byte Folded Reload
	addiu32	$sp, $sp, 96
	ret	$lr
	nop
	.set	macro
	.set	reorder
	.end	Point2MoveToField12
$func_end52:
	.size	Point2MoveToField12, ($func_end52)-Point2MoveToField12

	.globl	Point2BackFromField12
	.align	2
	.type	Point2BackFromField12,@function
	.ent	Point2BackFromField12   # @Point2BackFromField12
Point2BackFromField12:
	.frame	$fp,64,$lr
	.mask 	0x00a0000000a0000000a0000000a00000,-8
	.set	noreorder
	.cpload	$t9
	.set	nomacro
# BB#0:                                 # %entry
	lui	$r2, %hi(_gp_disp)
	addiu32	$r2, $r2, %lo(_gp_disp)
	addiu32	$sp, $sp, -64
	st32	$lr, 60($sp)            # 4-byte Folded Spill
	st32	$fp, 56($sp)            # 4-byte Folded Spill
	st32	$r4, 52($sp)
	st64	$gwr4, 40($sp)
	st32	$r5, 36($sp)
	addiu64	$gwr1, $gwr0, 0
	st64	$gwr1, 16($sp)
	ld64	$gwr1, 40($sp)
	st64	$gwr1, 24($sp)
	ld32	$r1, 52($sp)
	ld32	$r2, 36($sp)
	st32	$r2, 8($sp)
	addiu32	$r4, $r1, 32
	addiu	$fp, $sp, 16
	ld32	$r6, %call16(Field2Mul)($gp)
	addu	$r5, $zero, $fp
	jalr	$r6
	nop
	ld32	$r1, 52($sp)
	ld32	$r2, 36($sp)
	addiu32	$r2, $r2, 16
	st32	$r2, 8($sp)
	addiu32	$r4, $r1, 64
	ld32	$r6, %call16(Field2Mul)($gp)
	addu	$r5, $zero, $fp
	jalr	$r6
	nop
	ld64	$gwr4, 40($sp)
	ld32	$r1, 36($sp)
	addiu32	$r4, $r1, 32
	ld32	$r6, %call16(Field2SetOne)($gp)
	jalr	$r6
	nop
	addiu32	$r2, $zero, 0
	ld32	$fp, 56($sp)            # 4-byte Folded Reload
	ld32	$lr, 60($sp)            # 4-byte Folded Reload
	addiu32	$sp, $sp, 64
	ret	$lr
	nop
	.set	macro
	.set	reorder
	.end	Point2BackFromField12
$func_end53:
	.size	Point2BackFromField12, ($func_end53)-Point2BackFromField12

	.globl	optPairing
	.align	2
	.type	optPairing,@function
	.ent	optPairing              # @optPairing
optPairing:
	.frame	$fp,472,$lr
	.mask 	0x00a0000000a0000000a0000000a00000,-8
	.set	noreorder
	.cpload	$t9
	.set	nomacro
# BB#0:                                 # %entry
	lui	$r2, %hi(_gp_disp)
	addiu32	$r2, $r2, %lo(_gp_disp)
	addiu32	$sp, $sp, -472
	st32	$lr, 468($sp)           # 4-byte Folded Spill
	st32	$fp, 464($sp)           # 4-byte Folded Spill
	ld32	$r1, 484($sp)
	ld32	$r2, 480($sp)
	st32	$r4, 460($sp)
	st32	$r5, 456($sp)
	st32	$r2, 452($sp)
	st32	$r1, 448($sp)
	ld32	$fp, 452($sp)
	ld32	$r1, 120($fp)
	addiu32	$r1, $r1, -2
	st32	$r1, 444($sp)
	ld32	$fp, 452($sp)
	ld64	$gwr1, 144($fp)
	st64	$gwr1, 432($sp)
	ld32	$r4, 460($sp)
	addiu	$r5, $sp, 384
	st32	$r5, 36($sp)            # 4-byte Folded Spill
	st32	$r5, 36($sp)            # 4-byte Folded Spill
	st32	$r5, 36($sp)            # 4-byte Folded Spill
	ld32	$r6, %call16(Point2Copy)($gp)
	jalr	$r6
	nop
	ld32	$fp, 452($sp)
	ld64	$gwr4, 152($fp)
	ld32	$r4, 448($sp)
	ld32	$r6, %call16(Field12SetOne)($gp)
	jalr	$r6
	nop
	addiu	$r1, $sp, 144
	st32	$r1, 44($sp)            # 4-byte Folded Spill
	addiu	$r1, $sp, 288
	st32	$r1, 40($sp)            # 4-byte Folded Spill
	addiu	$r1, $sp, 192
	st32	$r1, 32($sp)            # 4-byte Folded Spill
$BB54_1:                                # %while.cond
                                        # =>This Inner Loop Header: Depth=1
	ld32	$r1, 444($sp)
	addiu32	$r2, $zero, 0
	slt	$r1, $r1, $r2
	bne	$r1, $zero, $BB54_5
	nop
# BB#2:                                 # %while.body
                                        #   in Loop: Header=BB54_1 Depth=1
	ld32	$r5, 456($sp)
	ld32	$r1, 44($sp)            # 4-byte Folded Reload
	st32	$r1, 44($sp)            # 4-byte Folded Spill
	st32	$r1, 44($sp)            # 4-byte Folded Spill
	st32	$r1, 12($sp)
	ld32	$r1, 40($sp)            # 4-byte Folded Reload
	st32	$r1, 40($sp)            # 4-byte Folded Spill
	st32	$r1, 40($sp)            # 4-byte Folded Spill
	st32	$r1, 8($sp)
	ld32	$r6, %call16(LineDouble)($gp)
	ld32	$r4, 36($sp)            # 4-byte Folded Reload
	st32	$r4, 36($sp)            # 4-byte Folded Spill
	jalr	$r6
	nop
	ld32	$r4, 448($sp)
	ld32	$r6, %call16(Field12Squaring)($gp)
	ld32	$fp, 32($sp)            # 4-byte Folded Reload
	st32	$fp, 32($sp)            # 4-byte Folded Spill
	addu	$r5, $zero, $fp
	jalr	$r6
	nop
	ld32	$r1, 448($sp)
	st32	$r1, 8($sp)
	ld32	$r6, %call16(Field12Mul)($gp)
	addu	$r4, $zero, $fp
	ld32	$r5, 40($sp)            # 4-byte Folded Reload
	jalr	$r6
	nop
	ld32	$r6, %call16(Point2Copy)($gp)
	ld32	$r4, 44($sp)            # 4-byte Folded Reload
	ld32	$r5, 36($sp)            # 4-byte Folded Reload
	jalr	$r6
	nop
	ld64	$gwr1, 432($sp)
	andi64	$gwr1, $gwr1, 1
	addiu64	$gwr2, $gwr0, 1
	cmplong	$r1, $gwr1, $gwr2
	bne	$r1, $zero, $BB54_4
	nop
# BB#3:                                 # %if.then
                                        #   in Loop: Header=BB54_1 Depth=1
	ld32	$r4, 460($sp)
	ld32	$r1, 456($sp)
	st32	$r1, 8($sp)
	ld32	$r1, 44($sp)            # 4-byte Folded Reload
	st32	$r1, 44($sp)            # 4-byte Folded Spill
	st32	$r1, 44($sp)            # 4-byte Folded Spill
	st32	$r1, 16($sp)
	ld32	$r1, 40($sp)            # 4-byte Folded Reload
	st32	$r1, 40($sp)            # 4-byte Folded Spill
	st32	$r1, 40($sp)            # 4-byte Folded Spill
	st32	$r1, 12($sp)
	ld32	$r6, %call16(LineAdd)($gp)
	ld32	$r5, 36($sp)            # 4-byte Folded Reload
	st32	$r5, 36($sp)            # 4-byte Folded Spill
	jalr	$r6
	nop
	ld32	$r4, 448($sp)
	ld32	$fp, 32($sp)            # 4-byte Folded Reload
	st32	$fp, 32($sp)            # 4-byte Folded Spill
	st32	$fp, 8($sp)
	ld32	$r6, %call16(Field12Mul)($gp)
	ld32	$r5, 40($sp)            # 4-byte Folded Reload
	jalr	$r6
	nop
	ld32	$r5, 448($sp)
	ld32	$r6, %call16(Field12Copy)($gp)
	addu	$r4, $zero, $fp
	jalr	$r6
	nop
	ld32	$r6, %call16(Point2Copy)($gp)
	ld32	$r4, 44($sp)            # 4-byte Folded Reload
	ld32	$r5, 36($sp)            # 4-byte Folded Reload
	jalr	$r6
	nop
$BB54_4:                                # %if.end
                                        #   in Loop: Header=BB54_1 Depth=1
	ld64	$gwr1, 432($sp)
	sra64	$gwr1, $gwr1, 1
	st64	$gwr1, 432($sp)
	ld32	$r1, 444($sp)
	addiu32	$r1, $r1, -1
	st32	$r1, 444($sp)
	jmp	$BB54_1
	nop
$BB54_5:                                # %while.end
	ld32	$fp, 452($sp)
	st32	$fp, 40($sp)            # 4-byte Folded Spill
	ld32	$fp, 40($sp)            # 4-byte Folded Reload
	ld64	$gwr5, 152($fp)
	ld32	$fp, 40($sp)            # 4-byte Folded Reload
	ld64	$gwr4, 128($fp)
	ld32	$fp, 40($sp)            # 4-byte Folded Reload
	ld64	$gwr1, 160($fp)
	ld32	$r4, 460($sp)
	st64	$gwr1, 8($sp)
	addiu	$r5, $sp, 288
	st32	$r5, 40($sp)            # 4-byte Folded Spill
	st32	$r5, 40($sp)            # 4-byte Folded Spill
	ld32	$r6, %call16(Point2MoveToField12)($gp)
	jalr	$r6
	nop
	ld32	$r5, 452($sp)
	ld32	$fp, 32($sp)            # 4-byte Folded Reload
	st32	$fp, 32($sp)            # 4-byte Folded Spill
	st32	$fp, 32($sp)            # 4-byte Folded Spill
	st32	$fp, 32($sp)            # 4-byte Folded Spill
	st32	$fp, 8($sp)
	ld32	$r6, %call16(FrobeniusMapOdd)($gp)
	ld32	$r4, 40($sp)            # 4-byte Folded Reload
	jalr	$r6
	nop
	ld32	$fp, 452($sp)
	ld64	$gwr4, 152($fp)
	addiu	$r5, $sp, 96
	ld32	$r6, %call16(Point2BackFromField12)($gp)
	ld32	$fp, 32($sp)            # 4-byte Folded Reload
	addu	$r4, $zero, $fp
	jalr	$r6
	nop
	ld32	$r1, 452($sp)
	st32	$fp, 8($sp)
	addiu32	$r5, $r1, 40
	ld32	$r6, %call16(FrobeniusMapEven)($gp)
	ld32	$r4, 40($sp)            # 4-byte Folded Reload
	jalr	$r6
	nop
	ld32	$fp, 452($sp)
	ld64	$gwr4, 152($fp)
	addiu	$fp, $sp, 48
	ld32	$r6, %call16(Point2BackFromField12)($gp)
	ld32	$r4, 32($sp)            # 4-byte Folded Reload
	addu	$r5, $zero, $fp
	jalr	$r6
	nop
	ld32	$r6, %call16(Point2Neg)($gp)
	addu	$r4, $zero, $fp
	addu	$r5, $zero, $fp
	jalr	$r6
	nop
	ld32	$fp, 452($sp)
	ld32	$r1, 168($fp)
	beq	$r1, $zero, $BB54_7
	nop
# BB#6:                                 # %if.then.22
	ld32	$r6, %call16(Point2Neg)($gp)
	addiu	$r4, $sp, 384
	addu	$r5, $zero, $r4
	jalr	$r6
	nop
	ld32	$r4, 448($sp)
	ld32	$r6, %call16(Field12Conjugate)($gp)
	addu	$r5, $zero, $r4
	jalr	$r6
	nop
$BB54_7:                                # %if.end.25
	ld32	$r1, 456($sp)
	st32	$r1, 8($sp)
	ld32	$r1, 44($sp)            # 4-byte Folded Reload
	st32	$r1, 44($sp)            # 4-byte Folded Spill
	st32	$r1, 16($sp)
	ld32	$r1, 40($sp)            # 4-byte Folded Reload
	st32	$r1, 40($sp)            # 4-byte Folded Spill
	st32	$r1, 40($sp)            # 4-byte Folded Spill
	st32	$r1, 40($sp)            # 4-byte Folded Spill
	st32	$r1, 12($sp)
	ld32	$r6, %call16(LineAdd)($gp)
	addiu	$r4, $sp, 96
	addiu	$r5, $sp, 384
	st32	$r5, 36($sp)            # 4-byte Folded Spill
	jalr	$r6
	nop
	ld32	$r4, 448($sp)
	ld32	$fp, 32($sp)            # 4-byte Folded Reload
	st32	$fp, 32($sp)            # 4-byte Folded Spill
	st32	$fp, 8($sp)
	ld32	$r6, %call16(Field12Mul)($gp)
	ld32	$r5, 40($sp)            # 4-byte Folded Reload
	jalr	$r6
	nop
	ld32	$r5, 448($sp)
	ld32	$r6, %call16(Field12Copy)($gp)
	addu	$r4, $zero, $fp
	jalr	$r6
	nop
	ld32	$r6, %call16(Point2Copy)($gp)
	ld32	$fp, 44($sp)            # 4-byte Folded Reload
	st32	$fp, 44($sp)            # 4-byte Folded Spill
	addu	$r4, $zero, $fp
	ld32	$r5, 36($sp)            # 4-byte Folded Reload
	jalr	$r6
	nop
	ld32	$r1, 456($sp)
	st32	$r1, 8($sp)
	st32	$fp, 16($sp)
	ld32	$r1, 40($sp)            # 4-byte Folded Reload
	st32	$r1, 40($sp)            # 4-byte Folded Spill
	st32	$r1, 12($sp)
	addiu	$r4, $sp, 48
	ld32	$r6, %call16(LineAdd)($gp)
	ld32	$r5, 36($sp)            # 4-byte Folded Reload
	st32	$r5, 36($sp)            # 4-byte Folded Spill
	jalr	$r6
	nop
	ld32	$r4, 448($sp)
	ld32	$fp, 32($sp)            # 4-byte Folded Reload
	st32	$fp, 8($sp)
	ld32	$r6, %call16(Field12Mul)($gp)
	ld32	$r5, 40($sp)            # 4-byte Folded Reload
	jalr	$r6
	nop
	ld32	$r5, 448($sp)
	ld32	$r6, %call16(Field12Copy)($gp)
	addu	$r4, $zero, $fp
	jalr	$r6
	nop
	ld32	$r6, %call16(Point2Copy)($gp)
	ld32	$r4, 44($sp)            # 4-byte Folded Reload
	ld32	$r5, 36($sp)            # 4-byte Folded Reload
	jalr	$r6
	nop
	ld32	$fp, 452($sp)
	ld64	$gwr5, 136($fp)
	ld64	$gwr4, 128($fp)
	ld64	$gwr1, 160($fp)
	ld64	$gwr2, 152($fp)
	ld32	$r4, 448($sp)
	st64	$gwr2, 16($sp)
	st64	$gwr1, 8($sp)
	ld32	$r1, 40($sp)            # 4-byte Folded Reload
	st32	$r1, 24($sp)
	ld32	$r6, %call16(FinalExp)($gp)
	addu	$r5, $zero, $fp
	jalr	$r6
	nop
	ld32	$r5, 448($sp)
	ld32	$r6, %call16(Field12Copy)($gp)
	ld32	$r4, 40($sp)            # 4-byte Folded Reload
	jalr	$r6
	nop
	addiu32	$r2, $zero, 0
	ld32	$fp, 464($sp)           # 4-byte Folded Reload
	ld32	$lr, 468($sp)           # 4-byte Folded Reload
	addiu32	$sp, $sp, 472
	ret	$lr
	nop
	.set	macro
	.set	reorder
	.end	optPairing
$func_end54:
	.size	optPairing, ($func_end54)-optPairing

	.globl	TestFieldInverse
	.align	2
	.type	TestFieldInverse,@function
	.ent	TestFieldInverse        # @TestFieldInverse
TestFieldInverse:
	.frame	$fp,48,$lr
	.mask 	0x00800000008000000080000000800000,-8
	.set	noreorder
	.cpload	$t9
	.set	nomacro
# BB#0:                                 # %entry
	lui	$r2, %hi(_gp_disp)
	addiu32	$r2, $r2, %lo(_gp_disp)
	addiu32	$sp, $sp, -48
	st32	$lr, 44($sp)            # 4-byte Folded Spill
	ld64	$gwr1, 56($sp)
	st64	$gwr4, 32($sp)
	st64	$gwr5, 24($sp)
	st64	$gwr1, 16($sp)
	ld64	$gwr5, 24($sp)
	ld64	$gwr4, 32($sp)
	st64	$gwr1, 8($sp)
	ld32	$r6, %call16(FieldInverse)($gp)
	jalr	$r6
	nop
	ld32	$lr, 44($sp)            # 4-byte Folded Reload
	addiu32	$sp, $sp, 48
	ret	$lr
	nop
	.set	macro
	.set	reorder
	.end	TestFieldInverse
$func_end55:
	.size	TestFieldInverse, ($func_end55)-TestFieldInverse

	.globl	TestField2Inverse
	.align	2
	.type	TestField2Inverse,@function
	.ent	TestField2Inverse       # @TestField2Inverse
TestField2Inverse:
	.frame	$fp,40,$lr
	.mask 	0x00800000008000000080000000800000,-8
	.set	noreorder
	.cpload	$t9
	.set	nomacro
# BB#0:                                 # %entry
	lui	$r2, %hi(_gp_disp)
	addiu32	$r2, $r2, %lo(_gp_disp)
	addiu32	$sp, $sp, -40
	st32	$lr, 36($sp)            # 4-byte Folded Spill
	st32	$r4, 32($sp)
	st64	$gwr4, 24($sp)
	st64	$gwr5, 16($sp)
	ld32	$r5, 12($sp)
	ld64	$gwr4, 24($sp)
	ld32	$r4, 32($sp)
	ld32	$r6, %call16(Field2Inverse)($gp)
	jalr	$r6
	nop
	ld32	$r2, 12($sp)
	ld32	$lr, 36($sp)            # 4-byte Folded Reload
	addiu32	$sp, $sp, 40
	ret	$lr
	nop
	.set	macro
	.set	reorder
	.end	TestField2Inverse
$func_end56:
	.size	TestField2Inverse, ($func_end56)-TestField2Inverse

	.globl	TestField6Inverse
	.align	2
	.type	TestField6Inverse,@function
	.ent	TestField6Inverse       # @TestField6Inverse
TestField6Inverse:
	.frame	$fp,40,$lr
	.mask 	0x00800000008000000080000000800000,-8
	.set	noreorder
	.cpload	$t9
	.set	nomacro
# BB#0:                                 # %entry
	lui	$r2, %hi(_gp_disp)
	addiu32	$r2, $r2, %lo(_gp_disp)
	addiu32	$sp, $sp, -40
	st32	$lr, 36($sp)            # 4-byte Folded Spill
	st32	$r4, 32($sp)
	st64	$gwr4, 24($sp)
	st64	$gwr5, 16($sp)
	ld32	$r5, 12($sp)
	ld64	$gwr4, 24($sp)
	ld32	$r4, 32($sp)
	ld32	$r6, %call16(Field6Inverse)($gp)
	jalr	$r6
	nop
	ld32	$r2, 12($sp)
	ld32	$lr, 36($sp)            # 4-byte Folded Reload
	addiu32	$sp, $sp, 40
	ret	$lr
	nop
	.set	macro
	.set	reorder
	.end	TestField6Inverse
$func_end57:
	.size	TestField6Inverse, ($func_end57)-TestField6Inverse

	.globl	TestField12Inverse
	.align	2
	.type	TestField12Inverse,@function
	.ent	TestField12Inverse      # @TestField12Inverse
TestField12Inverse:
	.frame	$fp,40,$lr
	.mask 	0x00800000008000000080000000800000,-8
	.set	noreorder
	.cpload	$t9
	.set	nomacro
# BB#0:                                 # %entry
	lui	$r2, %hi(_gp_disp)
	addiu32	$r2, $r2, %lo(_gp_disp)
	addiu32	$sp, $sp, -40
	st32	$lr, 36($sp)            # 4-byte Folded Spill
	st32	$r4, 32($sp)
	st64	$gwr4, 24($sp)
	st64	$gwr5, 16($sp)
	ld32	$r5, 12($sp)
	ld64	$gwr4, 24($sp)
	ld32	$r4, 32($sp)
	ld32	$r6, %call16(Field12Inverse)($gp)
	jalr	$r6
	nop
	ld32	$r2, 12($sp)
	ld32	$lr, 36($sp)            # 4-byte Folded Reload
	addiu32	$sp, $sp, 40
	ret	$lr
	nop
	.set	macro
	.set	reorder
	.end	TestField12Inverse
$func_end58:
	.size	TestField12Inverse, ($func_end58)-TestField12Inverse

	.globl	TestField12Mul
	.align	2
	.type	TestField12Mul,@function
	.ent	TestField12Mul          # @TestField12Mul
TestField12Mul:
	.frame	$fp,32,$lr
	.mask 	0x00800000008000000080000000800000,-8
	.set	noreorder
	.cpload	$t9
	.set	nomacro
# BB#0:                                 # %entry
	lui	$r2, %hi(_gp_disp)
	addiu32	$r2, $r2, %lo(_gp_disp)
	addiu32	$sp, $sp, -32
	st32	$lr, 28($sp)            # 4-byte Folded Spill
	st32	$r4, 24($sp)
	st32	$r5, 20($sp)
	ld32	$r4, 24($sp)
	ld32	$r1, 16($sp)
	st32	$r1, 8($sp)
	ld32	$r6, %call16(Field12Mul)($gp)
	jalr	$r6
	nop
	ld32	$r2, 16($sp)
	ld32	$lr, 28($sp)            # 4-byte Folded Reload
	addiu32	$sp, $sp, 32
	ret	$lr
	nop
	.set	macro
	.set	reorder
	.end	TestField12Mul
$func_end59:
	.size	TestField12Mul, ($func_end59)-TestField12Mul

	.globl	TestField12Exp
	.align	2
	.type	TestField12Exp,@function
	.ent	TestField12Exp          # @TestField12Exp
TestField12Exp:
	.frame	$fp,40,$lr
	.mask 	0x00800000008000000080000000800000,-8
	.set	noreorder
	.cpload	$t9
	.set	nomacro
# BB#0:                                 # %entry
	lui	$r2, %hi(_gp_disp)
	addiu32	$r2, $r2, %lo(_gp_disp)
	addiu32	$sp, $sp, -40
	st32	$lr, 36($sp)            # 4-byte Folded Spill
	st32	$r4, 32($sp)
	st64	$gwr4, 24($sp)
	st64	$gwr5, 16($sp)
	ld32	$r5, 12($sp)
	ld64	$gwr4, 24($sp)
	ld32	$r4, 32($sp)
	ld32	$r6, %call16(Field12Exp)($gp)
	jalr	$r6
	nop
	ld32	$r2, 12($sp)
	ld32	$lr, 36($sp)            # 4-byte Folded Reload
	addiu32	$sp, $sp, 40
	ret	$lr
	nop
	.set	macro
	.set	reorder
	.end	TestField12Exp
$func_end60:
	.size	TestField12Exp, ($func_end60)-TestField12Exp

	.globl	TestFinalExp
	.align	2
	.type	TestFinalExp,@function
	.ent	TestFinalExp            # @TestFinalExp
TestFinalExp:
	.frame	$fp,88,$lr
	.mask 	0x00800000008000000080000000800000,-8
	.set	noreorder
	.cpload	$t9
	.set	nomacro
# BB#0:                                 # %entry
	lui	$r2, %hi(_gp_disp)
	addiu32	$r2, $r2, %lo(_gp_disp)
	addiu32	$sp, $sp, -88
	st32	$lr, 84($sp)            # 4-byte Folded Spill
	ld64	$gwr1, 104($sp)
	ld64	$gwr2, 96($sp)
	st32	$r4, 80($sp)
	st32	$r5, 76($sp)
	st64	$gwr4, 64($sp)
	st64	$gwr5, 56($sp)
	st64	$gwr2, 48($sp)
	st64	$gwr1, 40($sp)
	ld64	$gwr5, 56($sp)
	ld64	$gwr4, 64($sp)
	ld32	$r5, 76($sp)
	ld32	$r4, 80($sp)
	ld64	$gwr2, 48($sp)
	ld32	$r1, 36($sp)
	st64	$gwr1, 16($sp)
	st32	$r1, 24($sp)
	st64	$gwr2, 8($sp)
	ld32	$r6, %call16(FinalExp)($gp)
	jalr	$r6
	nop
	ld32	$r2, 36($sp)
	ld32	$lr, 84($sp)            # 4-byte Folded Reload
	addiu32	$sp, $sp, 88
	ret	$lr
	nop
	.set	macro
	.set	reorder
	.end	TestFinalExp
$func_end61:
	.size	TestFinalExp, ($func_end61)-TestFinalExp

	.globl	TestoptPairing
	.align	2
	.type	TestoptPairing,@function
	.ent	TestoptPairing          # @TestoptPairing
TestoptPairing:
	.frame	$fp,128,$lr
	.mask 	0x00a0000000a0000000a0000000a00000,-8
	.set	noreorder
	.cpload	$t9
	.set	nomacro
# BB#0:                                 # %entry
	lui	$r2, %hi(_gp_disp)
	addiu32	$r2, $r2, %lo(_gp_disp)
	addiu32	$sp, $sp, -128
	st32	$lr, 124($sp)           # 4-byte Folded Spill
	st32	$fp, 120($sp)           # 4-byte Folded Spill
	ld32	$fp, 136($sp)
	st32	$r4, 116($sp)
	st32	$r5, 112($sp)
	st32	$fp, 108($sp)
	ld64	$gwr5, 128($fp)
	ld64	$gwr1, 152($fp)
	ld64	$gwr2, 160($fp)
	ld32	$r4, 112($sp)
	st64	$gwr2, 16($sp)
	st64	$gwr1, 8($sp)
	addiu64	$gwr4, $gwr0, 21
	addiu	$r5, $sp, 80
	st32	$r5, 28($sp)            # 4-byte Folded Spill
	ld32	$r6, %call16(Point1Scalar)($gp)
	jalr	$r6
	nop
	ld32	$fp, 108($sp)
	ld64	$gwr5, 152($fp)
	ld64	$gwr4, 128($fp)
	ld64	$gwr1, 160($fp)
	st64	$gwr1, 8($sp)
	ld32	$r6, %call16(Point1Normalize)($gp)
	ld32	$r4, 28($sp)            # 4-byte Folded Reload
	jalr	$r6
	nop
	ld32	$fp, 108($sp)
	ld64	$gwr5, 128($fp)
	ld64	$gwr1, 152($fp)
	ld64	$gwr2, 160($fp)
	ld32	$r4, 116($sp)
	st64	$gwr2, 16($sp)
	st64	$gwr1, 8($sp)
	addiu64	$gwr4, $gwr0, 13
	addiu	$r5, $sp, 32
	st32	$r5, 24($sp)            # 4-byte Folded Spill
	ld32	$r6, %call16(Point2Scalar)($gp)
	jalr	$r6
	nop
	ld32	$fp, 108($sp)
	ld64	$gwr5, 152($fp)
	ld64	$gwr4, 128($fp)
	ld64	$gwr1, 160($fp)
	st64	$gwr1, 8($sp)
	ld32	$r6, %call16(Point2Normalize)($gp)
	ld32	$fp, 24($sp)            # 4-byte Folded Reload
	addu	$r4, $zero, $fp
	jalr	$r6
	nop
	ld32	$r1, 108($sp)
	ld32	$r2, 104($sp)
	st32	$r2, 12($sp)
	st32	$r1, 8($sp)
	ld32	$r6, %call16(optPairing)($gp)
	addu	$r4, $zero, $fp
	ld32	$r5, 28($sp)            # 4-byte Folded Reload
	jalr	$r6
	nop
	ld32	$r2, 104($sp)
	ld32	$fp, 120($sp)           # 4-byte Folded Reload
	ld32	$lr, 124($sp)           # 4-byte Folded Reload
	addiu32	$sp, $sp, 128
	ret	$lr
	nop
	.set	macro
	.set	reorder
	.end	TestoptPairing
$func_end62:
	.size	TestoptPairing, ($func_end62)-TestoptPairing

	.globl	main
	.align	2
	.type	main,@function
	.ent	main                    # @main
main:
	.frame	$fp,8,$lr
	.mask 	0x00000000000000000000000000000000,0
	.set	noreorder
	.set	nomacro
# BB#0:                                 # %entry
	addiu32	$sp, $sp, -8
	addiu32	$r2, $zero, 0
	st32	$r2, 4($sp)
	addiu32	$sp, $sp, 8
	ret	$lr
	nop
	.set	macro
	.set	reorder
	.end	main
$func_end63:
	.size	main, ($func_end63)-main


	.ident	"clang version 3.7.0 (tags/RELEASE_371/final)"
	.ident	"clang version 3.7.0 (tags/RELEASE_371/final)"
	.ident	"clang version 3.7.0 (tags/RELEASE_371/final)"
	.ident	"clang version 3.7.0 (tags/RELEASE_371/final)"
	.ident	"clang version 3.7.0 (tags/RELEASE_371/final)"
	.ident	"clang version 3.7.0 (tags/RELEASE_371/final)"
	.ident	"clang version 3.7.0 (tags/RELEASE_371/final)"
	.ident	"clang version 3.7.0 (tags/RELEASE_371/final)"
	.section	".note.GNU-stack","",@progbits
