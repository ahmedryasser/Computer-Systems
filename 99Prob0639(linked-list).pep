;File: prob0639.pep
;Computer Systems, Fifth Edition
;Problem 6.39
;
         BR      main        
data:    .EQUATE 0           ;struct field #2d
next:    .EQUATE 2           ;struct field #2h
;
;******* main()
first:   .EQUATE 8           ;local variable #2h
p:       .EQUATE 6           ;local variable #2h
first2:  .EQUATE 4           ;local variable #2h
p2:      .EQUATE 2           ;local variable #2h
value:   .EQUATE 0           ;local variable #2d
main:    SUBSP   10,i        ;push #first, #p, #first2, #p2, #value
         LDWA    0,i         ;first = 0
         STWA    first,s     
         DECI    value,s     ;scanf("%d", &value);
while:   LDWA    value,s     ;while (value != -9999)
         CPWA    -9999,i     
         BREQ    endWh       
         LDWA    first,s     ;p = first
         STWA    p,s         
         LDWA    4,i         ;first = (struct node *) malloc(sizeof(struct node))
         CALL    malloc      ;allocate #data #next
         STWX    first,s     
         LDWA    value,s     ;first->data = value
         LDWX    data,i      
         STWA    first,sfx   
         LDWA    p,s         ;first->next = p
         LDWX    next,i      
         STWA    first,sfx   
         DECI    value,s     ;scanf("%d", &value)
         BR      while       
endWh:   LDWA    first,s     ;for (p = first
         STWA    p,s         
for:     LDWA    p,s         ;p != 0
         CPWA    0,i         
         BREQ    endFor      
         LDWX    data,i      ;printf("%d ", p->data)
         DECO    p,sfx       
         LDBA    ' ',i       
         STBA    charOut,d   
         LDWX    next,i      ;p = p->next)
         LDWA    p,sfx       
         STWA    p,s         
         BR      for         
endFor:  LDBA    '\n',i      ;printf("\n")
         STBA    charOut,d   
         LDWA    0,i         ;first2 = 0
         STWA    first2,s    
         STWA    p2,s        ;p2 = 0
         LDWA    first,s     ;for (p = first
         STWA    p,s         
for2:    LDWA    p,s         ;p != 0
         CPWA    0,i         
         BREQ    endFor2     
         LDWA    first2,s    ;p2 = first2
         STWA    p2,s        
         LDWA    4,i         ;first2 = (struct node *) malloc(sizeof (struct node))
         CALL    malloc      ;allocate #data, #next
         STWX    first2,s    
         LDWX    data,i      ;first2->data = p->data
         LDWA    p,sfx       
         STWA    first2,sfx  
         LDWA    p2,s        ;first2->next = p2
         LDWX    next,i      
         STWA    first2,sfx  
         LDWA    p,sfx       ;p = p->next)
         STWA    p,s         
         BR      for2        
endFor2: LDWA    first2,s    ;for (p2 = first2
         STWA    p2,s        
for3:    LDWA    p2,s        ;p2 != 0
         CPWA    0,i         
         BREQ    endFor3     
         LDWX    data,i      ;printf("%d ", p2->data)
         DECO    p2,sfx      
         LDBA    ' ',i       
         STBA    charOut,d   
         LDWX    next,i      ;p2 = p2->next)
         LDWA    p2,sfx      
         STWA    p2,s        
         BR      for3        
endFor3: ADDSP   10,i        ;pop #value, #p2, #first2, #p, #first
         STOP                
;
;******* malloc()
;        Precondition: A contains number of bytes
;        Postcondition: X contains pointer to bytes
malloc:  LDWX    hpPtr,d     ;returned pointer
         ADDA    hpPtr,d     ;allocate from heap
         STWA    hpPtr,d     ;update hpPtr
         RET                 
hpPtr:   .ADDRSS heap        ;address of next free byte
heap:    .BLOCK  1           ;first byte in the heap
         .END                  