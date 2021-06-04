;File: fig0634.pep
;Computer Systems, Fifth edition
;Figure 6.34
;
         BR      main        
list:    .BLOCK  32           ;global variable #2d16a
j:       .BLOCK  2           ;global variable #2d
numItems:.BLOCK  2           ;global variable #2d
temp:    .BLOCK  2           ;global variable #2d
;
;******* main()
main:    DECI    numItems,d
         LDWX    0,i         ;for (j = 0
         STWX    j,d         
for1:    CPWX    numItems,d         ;j < numItems
         BRGE    endFor1     
         ASLX                ;two bytes per integer
         DECI    list,x    ;scanf("%d", &vector[j])
         LDWX    j,d         ;j++)
         ADDX    1,i         
         STWX    j,d         
         BR      for1        
endFor1: LDWX    0,i
         LDWA    list,x
         STWA    temp,d  
         LDWX    0,i         ;for (j = 0
         STWX    j,d         
         LDWA    numItems,d         ;j >= 0
         SUBA    1,i
for2:    CPWX    numItems,d
         BRGE    endFor2     
         LDWX    j,d         
         ADDX    1,i         
         ASLX                
         LDWA    list,x      
         LDWX    j,d         
         ASLX                
         STWA    list,x      
         LDWX    j,d         
         ADDX    1,i         
         STWX    j,d         
         BR      for2

endFor2: LDWA    temp,d
         LDWX    numItems,d
         SUBX    1,i
         ASLX     
         STWA    list,x

         LDWX    0,i         ;for (j = 3
         STWX    j,d         
for3:    CPWX    numItems,d         ;j >= 0
         BRGE    endFor3     
            
         ASLX                ;two bytes per integer
         DECO    list,x    
            
         LDWX    j,d         ;j++)
         ADDX    1,i         
         STWX    j,d         
         BR      for3        
                 
endFor3: LDBA    '\n',i
         STBA    charOut,d
         STOP                
         .END                  
