  *-----------------------------------------------------------
* Title      : Leventhal Problems
* Written by : Manuel Carvalho
* Date       : 31/10/2021
* Description: L A Leventhal 6502 Programming in 68000
*-----------------------------------------------------------
    ORG    $1000
START:                  ; first instruction of program

* Put program code here
     move    #10,d0      ; move 10 into D0
     move    #50,d1      ; move 50 into D1
     sub d0,d1           ; subtract D0 from D1 and put the result in D1
     


    SIMHALT             ; halt simulator

* Put variables and constants here

    END    START        ; last line of source



*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
