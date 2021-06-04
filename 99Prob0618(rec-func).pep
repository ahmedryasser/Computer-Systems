;File: prob0618.pep
;Computer Systems, Fifth Edition
;Problem 6.18
;
         BR      main        
;******* times(int mpr, int mcand)
retVal:  .EQUATE 6           ;return value #2d
mpr:     .EQUATE 4           ;formal parameter #2d
mcand:   .EQUATE 2           ;formal parameter #2d
;
times:   LDWA    mpr,s       ;if (mpr == 0)
         BRNE    elseif      
         LDWA    0,i         ;return 0
         STWA    retVal,s    
         RET                 
elseif:  LDWA    mpr,s       ;else if (mpr % 2 == 1)
         ANDA    0x0001,i    
         BREQ    else        
then:    LDWA    mpr,s       ;move mpr / 2
         ASRA                
         STWA    -4,s        
         LDWA    mcand,s     ;move mcand * 2
         ASLA                
         STWA    -6,s        
         SUBSP   6,i         ;push #retVal #mpr #mcand
         CALL    times       ;times(mpr / 2, mcand * 2)
         ADDSP   6,i         ;pop #mcand #mpr #retVal
         LDWA    -2,s        ;return times(mpr / 2, mcand * 2) + mcand
         ADDA    mcand,s     
         STWA    retVal,s    
         RET                 
else:    LDWA    mpr,s       ;move mpr / 2
         ASRA                
         STWA    -4,s        
         LDWA    mcand,s     ;move mcand * 2
         ASLA                
         STWA    -6,s        
         SUBSP   6,i         ;push #retVal #mpr #mcand
         CALL    times       ;times(mpr / 2, mcand * 2)
         ADDSP   6,i         ;pop #mcand #mpr #retVal
         LDWA    -2,s        ;return times(mpr / 2, mcand * 2)
         STWA    retVal,s    
         RET                 
;
;******* main()
n:       .EQUATE 2           ;local variable #2d
m:       .EQUATE 0           ;local variable #2d
main:    SUBSP   4,i         ;push #n #m
         DECI    n,s         ;scanf("%d %d", &n, &m)
         DECI    m,s         
         STRO    msg,d       ;printf("Product: %d\n", times(n, m))
         LDWA    n,s         ;move n
         STWA    -4,s        
         LDWA    m,s         ;move m
         STWA    -6,s        
         SUBSP   6,i         ;push #retVal #mpr #mcand
         CALL    times       ;times(n, m)
         ADDSP   6,i         ;pop #mcand #mpr #retVal
         DECO    -2,s        
         LDBA    '\n',i      
         STBA    charOut,d   
         ADDSP   4,i         ;pop #m #n
         STOP                
msg:     .ASCII  "Product: \x00"
         .END                  