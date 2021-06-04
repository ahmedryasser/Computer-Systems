;File: fig0648.pep
;Computer Systems, Fifth edition
;Figure 6.48
;
         BR      main        
data:    .EQUATE 0           ;struct field #2d
next:    .EQUATE 2           ;struct field #2h
;
;******* main ()
first:   .EQUATE 8           ;local variable #2h
p:       .EQUATE 6           ;local variable #2h
first2:  .EQUATE 4           ;local variable #2h
p2:      .EQUATE 2           ;local variable #2h
value:   .EQUATE 0           ;local variable #2d
main:    LDBA    '\n',i
         STBA    charOut,d

         SUBSP   10,i         ;push #value #p2 #first2 #first #p   
         LDWA    0,i         ;first2 = 0
         STWA    first2,s  
         LDWA    0,i         ;p2 = 0
         STWA    p2,s 
  
         LDWX    first,s
         STWX    p,s
         LDWA    p,s
for1:    CPWX    0,i
         BREQ    endWh
         LDWA    first2,s
         STWA    p2,s
         LDWA    4,i         ;first = (struct node *) malloc(sizeof(struct node))
         CALL    malloc      ;allocate #data #next
         STWX    first2,s 
         LDWX    data,i
         LDWA    p,sfx     ;first->data = value
         LDWX    data,i      
         STWA    first2,sfx 
         LDWA    p2,s
         LDWX    next,i      
         STWA    first2,sfx 
         LDWX    next,i      ;p = p->next)
         LDWA    p,sfx       
         STWA    p,s
         Br      for1

endWh:   LDWA    first2,s     ;for (p = first
         STWA    p2,s         
for2:    LDWA    p2,s         ;p != 0
         CPWA    0,i         
         BREQ    endFor      
         LDWX    data,i      ;printf("%d ", p->data)
         DECO    p2,sfx       
         LDBA    ' ',i       
         STBA    charOut,d   
         LDWX    next,i      ;p = p->next)
         LDWA    p2,sfx       
         STWA    p2,s         
         BR      for2         
endFor:  ADDSP   10,i         ;pop #value #p #first #first2 #p2
         
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
