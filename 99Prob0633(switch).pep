;File: prob0633.pep
;Computer Systems, Fifth Edition
;Problem 6.33
;
         BR      main        
;******* main ()
guess:   .EQUATE 0           ;local variable #2d
main:    SUBSP   2,i         ;push #guess
         STRO    msgIn,d     ;printf("Pick a number 0..3: ")
         DECI    guess,s     ;scanf("%d", &guess)
         LDWX    guess,s     ;switch (Guess)
         ASLX                ;two bytes per address
         BR      guessJT,x   
guessJT: .ADDRSS case01      
         .ADDRSS case01      
         .ADDRSS case2       
         .ADDRSS case3       
case01:  STRO    msg01,d     ;printf("Too low")
         BR      endCase     ;break
case2:   STRO    msg2,d      ;printf("Right on")
         BR      endCase     ;break
case3:   STRO    msg3,d      ;printf("Too high")
endCase: LDBA    '\n',i      ;count << endl
         STBA    charOut,d   
         ADDSP   2,i         ;pop #guess
         STOP                
msgIn:   .ASCII  "Pick a number 0..3: \x00"
msg01:   .ASCII  "Too low\x00"
msg2:    .ASCII  "Right on\x00"
msg3:    .ASCII  "Too high\x00"
         .END                  