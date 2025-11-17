.model small
.stack 100h

.data
msgVowel      db 10,13, 'Vowel character...$'
msgConsonant  db 10,13, 'Consonant character...$'
msgNotLetter  db 10,13, 'Not an alphabetic letter.$'

.code
main proc
    mov ax,@data
    mov ds,ax

    mov ah,1
    int 21h              ; read char -> AL

    ; check if uppercase A-Z
    mov bl, al
    cmp al, 'A'
    jl check_lower       ; if AL < 'A', might be lower or not letter
    cmp al, 'Z'
    jle check_vowel_upper
    ; else not uppercase letter, check lowercase
check_lower:
    cmp bl, 'a'
    jl not_letter
    cmp bl, 'z'
    jg not_letter

    ; At this point it's lowercase letter in BL
    mov al, bl           ; use AL as char to compare lower-case vowels
    ; check lower-case vowels
    cmp al,'a'
    je print_vowel
    cmp al,'e'
    je print_vowel
    cmp al,'i'
    je print_vowel
    cmp al,'o'
    je print_vowel
    cmp al,'u'
    je print_vowel
    jmp print_consonant

check_vowel_upper:
    ; AL is uppercase letter
    ; check uppercase vowels
    cmp al,'A'
    je print_vowel
    cmp al,'E'
    je print_vowel
    cmp al,'I'
    je print_vowel
    cmp al,'O'
    je print_vowel
    cmp al,'U'
    je print_vowel
    jmp print_consonant

print_vowel:
    mov dx, OFFSET msgVowel
    mov ah,9
    int 21h
    jmp exitProgram

print_consonant:
    mov dx, OFFSET msgConsonant
    mov ah,9
    int 21h
    jmp exitProgram

not_letter:
    mov dx, OFFSET msgNotLetter
    mov ah,9
    int 21h

exitProgram:
    mov ah,4Ch
    int 21h
main endp
end main
