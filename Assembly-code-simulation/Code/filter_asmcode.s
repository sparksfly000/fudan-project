FieldMulBate:
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
$func_end0:

FieldMulBate_:
	addiu32	$sp, $sp, -16
	st64	$gwr4, 8($sp)
	addm	$gwr2, $gwr4, $gwr4
	st64	$gwr2, 0($sp)
	addiu32	$sp, $sp, 16
	ret	$lr
	nop
$func_end1:

FieldNeg:
	addiu32	$sp, $sp, -8
	st64	$gwr4, 0($sp)
	addiu64	$gwr1, $gwr0, 0
	subm	$gwr2, $gwr1, $gwr4
	addiu32	$sp, $sp, 8
	ret	$lr
	nop
$func_end2:

FieldInverse:
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
$BB3_1:
	ld64	$gwr2, 24($sp)
	cmplong	$r1, $gwr2, $gwr1
	beq	$r1, $zero, $BB3_14
	nop
	jmp	$BB3_4
	nop
$BB3_3:
	ld64	$gwr2, 32($sp)
	ld64	$gwr3, 8($sp)
	add64	$gwr2, $gwr3, $gwr2
	sra64	$gwr2, $gwr2, 1
	st64	$gwr2, 8($sp)
$BB3_4:
	ld64	$gwr2, 24($sp)
	andi64	$gwr2, $gwr2, 1
	cmplong	$r1, $gwr2, $gwr1
	bne	$r1, $zero, $BB3_8
	nop
	ld64	$gwr2, 24($sp)
	sra64	$gwr2, $gwr2, 1
	st64	$gwr2, 24($sp)
	ld64	$gwr2, 8($sp)
	andi64	$gwr2, $gwr2, 1
	cmplong	$r1, $gwr2, $gwr1
	bne	$r1, $zero, $BB3_3
	nop
	ld64	$gwr2, 8($sp)
	sra64	$gwr2, $gwr2, 1
	st64	$gwr2, 8($sp)
	jmp	$BB3_4
	nop
$BB3_7:
	ld64	$gwr2, 32($sp)
	ld64	$gwr3, 0($sp)
	add64	$gwr2, $gwr3, $gwr2
	sra64	$gwr2, $gwr2, 1
	st64	$gwr2, 0($sp)
$BB3_8:
	ld64	$gwr2, 16($sp)
	andi64	$gwr2, $gwr2, 1
	cmplong	$r1, $gwr2, $gwr1
	bne	$r1, $zero, $BB3_11
	nop
	ld64	$gwr2, 16($sp)
	sra64	$gwr2, $gwr2, 1
	st64	$gwr2, 16($sp)
	ld64	$gwr2, 0($sp)
	andi64	$gwr2, $gwr2, 1
	cmplong	$r1, $gwr2, $gwr1
	bne	$r1, $zero, $BB3_7
	nop
	ld64	$gwr2, 0($sp)
	sra64	$gwr2, $gwr2, 1
	st64	$gwr2, 0($sp)
	jmp	$BB3_8
	nop
$BB3_11:
	ld64	$gwr2, 16($sp)
	ld64	$gwr3, 24($sp)
	cmplong	$r1, $gwr3, $gwr2
	beq	$r1, $r2, $BB3_13
	nop
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
$BB3_13:
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
$BB3_14:
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
$func_end3:

Field2SetOne:
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
$func_end4:

Field2SetZero:
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
$func_end5:

Field2Squaring:
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
$func_end6:

Field2Mul:
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
$func_end7:

Field2Add:
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
$func_end8:

Field2Sub:
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
$func_end9:

Field2Neg:
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
$func_end10:

Field2Conjugate:
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
$func_end11:

Field2MulYemeseilong:
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
$func_end12:

Field2MulConst:
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
$func_end13:

Field2Copy:
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
$func_end14:

Field2Inverse:
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
$func_end15:

Field6SetOne:
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
$func_end16:

Field6SetZero:
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
$func_end17:

Field6Add:
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
$func_end18:

Field6Sub:
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
$func_end19:

Field6Neg:
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
$func_end20:

Field6Mul:
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
$func_end21:

Field6Squaring:
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
$func_end22:

Field6MulGama:
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
$func_end23:

Field6Copy:
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
$func_end24:

Field6Inverse:
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
$func_end25:

Field12Add:
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
$func_end26:

Field12Sub:
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
$func_end27:

Field12Conjugate:
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
$func_end28:

Field12Mul:
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
$func_end29:

Field12Squaring:
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
$func_end30:

Field12Copy:
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
$func_end31:

Field12Inverse:
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
$func_end32:

Field12SetOne:
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
$func_end33:

