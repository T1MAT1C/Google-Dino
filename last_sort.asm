asect 0x00
	setsp 0xfe
main:
	ldi r1, 5
	while
		dec r1
	stays nz
		ldi r0, 0xff
		ld r0, r0
		push r0
	wend
	ldi r1, 3
	while 
		dec r1
	stays nz
		ldi r0, 0xfe
		ld r0, r0
		push r0
	wend
	ldi r0, 0x05
	ld r0, r1
	ldi r2, 5
	if 
		cmp r1, r2
	is lo
		ldsp r3
		clr r2
		add r1, r2
		st r2, r3
		inc r1
		st r0, r1
	fi
	ldi r2, 1
	if 
		cmp r1, r2
	is eq
		ldi r3, 7
		ldsp r0
		while
			dec r3
		stays nz
			ld r0, r1
			ldi r2, 0xff
			st r2, r1
			inc r0
		wend
		br main
	fi
	ldi r3, 0x08
	clr r2
	st r3, r2
	ldi r3, 0x06
	clr r2
	st r3, r2
	ldi r2, 5
	if 
		cmp r1, r2
	is ls
		ldi r3, 0x05
		ld r3, r3
		while
			dec r3
		stays nz
			while 
				ldi r2, 0x06
				ld r2, r1
				cmp r1, r3
			stays lo
				ldi r0, 0x07
				st r0, r3
				clr r0
				add r1, r0
				ld r0, r0
				inc r0
				ld r0, r0
				ldi r2, 0x01
				add r1, r2
				ld r2, r2
				inc r2
				ld r2, r2
				if
					cmp r0, r2
				is hi
					clr r0
					add r1, r0
					ld r0, r0
					ldi r2, 0x01
					add r1, r2
					ld r2, r2
					move r2, r3
					ldi r2, 0x01
					add r1, r2
					st r2, r0
					ldi r0, 0x00
					add r1, r0
					st r0, r3
					ldi r2, 0x06
					ld r2, r1
					inc r1
					st r2, r1
					ldi r3, 0x07
					ld r3, r3
				else
					blo else_cond
					ldi r0, 0x00
					add r1, r0
					ld r0, r0
					ld r0, r0
					ldi r2, 0x01
					add r1, r2
					ld r2, r2
					ld r2, r2
					if
						cmp r0, r2
					is hi
						ldi r0, 0x00
						add r1, r0
						ld r0, r0
						ldi r2, 0x01
						add r1, r2
						ld r2, r2
						move r2, r3
						ldi r2, 0x01
						add r1, r2
						st r2, r0
						ldi r0, 0x00
						add r1, r0
						st r0, r3
						ldi r2, 0x06
						ld r2, r1
						inc r1
						st r2, r1
						ldi r3, 0x07
						ld r3, r3
					else
						else_cond:
							ldi r2, 0x06
							ld r2, r1
							inc r1
							st r2, r1
					fi
				fi
			wend
			ldi r2, 0x06
			clr r1
			st r2, r1
		wend	
		ldi r3, 0x05
		ld r3, r3
		inc r3
		ldi r0, 0x00
		ld r0, r0
		while
			dec r3
		stays nz
			ldi r1, 0x07
			ldi r2, 7
			st r1, r2
			while
				ldi r1, 0x07
				ld r1, r2
				dec r2
			stays nz
				st r1, r2
				ld r0, r1
				ldi r2, 0xff
				st r2, r1
				inc r0
			wend
			ldi r1, 0x08
			ld r1, r2
			ldi r0, 0x05
			ld r0, r0
			if
				cmp r2, r0
			is lo
				inc r2
				st r1, r2	
				ldi r0, 0x00
				add r2, r0
				ld r0, r0
			fi
		wend
		ldi r3, 0x05
		ld r3, r3
		ldi r2, 5
		if 
			cmp r2, r3
		is eq
			setsp 0xe0
			ldi r0, 0xe0
			ldi r1, 0x00
			ld r1, r1
			sub r1, r0
			while
				dec r0
			stays nz
				pop r3
			wend
			addsp 7
		fi
		br main	
	fi
	halt
end	