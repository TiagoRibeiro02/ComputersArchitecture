org 100h
   Mov   cl, [bx - 1]               ;size of string
   Mov   dx, 0                      ;Dx will hold UPPERcase count
   Mov   cx, 0                      ;Cx will hold lowercase count

 cykluss:   

   Mov      al, [bx]                ;reading all characters
   Inc      bx                      ;increasing char in string

   Cmp      al,'$'                  ;end of line?
   Je       supp                    ;yes



                                    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    ;;  Check for the byte between 'a' and 'z' ;;
                                    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

   Cmp      al,'a'                  ;Is it below lower case 'a' ?
   JB       Not_Lower_Case          ;Yes, so it's not lower case

   CMP      al,'z'                  ;Is it above lower case 'z' ?
   JA       Not_Lower_Case          ;Yes, so it's not lower case

   Inc      Cx                      ;Else, the byte is between 'a' and 'z' so count it
   Jmp      cykluss                 ;Go do the next char



                                    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    ;;  Now, same thing for capital 'A' and 'Z';;
                                    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 Not_Lower_Case:

   Cmp      al,'A'                  ;Is it below upper case 'A' ?
   JB       Not_Upper_Case          ;Yes, so it's not lower case

   CMP      al,'Z'                  ;Is it above upper case 'Z' ?
   JA       Not_Upper_Case          ;Yes, so it's not lower case

   Inc      Dx                      ;Else, the byte is between 'A' and 'Z' so count it and drop through

 Not_Upper_Case:                    ;If we hit this label, it was neither upper nor lower

   Jmp      cykluss                 ;Go do the next char


                                    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    ;;  Note to original poster, you now have  ;;
                                    ;;  two counters, one in Cx and the other  ;;
                                    ;;  in Dx such as you had in your attempt  ;;
                                    ;;  when you started. It is now up to you  ;;
                                    ;;  to put it into your macro to make the  ;;
                                    ;;  output work for both numbers instead.  ;;
                                    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


 supp:

   Mov bx,dx

  ; Charp 10                         ;macro for new line

  ; CALL DISP                        ;convert from dx to number