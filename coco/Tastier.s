; Procedure testArrays
testArraysBody
    MOVS    R5, #1          ; true
    LDR     R6, =0
    ADD     R2, BP, #16
    LDR     R1, =1
    ADD     R2, R2, R1, LSL #2
    STR     R5, [R2, R6, LSL #2] ; value of boolArr[]
    MOVS    R5, #0          ; false
    LDR     R6, =1
    ADD     R2, BP, #16
    LDR     R1, =1
    ADD     R2, R2, R1, LSL #2
    STR     R5, [R2, R6, LSL #2] ; value of boolArr[]
    MOVS    R5, #0          ; false
    LDR     R6, =2
    ADD     R2, BP, #16
    LDR     R1, =1
    ADD     R2, R2, R1, LSL #2
    STR     R5, [R2, R6, LSL #2] ; value of boolArr[]
    LDR     R5, =9
    LDR     R6, =0
    ADD     R2, BP, #16
    LDR     R1, =5
    ADD     R2, R2, R1, LSL #2
    STR     R5, [R2, R6, LSL #2] ; value of intArr[]
    LDR     R5, =8
    LDR     R6, =1
    ADD     R2, BP, #16
    LDR     R1, =5
    ADD     R2, R2, R1, LSL #2
    STR     R5, [R2, R6, LSL #2] ; value of intArr[]
    LDR     R5, =7
    LDR     R6, =2
    ADD     R2, BP, #16
    LDR     R1, =5
    ADD     R2, R2, R1, LSL #2
    STR     R5, [R2, R6, LSL #2] ; value of intArr[]
    LDR     R5, =6
    LDR     R6, =3
    ADD     R2, BP, #16
    LDR     R1, =5
    ADD     R2, R2, R1, LSL #2
    STR     R5, [R2, R6, LSL #2] ; value of intArr[]
    LDR     R5, =5
    LDR     R6, =4
    ADD     R2, BP, #16
    LDR     R1, =5
    ADD     R2, R2, R1, LSL #2
    STR     R5, [R2, R6, LSL #2] ; value of intArr[]
    LDR     R5, =1
    LDR     R6, =10
    ADD     R2, BP, #16
    LDR     R1, =5
    ADD     R2, R2, R1, LSL #2
    STR     R6, [R2, R5, LSL #2] ; value of intArr[]
    LDR     R5, =1
    LDR     R6, =0
    LDR     R2, =1
    ADD     R2, R4, R2, LSL #2
    STR     R5, [R2, R6, LSL #2] ; value of globalArr[]
    LDR     R5, =2
    LDR     R6, =1
    LDR     R2, =1
    ADD     R2, R4, R2, LSL #2
    STR     R5, [R2, R6, LSL #2] ; value of globalArr[]
    LDR     R6, =1
    LDR     R2, =1
    ADD     R2, R4, R2, LSL #2
    LDR     R5, [R2, R6, LSL #2] ; value of globalArr[]
    MOV     R0, R5
    BL      TastierPrintIntLf
    LDR     R6, =3
    ADD     R2, BP, #16
    LDR     R1, =5
    ADD     R2, R2, R1, LSL #2
    LDR     R5, [R2, R6, LSL #2] ; value of intArr[]
    ADD     R2, BP, #16
    LDR     R1, =0
    ADD     R2, R2, R1, LSL #2
    STR     R5, [R2]        ; a
    ADD     R2, BP, #16
    LDR     R1, =0
    ADD     R2, R2, R1, LSL #2
    LDR     R5, [R2]        ; a
    MOV     R0, R5
    BL      TastierPrintIntLf
    ADD     R2, BP, #16
    LDR     R1, =0
    ADD     R2, R2, R1, LSL #2
    LDR     R5, [R2]        ; a
    LDR     R6, =4
    ADD     R2, BP, #16
    LDR     R1, =5
    ADD     R2, R2, R1, LSL #2
    STR     R6, [R2, R5, LSL #2] ; value of intArr[]
    ADD     R2, BP, #16
    LDR     R1, =0
    ADD     R2, R2, R1, LSL #2
    LDR     R6, [R2]        ; a
    ADD     R2, BP, #16
    LDR     R1, =5
    ADD     R2, R2, R1, LSL #2
    LDR     R5, [R2, R6, LSL #2] ; value of intArr[]
    MOV     R0, R5
    BL      TastierPrintIntLf
    ADD     R2, BP, #16
    LDR     R1, =0
    ADD     R2, R2, R1, LSL #2
    LDR     R6, [R2]        ; a
    LDR     R7, =2
    SUB     R6, R6, R7
    ADD     R2, BP, #16
    LDR     R1, =5
    ADD     R2, R2, R1, LSL #2
    LDR     R5, [R2, R6, LSL #2] ; value of intArr[]
    ADD     R2, BP, #16
    LDR     R1, =0
    ADD     R2, R2, R1, LSL #2
    STR     R5, [R2]        ; a
    ADD     R2, BP, #16
    LDR     R1, =0
    ADD     R2, R2, R1, LSL #2
    LDR     R5, [R2]        ; a
    MOV     R0, R5
    BL      TastierPrintIntLf
    MOV     TOP, BP         ; reset top of stack
    LDR     BP, [TOP,#12]   ; and stack base pointers
    LDR     PC, [TOP]       ; return from testArrays
testArrays
    LDR     R0, =1          ; current lexic level
    LDR     R1, =11          ; number of local variables
    BL      enter           ; build new stack frame
    B       testArraysBody
;i: Global variable, integer, 
;globalArr: Global variable, integer, Array
;gParam: Global variable, integer, 
;testArrays: procedure
; Procedure testCond
testCondBody
    LDR     R6, =1
    RSB     R6, R6, #0
    ADD     R2, BP, #16
    LDR     R1, =0
    ADD     R2, R2, R1, LSL #2
    STR     R6, [R2]        ; x
    ADD     R2, BP, #16
    LDR     R1, =0
    ADD     R2, R2, R1, LSL #2
    LDR     R5, [R2]        ; x
    LDR     R6, =0
    CMP     R5, R6
    MOVLT   R5, #1
    MOVGE   R5, #0
    MOVS    R5, R5          ; reset Z flag in CPSR
    BEQ     L1              ; jump on condition false
    MOVS    R5, #1          ; true
    B       L2
L1
    MOVS    R5, #0          ; false
L2
    ADD     R2, BP, #16
    LDR     R1, =1
    ADD     R2, R2, R1, LSL #2
    STR     R5, [R2]        ; lessZero
    ADD     R2, BP, #16
    LDR     R1, =1
    ADD     R2, R2, R1, LSL #2
    LDR     R5, [R2]        ; lessZero
    MOVS    R5, R5          ; reset Z flag in CPSR
    BLNE    TastierPrintTrueLf
    BLEQ    TastierPrintFalseLf
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
;gParam: Global variable, integer, 
;testArrays: procedure
;testCond: procedure
; Procedure testFor
testForBody
    ADD     R0, PC, #4      ; string address
    BL      TastierPrintString
    B       L3
    DCB     "for1 start 0-3\n", 0
    ALIGN
L3
    LDR     R5, =0
    ADD     R2, BP, #16
    LDR     R1, =0
    ADD     R2, R2, R1, LSL #2
    STR     R5, [R2]        ; x
    B       L6
L4
    ADD     R2, BP, #16
    LDR     R1, =0
    ADD     R2, R2, R1, LSL #2
    LDR     R5, [R2]        ; x
    LDR     R6, =1
    ADD     R5, R5, R6
    ADD     R2, BP, #16
    LDR     R1, =0
    ADD     R2, R2, R1, LSL #2
    STR     R5, [R2]        ; x
L6
    ADD     R2, BP, #16
    LDR     R1, =0
    ADD     R2, R2, R1, LSL #2
    LDR     R7, [R2]        ; x
    LDR     R8, =4
    CMP     R7, R8
    MOVLT   R7, #1
    MOVGE   R7, #0
    MOVS    R7, R7          ; reset Z flag in CPSR
    BEQ     L5              ; jump on condition false
    ADD     R2, BP, #16
    LDR     R1, =0
    ADD     R2, R2, R1, LSL #2
    LDR     R5, [R2]        ; x
    MOV     R0, R5
    BL      TastierPrintIntLf
;x: Local variable, integer, 
;x2: Local variable, integer, 
    B       L4
L5
    ADD     R0, PC, #4      ; string address
    BL      TastierPrintString
    B       L7
    DCB     "for1 end\n", 0
    ALIGN
L7
    ADD     R0, PC, #4      ; string address
    BL      TastierPrintString
    B       L8
    DCB     "for2 start 5-0\n", 0
    ALIGN
L8
    LDR     R5, =5
    ADD     R2, BP, #16
    LDR     R1, =1
    ADD     R2, R2, R1, LSL #2
    STR     R5, [R2]        ; x2
    B       L11
L9
    ADD     R2, BP, #16
    LDR     R1, =1
    ADD     R2, R2, R1, LSL #2
    LDR     R5, [R2]        ; x2
    LDR     R6, =1
    SUB     R5, R5, R6
    ADD     R2, BP, #16
    LDR     R1, =1
    ADD     R2, R2, R1, LSL #2
    STR     R5, [R2]        ; x2
L11
    ADD     R2, BP, #16
    LDR     R1, =1
    ADD     R2, R2, R1, LSL #2
    LDR     R7, [R2]        ; x2
    LDR     R8, =0
    CMP     R7, R8
    MOVGE   R7, #1
    MOVLT   R7, #0
    MOVS    R7, R7          ; reset Z flag in CPSR
    BEQ     L10              ; jump on condition false
    ADD     R2, BP, #16
    LDR     R1, =1
    ADD     R2, R2, R1, LSL #2
    LDR     R5, [R2]        ; x2
    MOV     R0, R5
    BL      TastierPrintIntLf
;x: Local variable, integer, 
;x2: Local variable, integer, 
    B       L9
L10
    ADD     R0, PC, #4      ; string address
    BL      TastierPrintString
    B       L12
    DCB     "for2 end\n", 0
    ALIGN
L12
    MOV     TOP, BP         ; reset top of stack
    LDR     BP, [TOP,#12]   ; and stack base pointers
    LDR     PC, [TOP]       ; return from testFor
testFor
    LDR     R0, =1          ; current lexic level
    LDR     R1, =2          ; number of local variables
    BL      enter           ; build new stack frame
    B       testForBody
;i: Global variable, integer, 
;globalArr: Global variable, integer, Array
;gParam: Global variable, integer, 
;testArrays: procedure
;testCond: procedure
;testFor: procedure
; Procedure testParam
testParamBody
    ADD     R2, BP, #16
    LDR     R1, =0
    ADD     R2, R2, R1, LSL #2
    STR     R5, [R2]        ; a
    ADD     R2, BP, #16
    LDR     R1, =1
    ADD     R2, R2, R1, LSL #2
    STR     R6, [R2]        ; b
    ADD     R2, BP, #16
    LDR     R1, =2
    ADD     R2, R2, R1, LSL #2
    STR     R7, [R2]        ; c
    ADD     R0, PC, #4      ; string address
    BL      TastierPrintString
    B       L13
    DCB     "Value of Params a and b\n", 0
    ALIGN
L13
    ADD     R2, BP, #16
    LDR     R1, =0
    ADD     R2, R2, R1, LSL #2
    LDR     R6, [R2]        ; a
    MOV     R2, R6
    LDR     R5, [R2]        ; a
    MOV     R0, R5
    BL      TastierPrintIntLf
    ADD     R2, BP, #16
    LDR     R1, =1
    ADD     R2, R2, R1, LSL #2
    LDR     R6, [R2]        ; b
    MOV     R2, R6
    LDR     R5, [R2]        ; b
    MOV     R0, R5
    BL      TastierPrintIntLf
    LDR     R5, =0
    ADD     R2, BP, #16
    LDR     R1, =1
    ADD     R2, R2, R1, LSL #2
    LDR     R7, [R2]        ; b
    MOV     R2, R7
    LDR     R6, [R2]        ; b
    LDR     R2, =1
    ADD     R2, R4, R2, LSL #2
    STR     R6, [R2, R5, LSL #2] ; value of globalArr[]
    ADD     R0, PC, #4      ; string address
    BL      TastierPrintString
    B       L14
    DCB     "Array Index assigned with value of param b\n", 0
    ALIGN
L14
    LDR     R6, =0
    LDR     R2, =1
    ADD     R2, R4, R2, LSL #2
    LDR     R5, [R2, R6, LSL #2] ; value of globalArr[]
    MOV     R0, R5
    BL      TastierPrintIntLf
    LDR     R5, =4
    ADD     R2, BP, #16
    LDR     R1, =0
    ADD     R2, R2, R1, LSL #2
    LDR     R6, [R2]        ; a
    MOV     R2, R6
    STR     R5, [R2]        ; a
    MOVS    R7, #0          ; false
    ADD     R2, BP, #16
    LDR     R1, =2
    ADD     R2, R2, R1, LSL #2
    LDR     R5, [R2]        ; c
    MOV     R2, R5
    STR     R7, [R2]        ; c
    MOV     TOP, BP         ; reset top of stack
    LDR     BP, [TOP,#12]   ; and stack base pointers
    LDR     PC, [TOP]       ; return from testParam
testParam
    LDR     R0, =1          ; current lexic level
    LDR     R1, =4          ; number of local variables
    BL      enter           ; build new stack frame
    B       testParamBody
;i: Global variable, integer, 
;globalArr: Global variable, integer, Array
;gParam: Global variable, integer, 
;testArrays: procedure
;testCond: procedure
;testFor: procedure
;testParam: procedure
MainBody
    LDR     R6, =100
    ADD     R2, BP, #16
    LDR     R1, =2
    ADD     R2, R2, R1, LSL #2
    STR     R6, [R2]        ; const100
    LDR     R5, =22
    ADD     R2, BP, #16
    LDR     R1, =0
    ADD     R2, R2, R1, LSL #2
    STR     R5, [R2]        ; d
    MOVS    R5, #1          ; true
    ADD     R2, BP, #16
    LDR     R1, =1
    ADD     R2, R2, R1, LSL #2
    STR     R5, [R2]        ; e
    LDR     R5, =1
    LDR R2, =4
    ADD R2, R4, R2, LSL #2
    STR R5, [R2] ; gParam
    ADD     R0, PC, #4      ; string address
    BL      TastierPrintString
    B       L15
    DCB     "Values of d and e before call\n", 0
    ALIGN
L15
    ADD     R2, BP, #16
    LDR     R1, =0
    ADD     R2, R2, R1, LSL #2
    LDR     R5, [R2]        ; d
    MOV     R0, R5
    BL      TastierPrintIntLf
    ADD     R2, BP, #16
    LDR     R1, =1
    ADD     R2, R2, R1, LSL #2
    LDR     R5, [R2]        ; e
    MOVS    R5, R5          ; reset Z flag in CPSR
    BLNE    TastierPrintTrueLf
    BLEQ    TastierPrintFalseLf
    ADD     R0, PC, #4      ; string address
    BL      TastierPrintString
    B       L16
    DCB     "Parameters Test:\n", 0
    ALIGN
L16
    ADD     R2, BP, #16
    LDR     R1, =0
    ADD     R2, R2, R1, LSL #2
    MOV     R5, R2
    LDR R2, =4
    ADD R2, R4, R2, LSL #2
    MOV     R6, R2
    ADD     R2, BP, #16
    LDR     R1, =1
    ADD     R2, R2, R1, LSL #2
    MOV     R7, R2
    ADD     R0, PC, #4      ; store return address
    STR     R0, [TOP]       ; in new stack frame
    B       testParam
    ADD     R0, PC, #4      ; string address
    BL      TastierPrintString
    B       L17
    DCB     "Values of d and e after call\n", 0
    ALIGN
L17
    ADD     R2, BP, #16
    LDR     R1, =0
    ADD     R2, R2, R1, LSL #2
    LDR     R8, [R2]        ; d
    MOV     R0, R8
    BL      TastierPrintIntLf
    ADD     R2, BP, #16
    LDR     R1, =1
    ADD     R2, R2, R1, LSL #2
    LDR     R5, [R2]        ; e
    MOVS    R5, R5          ; reset Z flag in CPSR
    BLNE    TastierPrintTrueLf
    BLEQ    TastierPrintFalseLf
    ADD     R0, PC, #4      ; string address
    BL      TastierPrintString
    B       L18
    DCB     "Conditional Statement Test:\n", 0
    ALIGN
L18
    ADD     R0, PC, #4      ; store return address
    STR     R0, [TOP]       ; in new stack frame
    B       testCond
    ADD     R0, PC, #4      ; string address
    BL      TastierPrintString
    B       L19
    DCB     "Arrays Test:\n", 0
    ALIGN
L19
    ADD     R0, PC, #4      ; store return address
    STR     R0, [TOP]       ; in new stack frame
    B       testArrays
    ADD     R0, PC, #4      ; string address
    BL      TastierPrintString
    B       L20
    DCB     "For loop Test:\n", 0
    ALIGN
L20
    ADD     R0, PC, #4      ; store return address
    STR     R0, [TOP]       ; in new stack frame
    B       testFor
StopTest
    B       StopTest
Main
    LDR     R0, =1          ; current lexic level
    LDR     R1, =3          ; number of local variables
    BL      enter           ; build new stack frame
    B       MainBody
;i: Global variable, integer, 
;globalArr: Global variable, integer, Array
;gParam: Global variable, integer, 
;testArrays: procedure
;testCond: procedure
;testFor: procedure
;testParam: procedure
;main: procedure