Field12Exp:
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
$BB34_1:
	ld64	$gwr1, 320($sp)
	addiu64	$gwr2, $gwr0, 0
	cmplong	$r1, $gwr1, $gwr2
	beq	$r1, $zero, $BB34_5
	nop
	ld64	$gwr1, 320($sp)
	andi64	$gwr1, $gwr1, 1
	addiu64	$gwr2, $gwr0, 1
	cmplong	$r1, $gwr1, $gwr2
	bne	$r1, $zero, $BB34_4
	nop
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
$BB34_4:
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
$BB34_5:
	addiu32	$r2, $zero, 0
	ld32	$fp, 360($sp)           # 4-byte Folded Reload
	ld32	$lr, 364($sp)           # 4-byte Folded Reload
	addiu32	$sp, $sp, 368
	ret	$lr
	nop
$func_end34:

Point1Copy:
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
$func_end35:

Point1Neg:
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
$func_end36:

Point1Double:
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
$func_end37:

Point1Add:
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
$func_end38:

Point1Normalize:
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
$func_end39:

Point1Scalar:
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
$BB40_1:
	ld64	$gwr1, 72($sp)
	addiu64	$gwr2, $gwr0, 0
	cmplong	$r1, $gwr1, $gwr2
	beq	$r1, $zero, $BB40_7
	nop
	ld64	$gwr1, 72($sp)
	andi64	$gwr1, $gwr1, 1
	addiu64	$gwr2, $gwr0, 1
	cmplong	$r1, $gwr1, $gwr2
	bne	$r1, $zero, $BB40_6
	nop
	addu	$r2, $zero, $fp
	ld32	$fp, 84($sp)
	ld64	$gwr1, 16($fp)
	addiu64	$gwr2, $gwr0, 0
	cmplong	$r1, $gwr1, $gwr2
	bne	$r1, $zero, $BB40_5
	nop
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
$BB40_5:
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
$BB40_6:
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
$BB40_7:
	addiu32	$r2, $zero, 0
	ld32	$fp, 128($sp)           # 4-byte Folded Reload
	ld32	$lr, 132($sp)           # 4-byte Folded Reload
	addiu32	$sp, $sp, 136
	ret	$lr
	nop
$func_end40:

Point2Copy:
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
$func_end41:

Point2Neg:
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
$func_end42:

Point2Double:
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
$func_end43:

Point2Add:
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
$func_end44:

Point2Normalize:
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
$func_end45:

Point2Scalar:
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
$BB46_1:
	ld64	$gwr1, 120($sp)
	addiu64	$gwr2, $gwr0, 0
	cmplong	$r1, $gwr1, $gwr2
	beq	$r1, $zero, $BB46_8
	nop
	ld64	$gwr1, 120($sp)
	andi64	$gwr1, $gwr1, 1
	addiu64	$gwr2, $gwr0, 1
	cmplong	$r1, $gwr1, $gwr2
	bne	$r1, $zero, $BB46_7
	nop
	ld32	$r2, 20($sp)            # 4-byte Folded Reload
	ld32	$fp, 132($sp)
	ld64	$gwr1, 32($fp)
	addiu64	$gwr2, $gwr0, 0
	cmplong	$r1, $gwr1, $gwr2
	bne	$r1, $zero, $BB46_6
	nop
	ld32	$fp, 132($sp)
	ld64	$gwr1, 40($fp)
	addiu64	$gwr2, $gwr0, 0
	cmplong	$r1, $gwr1, $gwr2
	bne	$r1, $zero, $BB46_6
	nop
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
$BB46_6:
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
$BB46_7:
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
$BB46_8:
	addiu32	$r2, $zero, 0
	ld32	$fp, 176($sp)           # 4-byte Folded Reload
	ld32	$lr, 180($sp)           # 4-byte Folded Reload
	addiu32	$sp, $sp, 184
	ret	$lr
	nop
$func_end46:

LineDouble:
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
$func_end47:

LineAdd:
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
$func_end48:

FrobeniusMapOdd:
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
$func_end49:

FrobeniusMapEven:
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
$func_end50:

FinalExp:
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
$func_end51:

Point2MoveToField12:
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
$func_end52:

Point2BackFromField12:
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
$func_end53:

optPairing:
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
$BB54_1:
	ld32	$r1, 444($sp)
	addiu32	$r2, $zero, 0
	slt	$r1, $r1, $r2
	bne	$r1, $zero, $BB54_5
	nop
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
$BB54_4:
	ld64	$gwr1, 432($sp)
	sra64	$gwr1, $gwr1, 1
	st64	$gwr1, 432($sp)
	ld32	$r1, 444($sp)
	addiu32	$r1, $r1, -1
	st32	$r1, 444($sp)
	jmp	$BB54_1
	nop
$BB54_5:
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
$BB54_7:
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
$func_end54:

TestFieldInverse:
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
$func_end55:

TestField2Inverse:
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
$func_end56:

TestField6Inverse:
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
$func_end57:

TestField12Inverse:
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
$func_end58:

TestField12Mul:
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
$func_end59:

TestField12Exp:
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
$func_end60:

TestFinalExp:
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
$func_end61:

TestoptPairing:
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
$func_end62:

main:
	addiu32	$sp, $sp, -8
	addiu32	$r2, $zero, 0
	st32	$r2, 4($sp)
	addiu32	$sp, $sp, 8
	ret	$lr
	nop
$func_end63:


