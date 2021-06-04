;File: prob0625.pep
;Computer Systems, Fifth Edition
;Problem 6.25
         BR      main        
;
;******* times(int *prod, int mpr, int mcand)
prod:    .EQUATE 6           ;formal parameter #2h
mpr:     .EQUATE 4           ;formal parameter #2d
mcand:   .EQUATE 2           ;formal parameter #2d
;
times:   LDWA    0,i         ;*prod = 0
         STWA    prod,sf     
while:   LDWA    mpr,s       ;while (mpr != 0)
         CPWA    0,i         
         BREQ    endWh       
if:      LDWA    mpr,s       ;if (mpr % 2 == 1)
         ANDA    0x0001,i    
         BREQ    endIf       
         LDWA    prod,sf     ;*prod = *prod + mcand
         ADDA    mcand,s     
         STWA    prod,sf     
endIf:   LDWA    mpr,s       ;mpr /= 2
         ASRA                
         STWA    mpr,s       
         LDWA    mcand,s     ;mcand *= 2
         ASLA                
         STWA    mcand,s     
         BR      while       
endWh:   RET                 
;
;******* main()
product: .EQUATE 4           ;local variable #2d
n:       .EQUATE 2           ;local variable #2d
m:       .EQUATE 0           ;local variable #2d
main:    SUBSP   6,i         ;push #product #n #m
         DECI    n,s         ;scanf("%d %d", &n, &m)
         DECI    m,s         
         MOVSPA              ;move &product
         ADDA    product,i   
         STWA    -2,s        
         LDWA    n,s         ;move n
         STWA    -4,s        
         LDWA    m,s         ;move m
         STWA    -6,s        
         SUBSP   6,i         ;push #prod #mpr #mcand
         CALL    times       ;times(&product, n, m)
         ADDSP   6,i         ;pop #mcand #mpr #prod
         STRO    msg,d       ;printf("Product: %d\n", product)
         DECO    product,s   
         LDBA    '\n',i      
         STBA    charOut,d   
         ADDSP   6,i         ;pop #m #n #product
         STOP                
msg:     .ASCII  "Product: \x00"
         .END                  