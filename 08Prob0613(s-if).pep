;File: fig0610.pep
;Computer Systems, Fifth edition
;Figure 6.10
;
         BR      main        
ch:  .BLOCK  1           ;global variable #1c
;
main:    LDBA    charIn,d    ;scanf("%c", &letter)
         STBA    ch,d          
if:      CPBA    'A',i       ;if (letter == ' ')
         BRLT    elseif
         CPBA    'Z',i
         BRGT    elseif
         LDBA    'A',i
         STBA    charOut,d
         BR      endWh

elseif:  CPBA    'a',i 
         BRLT    else
         CPBA    'z',i
         BRGT    else
         LDBA    'a',i
         STBA    charOut,d 
         BR      endWh           
  
else:    LDBA    '$',i
         STBA    charOut,d

         LDBA    '\n',i
         STBA    charOut,d
       
endWh:   STOP                
         .END                  
