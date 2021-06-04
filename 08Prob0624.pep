;File: 08prob0624.pep
;Computer Systems, Fifth edition

         BR      main  
product: .BLOCK  2           ;Global parameter #2d
n:       .BLOCK  2           ;Global parameter #2d
m:       .BLOCK  2           ;Global parameter #2d

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
         ADDSP   6,i         ;pop   #mcand #mpr #prod
         RET                 
;
;******* main()

main:    DECI    product,d   ;scanf("%d", &product)
         DECI    n,d         ;scanf("%d", &n)
         DECI    m,d         ;scanf("%d", &m)
         LDWA    product,i
         STWA    -2,s
         LDWA    n,d
         STWA    -4,s
         LDWA    m,d
         STWA    -6,s
         SUBSP   6,i         ;push #mcand #mpr #prod
         CALL    times        
         ADDSP   6,i         ;pop #prod #mpr #mcand
         STRO    msg1,d      
         DECO    product,s     
         LDBA    '\n',i      
         STBA    charOut,d   
         STOP    
msg1:    .ASCII  "Product: \x00"            
         .END                  
