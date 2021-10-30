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
    move    #50,d1      ; move 50 into D1
    
    cmp d0,d1           ; compare D0 to D1
    beq isEqual         ; branch if the two registers are equal
    
    cmp d0,d1           ; compare D0 to D1 again
    bcs isGreater       ; branch if D0 greater else continue
    
    move    d1,d3       ; D1 is greater, move it to D3
    bra     endP        ; branch to end
    
  isGreater:
    move    d0,d3       ; D0 is greater, move it to D3
    bra endP            ; branch to end
    
  isEqual:
    move    #$99,d4     ; move 99 to D4 to flag D0 and D1 are equal

endP:
    SIMHALT             ; halt simulator

* Put variables and constants here

    END    START        ; last line of source




*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
