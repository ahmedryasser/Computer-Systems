;File: Prob0521.pep
;Computer Systems, Fifth edition
;Ahmed Najiub
;
         LDBA    'A',i       ;Output 'H'
         STBA    0xFC16,d    
         LDBA    'h',i       ;Output 'i'
         STBA    0xFC16,d    
         LDBA    'm',i       ;Output 'i'
         STBA    0xFC16,d    
         LDBA    'e',i       ;Output 'i'
         STBA    0xFC16,d    
         LDBA    'd',i       ;Output 'i'
         STBA    0xFC16,d    
         STOP                
         .END                  
