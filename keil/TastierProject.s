	AREA	TastierProject, CODE, READONLY

    IMPORT  TastierDiv
	IMPORT	TastierMod
	IMPORT	TastierReadInt
	IMPORT	TastierPrintInt
	IMPORT	TastierPrintIntLf
	IMPORT	TastierPrintTrue
	IMPORT	TastierPrintTrueLf
	IMPORT	TastierPrintFalse
    IMPORT	TastierPrintFalseLf
    IMPORT  TastierPrintString
    
; Entry point called from C runtime __main
	EXPORT	main

; Preserve 8-byte stack alignment for external routines
	PRESERVE8

; Register names
BP  RN 10	; pointer to stack base
TOP RN 11	; pointer to top of stack

main
; Initialization
	LDR		R4, =globals
	LDR 	BP, =stack		; address of stack base
	LDR 	TOP, =stack+16	; address of top of stack frame
	B		Main
; Procedure testAssign5
testAssign5Body
    MOVS    R5, #1          ; true
    LDR     R6, =0
    ADD     R0, BP, #16
    STR     R5, [R0, R6, LSL #2] ; value of boolArr[]
    MOVS    R5, #0          ; false
    LDR     R6, =1
    ADD     R0, BP, #16
    STR     R5, [R0, R6, LSL #2] ; value of boolArr[]
    MOVS    R5, #0          ; false
    LDR     R6, =2
    ADD     R0, BP, #16
    STR     R5, [R0, R6, LSL #2] ; value of boolArr[]
    LDR     R5, =9
    LDR     R6, =0
    ADD     R0, BP, #16
    LDR     R1, =4
    ADD     R0, R0, R1, LSL #2 ; address of intArr[]
    STR     R5, [R0, R6, LSL #2] ; value of intArr[]
    LDR     R5, =8
    LDR     R6, =1
    ADD     R0, BP, #16
    LDR     R1, =4
    ADD     R0, R0, R1, LSL #2 ; address of intArr[]
    STR     R5, [R0, R6, LSL #2] ; value of intArr[]
    LDR     R5, =7
    LDR     R6, =2
    ADD     R0, BP, #16
    LDR     R1, =4
    ADD     R0, R0, R1, LSL #2 ; address of intArr[]
    STR     R5, [R0, R6, LSL #2] ; value of intArr[]
    LDR     R5, =6
    LDR     R6, =3
    ADD     R0, BP, #16
    LDR     R1, =4
    ADD     R0, R0, R1, LSL #2 ; address of intArr[]
    STR     R5, [R0, R6, LSL #2] ; value of intArr[]
    LDR     R5, =5
    LDR     R6, =4
    ADD     R0, BP, #16
    LDR     R1, =4
    ADD     R0, R0, R1, LSL #2 ; address of intArr[]
    STR     R5, [R0, R6, LSL #2] ; value of intArr[]
    LDR     R5, =1
    LDR     R6, =10
    ADD     R0, BP, #16
    LDR     R1, =4
    ADD     R0, R0, R1, LSL #2 ; address of intArr[]
    STR     R6, [R0, R5, LSL #2] ; value of intArr[]
    LDR     R5, =1
    LDR     R6, =0
    LDR     R0, =1
    ADD     R0, R4, R0, LSL #2  ; address of globalArr[]
    STR     R5, [R0, R6, LSL #2] ; value of globalArr[]
    LDR     R5, =2
    LDR     R6, =1
    LDR     R0, =1
    ADD     R0, R4, R0, LSL #2  ; address of globalArr[]
    STR     R5, [R0, R6, LSL #2] ; value of globalArr[]
    LDR     R6, =3
    ADD     R0, BP, #16
    LDR     R1, =4
    ADD     R0, R0, R1, LSL #2 ; address of intArr[]
    LDR     R5, [R0, R6, LSL #2] ; value of intArr[]
    LDR     R0, =4
    STR     R5, [R4, R0, LSL #2] ; a
    LDR     R0, =4
    LDR     R5, [R4, R0, LSL #2] ; a
    LDR     R6, =4
    ADD     R0, BP, #16
    LDR     R1, =4
    ADD     R0, R0, R1, LSL #2 ; address of intArr[]
    STR     R6, [R0, R5, LSL #2] ; value of intArr[]
    LDR     R0, =4
    LDR     R6, [R4, R0, LSL #2] ; a
    LDR     R7, =2
    SUB     R6, R6, R7
    ADD     R0, BP, #16
    LDR     R1, =4
    ADD     R0, R0, R1, LSL #2 ; address of intArr[]
    LDR     R5, [R0, R6, LSL #2] ; value of intArr[]
    LDR     R0, =4
    STR     R5, [R4, R0, LSL #2] ; a
    MOV     TOP, BP         ; reset top of stack
    LDR     BP, [TOP,#12]   ; and stack base pointers
    LDR     PC, [TOP]       ; return from testAssign5
testAssign5
    LDR     R0, =1          ; current lexic level
    LDR     R1, =10          ; number of local variables
    BL      enter           ; build new stack frame
    B       testAssign5Body
;i: Global variable, integer, 
;globalArr: Global variable, integer, Array
;a: Global variable, integer, 
;testAssign5: procedure
; Procedure testCond
testCondBody
    LDR     R5, =0
    STR     R5, [BP,#16]    ; x
    LDR     R5, [BP,#16]    ; x
    LDR     R6, =0
    CMP     R5, R6
    MOVLE   R5, #1
    MOVGT   R5, #0
    MOVS    R5, R5          ; reset Z flag in CPSR
    BEQ     L1              ; jump on condition false
    LDR     R5, =0
    LDR     R5, [BP,#16]    ; x
    LDR     R6, =1
    ADD     R5, R5, R6
    STR     R5, [BP,#16]    ; x
    B       L2
L1
    STR     R5, [BP,#16]    ; x
L2
    LDR     R5, [BP,#16]    ; x
    MOV     R0, R5
    BL      TastierPrintIntLf
    MOV     TOP, BP         ; reset top of stack
    LDR     BP, [TOP,#12]   ; and stack base pointers
    LDR     PC, [TOP]       ; return from testCond
testCond
    LDR     R0, =1          ; current lexic level
    LDR     R1, =2          ; number of local variables
    BL      enter           ; build new stack frame
    B       testCondBody
;i: Global variable, integer, 
;globalArr: Global variable, integer, Array
;a: Global variable, integer, 
;testAssign5: procedure
;testCond: procedure
; Procedure testFor
testForBody
    LDR     R5, =0
    STR     R5, [BP,#16]    ; x
L3
    LDR     R5, [BP,#16]    ; x
    LDR     R6, =4
    CMP     R5, R6
    MOVLT   R5, #1
    MOVGE   R5, #0
    MOVS    R5, R5          ; reset Z flag in CPSR
    BEQ     L4              ; jump on condition false
    LDR     R5, [BP,#16]    ; x
    LDR     R6, =1
    ADD     R5, R5, R6
   ; LDR     R5, [BP,#16]    ; x
    MOV     R0, R5
    BL      TastierPrintIntLf
    STR     R5, [BP,#16]    ; x
    B       L3
L4
    MOV     TOP, BP         ; reset top of stack
    LDR     BP, [TOP,#12]   ; and stack base pointers
    LDR     PC, [TOP]       ; return from testFor
testFor
    LDR     R0, =1          ; current lexic level
    LDR     R1, =1          ; number of local variables
    BL      enter           ; build new stack frame
    B       testForBody
;i: Global variable, integer, 
;globalArr: Global variable, integer, Array
;a: Global variable, integer, 
;testAssign5: procedure
;testCond: procedure
;testFor: procedure
MainBody
    ADD     R0, PC, #4      ; store return address
    STR     R0, [TOP]       ; in new stack frame
    B       testFor
StopTest
    B       StopTest
Main
    LDR     R0, =1          ; current lexic level
    LDR     R1, =0          ; number of local variables
    BL      enter           ; build new stack frame
    B       MainBody
;i: Global variable, integer, 
;globalArr: Global variable, integer, Array
;a: Global variable, integer, 
;testAssign5: procedure
;testCond: procedure
;testFor: procedure
;main: procedure

; Subroutine enter
; Construct stack frame for procedure
; Input: R0 - lexic level (LL)
;		 R1 - number of local variables
; Output: new stack frame

enter
	STR		R0, [TOP,#4]			; set lexic level
	STR		BP, [TOP,#12]			; and dynamic link
	; if called procedure is at the same lexic level as
	; calling procedure then its static link is a copy of
	; the calling procedure's static link, otherwise called
 	; procedure's static link is a copy of the static link 
	; found LL delta levels down the static link chain
    LDR		R2, [BP,#4]				; check if called LL (R0) and
	SUBS	R0, R2					; calling LL (R2) are the same
	BGT		enter1
	LDR		R0, [BP,#8]				; store calling procedure's static
	STR		R0, [TOP,#8]			; link in called procedure's frame
	B		enter2
enter1
	MOV		R3, BP					; load current base pointer
	SUBS	R0, R0, #1				; and step down static link chain
    BEQ     enter2-4                ; until LL delta has been reduced
	LDR		R3, [R3,#8]				; to zero
	B		enter1+4				;
	STR		R3, [TOP,#8]			; store computed static link
enter2
	MOV		BP, TOP					; reset base and top registers to
	ADD		TOP, TOP, #16			; point to new stack frame adding
	ADD		TOP, TOP, R1, LSL #2	; four bytes per local variable
	BX		LR						; return
	
	AREA	Memory, DATA, READWRITE
globals     SPACE 4096
stack      	SPACE 16384

	END