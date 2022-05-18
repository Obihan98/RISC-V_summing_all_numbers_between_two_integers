.data
s: .word 0,0,0

.text
main:
    la   x8,  s           # put the base address of array s in x8
    addi x10, x0, 4       # a is in x10
    addi x11, x0, 8       # b is in x11
    jal  x1,  mysum
    sw   x10, 0(x8)       # function result is in x10
    # insert your code here and complete the main() function
    addi x10, x0, 8
    jal  x1,  mysum
    sw   x10, 4(x8)
    addi x11, x0, 4
    jal  x1,  mysum
    sw   x10, 8(x8)
    jal  x0,  exit

mysum:
    # insert your code for the mySum() function
    bgt x10, x11, if
    j end
    
if:
    add x28, x0, x10
    add x10, x0, x11
    add x11, x0, x28
    
end:
    add x28, x0, x10
    addi x29, x0, 0
    
loop:
    bgt x28, x11, back
    add x29, x29, x28
    addi x28, x28, 1
    j loop
    
back:
    addi x10, x29, 0
    jr x1
    
exit:
    nop
