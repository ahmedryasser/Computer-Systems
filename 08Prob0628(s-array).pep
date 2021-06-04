;File: fig0634.pep
;Computer Systems, Fifth edition
;Figure 6.34
;
         BR      main        
list:    .EQUATE  6           ;global variable #2d16a
j:       .EQUATE  4           ;global variable #2d
numItems:.EQUATE  2           ;global variable #2d
temp:    .EQUATE  0           ;global variable #2d
;
;******* main()
main:    SUBSP   38,i        ;push #list #j #numItems #temp 
         DECI    numItems,s
         LDWX    0,i         ;for (j = 0
         STWX    j,s         
for1:    CPWX    numItems,s         ;j < numItems
         BRGE    endFor1     
         ASLX                ;two bytes per integer
         DECI    list,sx    ;scanf("%d", &vector[j])
         LDWX    j,s         ;j++)
         ADDX    1,i         
         STWX    j,s         
         BR      for1        
endFor1: LDWX    0,i
         LDWA    list,sx
         STWA    temp,s  
         LDWX    0,i         ;for (j = 0
         STWX    j,s         
         LDWA    numItems,s         ;j >= 0
         SUBA    1,i
for2:    CPWX    numItems,s
         BRGE    endFor2     
         LDWX    j,s         
         ADDX    1,i         
         ASLX                
         LDWA    list,sx      
         LDWX    j,s         
         ASLX                
         STWA    list,sx      
         LDWX    j,s         
         ADDX    1,i         
         STWX    j,s         
         BR      for2

endFor2: LDWA    temp,s
         LDWX    numItems,s
         SUBX    1,i
         ASLX     
         STWA    list,sx

         LDWX    0,i         ;for (j = 3
         STWX    j,s         
for3:    CPWX    numItems,s         ;j >= 0
         BRGE    endFor3     
            
         ASLX                ;two bytes per integer
         DECO    list,sx    
            
         LDWX    j,s         ;j++)
         ADDX    1,i         
         STWX    j,s         
         BR      for3       
                 
endFor3: ADDSP   38,i        ;pop #list #j #numItems #temp 
         LDBA    '\n',i
         STBA    charOut,d
         STOP                
         .END       