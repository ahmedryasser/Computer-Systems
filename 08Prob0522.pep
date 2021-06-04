;File: 08prob0522.pep
;Computer Systems, Fifth edition
;
;
         LDBA    0065,i       ;Output 'A'
         STBA    0xFC16,d
         LDBA    0104,i       ;Output 'h'
         STBA    0xFC16,d
         LDBA    0109,i       ;Output 'm'
         STBA    0xFC16,d
         LDBA    0101,i       ;Output 'e'
         STBA    0xFC16,d
         LDBA    0100,i       ;Output 'd'
         STBA    0xFC16,d
         STOP
         .END
