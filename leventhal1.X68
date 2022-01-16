  *-----------------------------------------------------------
* Title      : Leventhal Problems
* Written by : Manuel Carvalho
* Date       : 31/10/2021
* Description: L A Leventhal 6502 Programming in 68000
*-----------------------------------------------------------
    ORG    $1000
START:                  ; first instruction of program

* Put program code here

     move.l  #30,d0
     move.l  #60,d1


     bsr addNums
     
     SIMHALT             ; halt simulator
     
     move.l  #30,d0
     move.l  #60,d1

     bsr DIVIDE
     
      
      
     move.l #30,d0
     move.l #20,d1

     bsr MULTIPLY
     
     
    

     
     move.l  #80,d1          X = 80
     move.l  #80,d2          Y = 80

     bsr    DRAW
     
     move.l  #90,d1          X = 90
     move.l  #80,d2          Y = 80

     bsr    DRAW
     
     move.l  #100,d1         X = 100
     move.l  #80,d2          Y = 80

     bsr    DRAW
     
     move.l  #80,d1         X = 80
     move.l  #80,d2          Y = 80

     
     bsr    DRAW_H
     
     move.l  #80,d1         X = 80
     move.l  #100,d2          Y = 100

     
     bsr    DRAW_H


     
     
      SIMHALT                 Halt Simulator

     bsr    ASHR_R
     bsr    ASHL_L
     bsr    SUBROUTINE 
     bsr    LOOPING
     bsr    SHIFTING
     

     move    #10,d0      ; move 10 into D0
     move    #50,d1      ; move 50 into D1
     sub      d0,d1      ; subtract D0 from D1 and put the result in D1
     move     d1,d3      ; move D1 to D3
     
     add      d0,d1      ; add D0 into D1
     
     move     #20,d0     ; move 20 to D0
     rol      #2,d0      ; rotate left 2 times
     
     move     #20,d0     ; move 20 to D0
     ror      #2,d0      ; rotate right 2 times
     
     clr.l    d3         ; clear D3
     
     moveA.l #$FFFFFFFF,a0  ; move $FFFFFFFF to A0
     
     moveq.l #1,d0       ; move quick 1 into D0
     
     movem d0-d3/a0-a6,-(sp)    ; push D0 to D3 and A0 to A6
     
     clr.l d0   ; clear D0
     clr.l d1   ; clear D1
     clr.l d2   ; clear D2
     clr.l d3   ; clear D3
     
     movem (sp)+,d0-d3/a0-a6    ; pop D0 to D3 and A0 to A6

     
     addq #2,d3     ; inc d3 by 2
     subq #1,d0     ; dec d0 by 1
     
     move.l #65,d2      ; move 65 into D2
     neg    d2      ; negate d2
     neg    d2      ; negate d2 again restoring original number
     
     negx   d2      ; negate extended D2
     negx   d2      ; negate extended D2 again
     
     move.l #255,d4     ; move 255 into D4 
     ext.l  d4      ; extend sign in D4 
     
    
    SIMHALT             ; halt simulator
    
* Subroutine to display Carriage Return and Line Feed - Taken from Easy68k tutorial 1
newLine movem.l d0/a1,-(a7) push d0 & a1
    move    #14,d0      task number into D0
    lea     crlf,a1     address of string
    trap    #15         display return, linefeed
    movem.l (a7)+,d0/a1 restore d0 & a1
    rts                 return
    

* printNum displays the number stored in D8 
printNum
    lea NUMBER,a3
    move    d3,(a3)
    movem.l d0/a1,-(a7) push d0 & a1
    move    #14,d0      task number into D0
    lea     crlf,a1     address of string
    trap    #15         display return, linefeed
    movem.l (a7)+,d0/a1 restore d0 & a1
    rts  

SHIFTING:
    move.l  #255,d5   ; number to test
    move.l  #20,d3    ; times to ROR : Counter
LOOP_SH1:
    ror.l #1,d5     ; rotate right once register D5
    subq  #1,d3     ; decrement d3 by one
    bne LOOP_SH1    ; is counter 0. no repeat
    
    move.l  #255,d5   ; number to test
    move.l  #2,d3     ; times to ROR : Counter
LOOP_SH2:
    rol.l #1,d5     ; rotate left once register D5
    subq  #1,d3     ; decrement d3 by one
    bne LOOP_SH1    ; is counter 0. no repeat


    rts             ; return from subroutine
    
ASHR_R:
    move.l  #255,d5   ; move 255 to D5 : Test Number
    move.l  #32,d3    ; move 10 to D3 : Counter
