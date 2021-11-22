  *-----------------------------------------------------------
* Title      : Leventhal Problems
* Written by : Manuel Carvalho
* Date       : 31/10/2021
* Description: L A Leventhal 6502 Programming in 68000
*-----------------------------------------------------------
    ORG    $1000
START:                  ; first instruction of program

* Put program code here

     bsr    SUBROUTINE 

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
    
SUBROUTINE:
    lea COUNTER,a0
    ; move.l COUNTER,a0
    
    move.w #10,(a0)
LOOP1:
    lea     text1,a1   load address of string to display into A1
    trap    #15     
    subq #1,(a0) 
    bne LOOP1   
    rts


    
* Put variables and constants here
align
COUNTER:
    ds.b    1
text1  dc.b    'D1 contains: ',0   null terminated string


    END    START        ; last line of source























*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
