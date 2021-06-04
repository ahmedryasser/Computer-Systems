
;
         BR      main        
;
;******* main()
guess:   .EQUATE 0           ;local variable #2d
main:    SUBSP   2,i         ;push #guess
         STRO    msgIn,d     ;printf("Pick a number 0..3: ")
         DECI    guess,s     ;scanf("%d", &guess)
         LDWX    guess,s     ;switch (guess)
         CPWX    0,i
         BRNE    cont
         LDWX    1,i
cont:    SUBX    1,i
         ASLX                ;two bytes per address
         BR      guessJT,x   
guessJT: .ADDRSS case0              
         .ADDRSS case2       
         .ADDRSS case3       
case0:   STRO    msg1,d      ;printf("Too low\n") 
         BR      endCase     ;break
case2:   STRO    msg2,d      ;printf("Right on\n")
         BR      endCase     ;break
case3:   STRO    msg3,d      ;printf("Too high\n")
endCase: ADDSP   2,i         ;pop #guess
         STOP                
msgIn:   .ASCII  "Pick a number 0..3: \x00"
msg1:    .ASCII  "Too low\n\x00"
msg2:    .ASCII  "Right on\n\x00"
msg3:    .ASCII  "Too high\n\x00"
         .END                  
