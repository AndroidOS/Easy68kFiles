*-----------------------------------------------------------
* Title      : Highest
* Written by : Manuel Carvalho
* Date       : 26/10/2021
* Description: Find Highest Number
*-----------------------------------------------------------
    ORG    $1000
START:                  ; first instruction of program

* Put program code here
    move    #50,d0      ; move 50 into D0
    move    #50,d1      ; move 75 into D1
    
    cmp d0,d1
    beq isEqual
    
    cmp d0,d1
    bcs isGreater
    
    move    d1,d3
    bra     endP
    
  isGreater:
    move    d0,d3
    bra endP
    
  isEqual:
    move    #$99,d4

endP:
    SIMHALT             ; halt simulator

* Put variables and constants here

    END    START        ; last line of source



*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
