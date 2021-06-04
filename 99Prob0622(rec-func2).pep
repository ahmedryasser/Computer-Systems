;File: prob0622.pep
;Computer Systems, Fifth Edition
;Problem 6.22
;
         BR      main        
;
;******* void hanoi(int n, int fPeg, int tPeg)
n:       .EQUATE 6           ;formal parameter #2d
fPeg:    .EQUATE 4           ;formal parameter #2d
tPeg:    .EQUATE 2           ;formal parameter #2d
hanoi:   LDWA    n,s         ;if (n == 1)
         CPWA    1,i         
         BRNE    else        
         STRO    msg1,d      ;printf("Move a disk from peg %d to peg %d.\n",
         DECO    fPeg,s      ;fPeg,
         STRO    msg2,d      
         DECO    tPeg,s      ;tPeg)
         STRO    msg3,d      
         BR      endHanoi    
else:    LDWA    n,s         ;move n - 1
         SUBA    1,i         
         STWA    -2,s        
         LDWA    fPeg,s      ;move fPeg
         STWA    -4,s        
         LDWA    6,i         ;move 6 - fPeg - tPeg
         SUBA    fPeg,s      
         SUBA    tPeg,s      
         STWA    -6,s        
         SUBSP   6,i         ;push #n #fPeg #tPeg
         CALL    hanoi       ;hanoi(n - 1, fPeg, 6 - fPeg - tPeg)
         ADDSP   6,i         ;pop #tPeg #fPeg #n
         LDWA    1,i         ;move 1
         STWA    -2,s        
         LDWA    fPeg,s      ;move fPeg
         STWA    -4,s        
         LDWA    tPeg,s      ;move tPeg
         STWA    -6,s        
         SUBSP   6,i         ;push #n #fPeg #tPeg
         CALL    hanoi       ;hanoi(1, fPeg, tPeg)
         ADDSP   6,i         ;pop #tPeg #fPeg #n
         LDWA    n,s         ;move n - 1
         SUBA    1,i         
         STWA    -2,s        
         LDWA    6,i         ;move 6 - fPeg - tPeg
         SUBA    fPeg,s      
         SUBA    tPeg,s      
         STWA    -4,s        
         LDWA    tPeg,s      ;move tPeg
         STWA    -6,s        
         SUBSP   6,i         ;push #n #fPeg #tPeg
         CALL    hanoi       ;hanoi(n - 1, 6 - fPeg - tPeg, tPeg)
         ADDSP   6,i         ;pop #tPeg #fPeg #n
endHanoi:RET                 
;
;******* main ()
num:     .EQUATE 4           ;local variable #2d
fromPeg: .EQUATE 2           ;local variable #2d
toPeg:   .EQUATE 0           ;local variable #2d
main:    SUBSP   6,i         ;push #num #fromPeg #toPeg
         STRO    msg4,d      ;printf("How many disks do you want to move? ")
         DECI    num,s       ;scanf("%d", &num)
         STRO    msg5,d      ;printf("From which peg? ")
         DECI    fromPeg,s   ;scanf("%d", &fromPeg)
         STRO    msg6,d      ;printf("To which peg? ")
         DECI    toPeg,s     ;scanf("%d", &toPeg)
         LDWA    num,s       ;move num
         STWA    -2,s        
         LDWA    fromPeg,s   ;move fromPeg
         STWA    -4,s        
         LDWA    toPeg,s     ;move toPeg
         STWA    -6,s        
         SUBSP   6,i         ;push #n #fPeg #tPeg
         CALL    hanoi       ;hanoi(num, fromPeg, toPeg)
         ADDSP   6,i         ;pop #tPeg #fPeg #n
         ADDSP   6,i         ;pop #toPeg #fromPeg #num
         STOP                
msg1:    .ASCII  "Move a disk from peg \x00"
msg2:    .ASCII  " to peg \x00"
msg3:    .ASCII  ".\n\x00"   
msg4:    .ASCII  "How many disks do you want to move? \x00"
msg5:    .ASCII  "From which peg? \x00"
msg6:    .ASCII  "To which peg? \x00"
         .END                  