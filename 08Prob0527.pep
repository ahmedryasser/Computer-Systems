;File: 08Prob0527.pep
;Computer Systems, Fifth edition
;Prob0527
;
         BR      main        
width:   .BLOCK  2           ;global variable #2d
length:   .BLOCK  2           ;global variable #2d
perim:  .BLOCK  2
;
main:    DECI    width,d     ;scanf("%d %d", &exam1, &exam2)
         DECI    length,d     
         LDWA    width,d     ;score = (exam1 + exam2) * 2
         ADDA    length,d     
         ASLA                    
         STWA    perim,d     
         STRO    wid,d      
         DECO    width,d  
         LDBA    '\n',i      
         STBA    charOut,d
         STRO    len,d       
         DECO    length,d
         LDBA    '\n',i      
         STBA    charOut,d
         LDBA    '\n',i      
         STBA    charOut,d
         STRO    per,d       
         DECO    perim,d   
         LDBA    '\n',i      
         STBA    charOut,d   
         STOP                
wid:     .ASCII  "width = \x00"
len:     .ASCII  "length = \x00"
per:     .ASCII  "perimeter = \x00"

         .END                  
