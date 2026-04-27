FILE=$1

if [ -z "$FILE" ]; then
    echo "Usage: $0 <file.s>"
    exit 1
fi

if [ ! -f "$FILE" ]; then
    echo "Error: file not found: $FILE"
    exit 1
fi

echo "File: $FILE"
echo ""

GP_REGS="rax eax ax al \
         rbx ebx bx bl \
         rcx ecx cx cl \
         rdx edx dx dl \
         rsi esi si sil \
         rdi edi di dil \
         rsp esp sp spl \
         rbp ebp bp bpl \
         r8  r8d  r8w  r8b  \
         r9  r9d  r9w  r9b  \
         r10 r10d r10w r10b \
         r11 r11d r11w r11b \
         r12 r12d r12w r12b \
         r13 r13d r13w r13b \
         r14 r14d r14w r14b \
         r15 r15d r15w r15b"

SIMD_REGS=$(seq 0 15 | sed 's/\(.*\)/xmm\1 ymm\1 zmm\1/' | tr '\n' ' ')

ALL_REGS="$GP_REGS $SIMD_REGS"

echo "  Register   | References"
echo "  -----------|------------"

USED=0
for REG in $ALL_REGS; do
    COUNT=$(grep -oE "%${REG}([^a-zA-Z0-9]|$)" "$FILE" 2>/dev/null | wc -l | tr -d ' ')
    if [ "$COUNT" -gt 0 ]; then
        printf "  %%%-9s | %s\n" "$REG" "$COUNT"
        USED=$((USED + 1))
    fi
done

echo ""
echo "  Unique registers used: $USED"
