;File: fig0610.pep
;Computer Systems, Fifth edition
;Figure 6.10
;
         BR      main        
limit:   .EQUATE 5              ;global variable #2d

number:  .BLOCK  2 

main:    DECI    number,d    ;scanf("%c", &letter)

while:   LDWA    number,d    ;while (letter != '*')
         CPWA    limit,i       
         BRGE    endWh       
         LDWA    number,d
         ADDA    1,i
         STWA    number,d
         DECO    number,d   
         BR      while
    
endWh:   STOP                
         .END                  
