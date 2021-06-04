
         BR      main        
;
;******* int times(int n, int k)
n:              .EQUATE 6           ;formal parameter #2d
fpeg:           .EQUATE 4           ;formal parameter #2d
tpeg:           .EQUATE 2           ;formal parameter #2d


hanoi:   LDWA    n,s         ;if ((k == 0)
         CPWA    1,i          
         BRNE    else        
         STRO    msg1,d         ;return 0
         DECO    fPeg,s 
         STRO    msg2,d
         DECO    tPeg,s
         RET                 

else:    LDWA    n,s         ;move n - 1
         SUBA    1,i
         STWA    n,s
         LDWA    6,i
         SUBA    fPeg,s
         SUBA    tPeg,s
         LDWA    tPeg,s
         CALL    hanoi
         
         LDWA    1,i         ;move n - 1
         STWA    n,s
         CALL    hanoi

         LDWA    n,s         ;move n - 1
         SUBA    1,i
         STWA    n,s
         LDWA    6,i
         SUBA    fPeg,s
         SUBA    tPeg,s
         LDWA    fpeg,s
         CALL    hanoi
         
      
                          
;
;******* main()
num:     .EQUATE 4
fromPeg: .EQUATE 2
toPeg:   .EQUATE 0
main:    SUBSP   6,i          ;push #num #fromPeg 
         STRO    msg3,d
         LDWA    charIn,d
         STWA    n,s
         DECI    num,i ;ERROR: Illegal addressing mode for this instruction.
         STRO    msg4,d       ;printf("binCoeff(3, 1) = %d\n",
         DECI    fromPeg,i
         STRO    msg5,d
         DECI    toPeg,i
         SUBSP   6,i
         CALL    hanoi
         
ra1:     ADDSP   6,i         ;pop #m #n #retVal 
         DECO    -2,s        
         LDBA    '\n',i      
         STBA    charOut,d   
         STOP                
msg1:    .ASCII  "Move a disk from peg \x00"
msg2:    .ASCII  "to peg \x00"
msg3:    .ASCII  "How many disks would you like to move? \x00"
msg4:    .ASCII  "From which Peg? \x00"
msg5:    .ASCII  "To which Peg? \x00"





         .END                  
