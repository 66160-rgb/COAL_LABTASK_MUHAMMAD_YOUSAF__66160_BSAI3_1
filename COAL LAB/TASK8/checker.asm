org 100h                    

main_loop:                  
    ; === DISPLAY PROMPT MESSAGE ===
    mov dx, offset prompt   ; Load memory address of prompt string into DX register
    mov ah, 09h             ; Set AH to 09h (DOS function to display string)
    int 21h                 ; Call DOS interrupt to display the prompt string

    ; === TAKE CHARACTER INPUT FROM USER ===
    mov ah, 01h             ; Set AH to 01h (DOS function to read single character)
    int 21h                 ; Call DOS interrupt to get character input
    mov bl, al              ; Store the input character from AL into BL register

    ; === PRINT NEW LINE FOR BETTER FORMATTING ===
    mov dx, offset newline  ; Load address of newline string into DX
    mov ah, 09h             ; Set AH to 09h (display string function)
    int 21h                 ; Call DOS to print newline

    ; === CHECK IF USER WANTS TO EXIT (PRESSED 'Q' OR 'q') ===
    cmp bl, 'Q'             ; Compare input character with uppercase 'Q'
    je exit_program         ; If equal, jump to exit_program label
    cmp bl, 'q'             ; Compare input character with lowercase 'q'
    je exit_program         ; If equal, jump to exit_program label

    ; === CHECK IF CHARACTER IS UPPERCASE LETTER (A-Z) ===
    check_upper:            ; Label for uppercase checking
    cmp bl, 'A'             ; Compare input character with 'A' (ASCII 65)
    jb check_lower          ; If below 'A', jump to check_lower (not uppercase)
    cmp bl, 'Z'             ; Compare input character with 'Z' (ASCII 90)
    ja check_lower          ; If above 'Z', jump to check_lower (not uppercase)
    jmp check_vowel         ; If between A-Z, jump to check if it's a vowel

    ; === CHECK IF CHARACTER IS LOWERCASE LETTER (a-z) ===
    check_lower:            ; Label for lowercase checking
    cmp bl, 'a'             ; Compare input character with 'a' (ASCII 97)
    jb check_digit          ; If below 'a', jump to check_digit (not lowercase)
    cmp bl, 'z'             ; Compare input character with 'z' (ASCII 122)
    ja check_digit          ; If above 'z', jump to check_digit (not lowercase)
    jmp check_vowel         ; If between a-z, jump to check if it's a vowel

    ; === CHECK IF CHARACTER IS DIGIT (0-9) ===
    check_digit:            ; Label for digit checking
    cmp bl, '0'             ; Compare input character with '0' (ASCII 48)
    jb check_special        ; If below '0', jump to check_special (not digit)
    cmp bl, '9'             ; Compare input character with '9' (ASCII 57)
    ja check_special        ; If above '9', jump to check_special (not digit)
    mov dx, offset digit_msg ; Load address of digit message into DX
    jmp display_result      ; Jump to display the result

    ; === CHECK IF CHARACTER IS VOWEL (A,E,I,O,U) ===
    check_vowel:            ; Label for vowel checking
    ; Convert to uppercase for easier comparison
    mov al, bl              ; Copy character from BL to AL for processing
    cmp al, 'a'             ; Compare with 'a' to check if already lowercase
    jb already_upper        ; If below 'a', it's already uppercase, jump
    sub al, 32              ; Convert lowercase to uppercase by subtracting 32
    already_upper:          ; Label for already uppercase characters
    ; Check for each vowel
    cmp al, 'A'             ; Compare with 'A'
    je is_vowel             ; If equal, jump to is_vowel
    cmp al, 'E'             ; Compare with 'E'
    je is_vowel             ; If equal, jump to is_vowel
    cmp al, 'I'             ; Compare with 'I'
    je is_vowel             ; If equal, jump to is_vowel
    cmp al, 'O'             ; Compare with 'O'
    je is_vowel             ; If equal, jump to is_vowel
    cmp al, 'U'             ; Compare with 'U'
    je is_vowel             ; If equal, jump to is_vowel
    ; If not vowel, then it's consonant
    mov dx, offset alpha_msg ; Load address of alphabet message into DX
    jmp display_result      ; Jump to display the result

    is_vowel:               ; Label for vowel characters
    mov dx, offset vowel_msg ; Load address of vowel message into DX
    jmp display_result      ; Jump to display the result

    ; === CHECK FOR SPECIAL SYMBOLS ===
    check_special:          ; Label for special symbol checking
    cmp bl, 32              ; Compare with ASCII 32 (space character)
    je is_special           ; If equal, jump to is_special
    cmp bl, 33              ; Compare with ASCII 33 (exclamation mark)
    jb invalid_input        ; If below 33, jump to invalid_input (control chars)
    cmp bl, 47              ; Compare with ASCII 47 (forward slash)
    jbe is_special          ; If below or equal to 47, jump to is_special
    cmp bl, 58              ; Compare with ASCII 58 (colon)
    jb invalid_input        ; If below 58, jump to invalid_input
    cmp bl, 64              ; Compare with ASCII 64 (at symbol)
    jbe is_special          ; If below or equal to 64, jump to is_special
    cmp bl, 91              ; Compare with ASCII 91 (left square bracket)
    jb invalid_input        ; If below 91, jump to invalid_input
    cmp bl, 96              ; Compare with ASCII 96 (backtick)
    jbe is_special          ; If below or equal to 96, jump to is_special
    cmp bl, 123             ; Compare with ASCII 123 (left curly brace)
    jb invalid_input        ; If below 123, jump to invalid_input
    cmp bl, 126             ; Compare with ASCII 126 (tilde)
    jbe is_special          ; If below or equal to 126, jump to is_special
    jmp invalid_input       ; Anything else is invalid input

    is_special:             ; Label for special symbols
    mov dx, offset special_msg ; Load address of special message into DX
    jmp display_result      ; Jump to display the result

    invalid_input:          ; Label for invalid input
    mov dx, offset invalid_msg ; Load address of invalid message into DX

    ; === DISPLAY THE RESULT MESSAGE ===
    display_result:         ; Label for displaying result
    mov ah, 09h             ; Set AH to 09h (display string function)
    int 21h                 ; Call DOS to display the result message

    ; === PRINT TWO NEW LINES FOR SEPARATION BETWEEN ITERATIONS ===
    mov dx, offset newline  ; Load address of newline string
    mov ah, 09h             ; Set AH to 09h (display string function)
    int 21h                 ; Call DOS to print first newline
    mov dx, offset newline  ; Load address of newline string again
    mov ah, 09h             ; Set AH to 09h (display string function)
    int 21h                 ; Call DOS to print second newline

    ; === LOOP BACK TO GET ANOTHER CHARACTER ===
    jmp main_loop           ; Unconditional jump back to main_loop

; === EXIT PROGRAM ROUTINE ===
exit_program:               ; Label for program exit
    ; Display exit message
    mov dx, offset exit_msg ; Load address of exit message into DX
    mov ah, 09h             ; Set AH to 09h (display string function)
    int 21h                 ; Call DOS to display exit message

    ; === TERMINATE PROGRAM AND RETURN TO DOS ===
    mov ah, 4Ch             ; Set AH to 4Ch (DOS function to terminate program)
    mov al, 0               ; Set AL to 0 (exit code - 0 means success)
    int 21h                 ; Call DOS to end program

; === DATA SECTION - ALL MESSAGES AND STRINGS ===
prompt db 'Enter a single character (Q to quit): $'      ; Prompt message
newline db 13, 10, '$'          ; Newline characters (carriage return + line feed)
vowel_msg db 'You entered vowel$'                        ; Vowel message
alpha_msg db 'You entered alphabet (consonant)$'         ; Consonant message
digit_msg db 'You entered digit$'                        ; Digit message
special_msg db 'You entered special symbol$'             ; Special symbol message
invalid_msg db 'Invalid input$'                          ; Invalid input message
exit_msg db 13, 10, 'Program ended. Thank you!$'         ; Exit message