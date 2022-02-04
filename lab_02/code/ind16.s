.section .text
        .globl _start;
        len = 9 #Размер массива
        enroll = 1 #Количество обрабатываемых элементов за одну итерацию
        elem_sz = 4 #Размер одного элемента массива

_start:
        la x1, _x
        addi x20, x0, (len-1)/enroll
        lw x31, 0(x1)
        addi x1, x1, elem_sz*1
lp:
        lw x2, 0(x1)
        add x1, x1, elem_sz*enroll
        bltu x2, x31, lt
        add x31, x0, x2 #!
lt:
        addi x20, x20, -1
        bne x20, x0, lp
lp2: j lp2

        .section .data
_x:     .4byte 0x1
        .4byte 0x2
        .4byte 0x3
        .4byte 0x4
        .4byte 0x8
        .4byte 0x6
        .4byte 0x7
        .4byte 0x5
        .4byte 0x4