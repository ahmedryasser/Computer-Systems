;File: 08Prob0529.pep
;Computer Systems, Fifth edition
;Prob0529
;
         BR      main        
num1:   .BLOCK  2           ;global variable #2d
num2:   .BLOCK  2           ;global variable #2d
;
main:    DECI    num1,d     ;scanf("%d %d", &exam1, &exam2)
         LDWA    num1,d     ;negate     
         NEGA                
         STWA    num2,d     
         STRO    n1,d       ;printf("num1 = %d\n", score)
         DECO    num1,d     
         LDBA    '\n',i      
         STBA    charOut,d  
         STRO    n2,d       ;printf("num2 = %d\n", score)
         DECO    num2,d     
         LDBA    '\n',i      
         STBA    charOut,d  
         STOP                
n1:     .ASCII  "num1 = \x00"
n2:     .ASCII  "num2 = \x00"
         .END                  
