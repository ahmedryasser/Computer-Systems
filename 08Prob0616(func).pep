;File: fig0621.pep
;Computer Systems, Fifth edition
;Figure 6.21
;
         BR      main        
myAge:   .BLOCK  2           ;global variable #2d

;
;******* void printBar(int n)
age:     .EQUATE 4           ;formal parameter #2d
nextYr:  .EQUATE 0           ;local variable #2d

putNext: SUBSP   4,i         ;push #age #nextYr 
         LDWA    age,s         
         ADDA    1,i
         STWA    nextYr,s         
         STRO    msg1,d
         DECO    age,s     
         STRO    msg2,d       
         DECO    nextYr,s
         ADDSP   4,i          ;pop #age #nextYr 
         RET  
msg1:    .ASCII  "Age: \n\x00"   
msg2:    .ASCII  "Age next year: \n\x00"               
            
;
;******* main()

main:    DECI    myAge,d    ;scanf("%d", &numPts)   
         LDWA    myAge,d     ;move value
         STWA    -2,s        
         SUBSP   2,i         ;push #Age ;WARNING: Age not specified in .EQUATE
         CALL    putNext    ;printBar(value)
         ADDSP   2,i         ;pop #Age ;WARNING: Age not specified in .EQUATE
         LDWA    64,i             
         STWA    -2,s 
         SUBSP   2,i        ;push #Age  ;WARNING: Age not specified in .EQUATE
         CALL    putNext    ;printBar(value)
         ADDSP   2,i         ;pop #Age ;WARNING: Age not specified in .EQUATE
endFor2: STOP                
         .END                  
