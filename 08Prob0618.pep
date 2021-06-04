;File: fig0625.pep
;Computer Systems, Fifth edition
;Figure 6.25
;
         BR      main        
;
;******* int times(int n, int k)
retVal:          .EQUATE 6          ;return value #2d
mpr:             .EQUATE 4           ;formal parameter #2d
mcand:           .EQUATE 2           ;formal parameter #2d

binCoeff:LDWA    mpr,s         ;if ((k == 0)
         CPWA    0,i          
         BRNE    elseif        
         LDWA    0,i         ;return 0
         STWA    retVal,s    
         RET                 
elseif:  LDWA    mpr,s         ;move n - 1
         ANDA    2,i 
         CPWA    1,i
         BRNE    else
         LDWA    mpr,s
         ASRA
         STWA    mpr,s 
         LDWA    mcand,s
         STWA    mcand,s
         BREQ    main
         CALL    binCoeff
         LDWA    retVal,s
         ADDA    mcand,s
         STWA    retVal,s
else:    LDWA    mpr,s
         ASRA
         STWA    mpr,s 
         LDWA    mcand,s
         STWA    mcand,s
         BREQ    main
         CALL    binCoeff
         LDWA    retVal,s
         STWA    retVal,s
                          
;
;******* main()
m:       .EQUATE 2
n:       .EQUATE 0
main:    SUBSP   4,i          ;push #n #m ;WARNING: n not specified in .EQUATE ;WARNING: m not specified in .EQUATE
         LDWA    charIn,d
         STWA    n,s
         LDWA    charIn,d
         STWA    m,s 
         STRO    msg,d       ;printf("binCoeff(3, 1) = %d\n",
         LDWA    n,i         ;move 3
         STWA    -4,s        
         LDWA    m,i         ;move 1
         STWA    -6,s        
         SUBSP   6,i         ;push #retVal #n #k ;WARNING: n not specified in .EQUATE ;WARNING: k not specified in .EQUATE
         CALL    binCoeff    ;binCoeff(3, 1)
ra1:     ADDSP   6,i         ;pop #m #n #retVal ;WARNING: m not specified in .EQUATE ;WARNING: n not specified in .EQUATE
         DECO    -2,s        
         LDBA    '\n',i      
         STBA    charOut,d   
         STOP                
msg:     .ASCII  "Product = \x00"
         .END                  
