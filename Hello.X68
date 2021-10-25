*-----------------------------------------------------------
* Title      : Hello World
* Written by : Manuel Carvalho
* Date       : 24/10/2021
* Description:
*-----------------------------------------------------------
    ORG    $1000
START:                  ; first instruction of program

* Put program code here

* Display hello message
    move    #14,d0      ;task number 14 (display null string)
    lea     hello,a1    ;address of string
    trap    #15    
    
* Display CR LF
    move    #14,d0      ;task number 14 (display null string)
    lea     crlf,a1    ;address of string
    trap    #15    


    SIMHALT             ; halt simulator

* Put variables and constants here
crlf    dc.b    $d,$a,0     carriage return & line feed, null
hello   dc.b    'Hello World',$d,$a,0   null terminated string

    END    START        ; last line of source

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
