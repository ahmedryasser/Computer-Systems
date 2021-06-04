;File: fig0514a.pep
;Computer Systems, Fifth edition
;Figure 5.14(a)
;
         LDBA    0x001F,d    
         STBA    0xFC16,d    
         LDBA    0x0020,d    
         STBA    0xFC16,d    
         LDBA    0x0021,d    
         STBA    0xFC16,d 
         LDBA    0x0022,d    
         STBA    0xFC16,d  
         LDBA    0x0023,d    
         STBA    0xFC16,d     
         STOP                
         .ASCII  "Ahmed"       
         .END                  
