;File: prob0616.pep
;Computer Systems, Fifth Edition
;Problem 6.16
;
         BR      main        
         ;global variable #2d
;
;******* void putNext(int age)
age:     .EQUATE 4           ;formal parameter #2d
nextYr:  .EQUATE 0           ;local variable #2d
putNext: SUBSP   2,i         ;push #nextYr
         LDWA    age,s       ;nextYr = age + 1
         ADDA    1,i         
         STWA    nextYr,s    
         STRO    msg1,d      ;printf("Age: %d\n", age)
         DECO    age,s       
         LDBA    '\n',i      
         STBA    charOut,d   
         STRO    msg2,d      ;printf("Age next year: %d\n", nextYr)
         DECO    nextYr,s    
         LDBA    '\n',i      
         STBA    charOut,d   
         ADDSP   2,i         ;pop #nextYr
         RET                 
;
;******* main()
myAge:   .EQUATE 0           ;local variable #2d
main:    SUBSP   2,i         ;push #myAge 
         DECI    myAge,s     ;scanf("%d", &myAge)
         LDWA    myAge,s     ;move myAge
         STWA    -2,s        
         SUBSP   2,i         ;push #age
         CALL    putNext     ;putNext(myAge)
         ADDSP   2,i         ;pop #age
         LDWA    64,i        ;move 64
         STWA    -2,s        
         SUBSP   2,i         ;push #age
         CALL    putNext     ;putNext(64)
         ADDSP   4,i         ;pop #age #myAge 
         STOP                
msg1:    .ASCII  "Age: \x00" 
msg2:    .ASCII  "Age next year: \x00"
         .END                  
