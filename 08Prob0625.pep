;File: 08prob0625.pep
;Computer Systems, Fifth edition
;
         BR      main  


;
;******* void times(int *prod, int mpr, int mcand)
prod:    .EQUATE 6           ;formal parameter #2h
mpr:     .EQUATE 4           ;formal parameter #2d
mcand:   .EQUATE 2           ;formal parameter #2d
times:   SUBSP   6,i         ;push #prod #mpr #mcand
         LDWA    0,i         
         STWA    prod,sf         
while:   LDWA    mpr,s
         CPWA    0,i
         BREQ    main
         ANDA    1,i
         CPWA    1,i
         BRNE    rest
         LDWA    prod,sf
         ADDA    mcand,s
         STWA    prod,sf
rest:    LDWA    mpr,s
         ASRA
         STWA    mpr,s
         LDWA    mcand,s
         ASLA    
         STWA    mcand,s
         BR      while
         ADDSP   6,i         ;pop #mcand #mpr #prod  
         RET                 
;
;******* main()
product: .EQUATE  4           ;Global parameter #2d 
n:       .EQUATE  2           ;Global parameter #2d
m:       .EQUATE  0           ;Global parameter #2d
main:    SUBSP   6,i         ;pop #product #n #m
         
         DECI    n,s         ;scanf("%d", &n)
         DECI    m,s         ;scanf("%d", &m)
         MOVSPA              
         ADDA    product,i     
         STWA    -2,s        
         LDWA    n,s     
         STWA    -4,s        
         LDWA    m,s    
         STWA    -6,s        
         SUBSP   6,i         ;push #product #n #m 
         CALL    times        
ra1:     ADDSP   6,i         ;pop #prod #mpr #mcand
         STRO    msg1,d      
         DECO    product,s     
         LDBA    '\n',i      
         STBA    charOut,d   
         ADDSP   6,i         ;pop #product #n #m 
         STOP    
msg1:    .ASCII  "Product: \x00"            
         .END                  