LOOP_ASHR:
    asr.l   #1,d5   ;   arithematic shift right by 1 D5
    subq    #1,d3   ;   decrement counter (D3)
    bne     LOOP_ASHL   ; repeat if counter not 0 

    rts
    
ASHL_L:
    move.l  #255,d5   ; move 255 to D5 : Test Number
    move.l  #32,d3    ; move 10 to D3 : Counter

LOOP_ASHL:
    asl.l   #1,d5   ;   arithematic shift left by 1 D5
    subq    #1,d3   ;   decrement counter (D3)
    bne     LOOP_ASHL   ; repeat if counter not 0 
    rts     ; return
   

LOOPING:
    move.l #10,d5     ; move 10 to D5 : Test Number
    move.l #10,d3     ; move 10 to D3 : Counter
LOOP2:
    add.l   d5,d5   ; add D5 to D5
    subq    #1,d3   ; decrament counter
    bne LOOP2       ; Do again if counter not 0
    rts             ; Return
    
SUBROUTINE:
    lea COUNTER,a0  ; load counter address
    ; move.l COUNTER,a0
    
    move.w #10,(a0) ; move 10 to counter
LOOP1:
    move    #14,d0  ; move 14 to D0 - Print null delimitted string
    lea     text1,a1   ; load address of string to display into A1
    trap    #15     ; Print string
    bsr newLine     ; Print CR
    subq #1,(a0)    ; fast decrament COUNTER
    bne LOOP1       ; repeat if not zero
    rts             ; return
    
DRAW:
    movem d0-d3/a0-a6,-(sp)
    move.l  #AQUA,d1        set pen color
    move.b  #80,d0
    trap    #15

    movem (sp)+,d0-d3/a0-a6
   ; move.l  #80,d1          X = 80
   ; move.l  #80,d2          Y = 80
    move.l  #20,d6
    
draw_loop:
    
    bsr DRAW_PIXEL
    addq    #1,d2
    subq    #1,d6
    bne draw_loop
    
    move.l  #80,d1          X = 80
    move.l  #200,d2         Y = 200
    move.b  #86,d0
    trap    #15             move to X,Y
    
    move.b  #82,d0
    trap    #15             draw pixel
    
    rts
    
DRAW_H:
    movem d0-d3/a0-a6,-(sp)
    move.l  #AQUA,d1        set pen color
    move.b  #80,d0
    trap    #15

    movem (sp)+,d0-d3/a0-a6
   ; move.l  #80,d1          X = 80
   ; move.l  #80,d2          Y = 80
    move.l  #20,d6
    
draw_loopH:
    
    bsr DRAW_PIXEL
    addq    #1,d1
    subq    #1,d6
    bne draw_loopH
    
   ; move.l  #100,d1         X = 100
   ; move.l  #200,d2         Y = 200
    move.b  #86,d0
    trap    #15             move to X,Y
    
    move.b  #82,d0
    trap    #15             draw pixel


   
    rts
    
DRAW_PIXEL:
     movem.l d0-d1/a1,-(a7) push d0,d1 & a1
     move.b  #82,d0
     trap    #15             draw pixel
     movem.l (a7)+,d0-d1/a1 restore d0,d1 & a1

     rts

MULTIPLY:
    ;move.l  #30,d0
    ;move.l  #30,d1
    muls    d0,d1
    rts
    
DIVIDE:
    ;move.l  #30,d0
    ;move.l  #60,d1
    divs    d0,d1

    rts
    
addNums:
    add      d0,d1      ; add D0 into D1
    rts


    
* Put variables and constants here
;align
COUNTER:    ds.b    1   ; counter variable
NUMBER:     ds.b    1   ; number variable
text1  dc.b    'Hello World! ',0   null terminated string
crlf    dc.b    $d,$a,0     carriage return & line feed, null


BLACK   EQU    $00000000
MAROON  EQU    $00000080
GREEN   EQU    $00008000
OLIVE   EQU    $00008080
NAVY    EQU    $00800000
PURPLE  EQU    $00800080
TEAL    EQU    $00808000
GRAY    EQU    $00808080
RED     EQU    $000000FF
LIME    EQU    $0000FF00
YELLOW  EQU    $0000FFFF
BLUE    EQU    $00FF0000
FUCHSIA EQU    $00FF00FF
AQUA    EQU    $00FFFF00
LTGRAY  EQU    $00C0C0C0
WHITE   EQU    $00FFFFFF

    END    START        ; last line of source








































































*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
