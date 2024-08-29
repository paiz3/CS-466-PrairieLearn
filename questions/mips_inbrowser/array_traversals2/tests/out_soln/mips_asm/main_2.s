# word test
# syscall constants
PRINT_INT = 1
PRINT_CHAR = 11
PRINT_STRING = 4

# Place data for test case here
# Do not touch anything else until the main function
.data
.align 2
array:     .word 9999
.align 2
length:    .word 0
.align 2
error:     .asciiz "ERROR: array changed illegally\n"

null_str: .asciiz "(null) "
.align 2
stack_ptr: .word 0


.text
# Until you get to main, the following are useful helper functions
# for creating the output you need to compare with "correct" from
# server.py. 

# print int and space ##################################################
#
# argument $a0: number to print
# returns       nothing

print_int_and_space:
    li      $v0, PRINT_INT  # load the syscall option for printing ints
    syscall         # print the number

    li      $a0, ' '        # print a blank space
    li      $v0, PRINT_CHAR # load the syscall option for printing chars
    syscall         # print the char
    
    jr      $ra     # return to the calling procedure

# print string ########################################################
#
# argument $a0: string to print
# returns       nothing

print_string:
    li      $v0, PRINT_STRING   # print string command
    syscall                 # string is in $a0
    jr      $ra

# print string and space ###############################################
#
# argument $a0: string to print
# returns       nothing

print_string_and_space:
    li      $v0, PRINT_STRING   # print string command
    syscall                 # string is in $a0
    li      $a0, ' '        # print a blank space
    li      $v0, PRINT_CHAR # load the syscall option for printing chars
    syscall         # print the char
    jr      $ra


# print newline ########################################################
#
# no arguments
# returns       nothing

print_newline:
    li      $a0, '\n'       # print a newline char.
    li      $v0, PRINT_CHAR
    syscall 
    jr      $ra



# print int array ########################################################
#
# argument $a0: int array to print
# argument $a1: length of array
# returns       nothing
print_int_array:
    sub     $sp, $sp, 16
    sw      $ra, 0($sp)
    sw      $s0, 4($sp)
    sw      $s1, 8($sp)
    sw      $s2, 12($sp)
    move    $s0, $a0
    move    $s1, $a1
    move    $s2, $0

pia_loop:
    bge     $s2, $s1, pia_end
    mul     $t0, $s2, 4
    add     $t0, $t0, $s0
    lw      $a0, 0($t0)
    jal     print_int_and_space
    add     $s2, $s2, 1
    j       pia_loop
pia_end:
    lw      $ra, 0($sp)
    lw      $s0, 4($sp)
    lw      $s1, 8($sp)
    lw      $s2, 12($sp)
    add     $sp, $sp, 16
    jr      $ra

# print char array ########################################################
#
# argument $a0: char array to print
# argument $a1: length of array
# returns       nothing
print_char_array:
    sub     $sp, $sp, 16
    sw      $ra, 0($sp)
    sw      $s0, 4($sp)
    sw      $s1, 8($sp)
    sw      $s2, 12($sp)
    move    $s0, $a0
    move    $s1, $a1
    move    $s2, $0

pca_loop:
    bge     $s2, $s1, pca_end
    add     $t0, $s0, $s2
    lb      $a0, 0($t0)
    jal     print_int_and_space
    add     $s2, $s2, 1
    j       pca_loop
pca_end:
    lw      $ra, 0($sp)
    lw      $s0, 4($sp)
    lw      $s1, 8($sp)
    lw      $s2, 12($sp)
    add     $sp, $sp, 16
    jr      $ra

fix_stack:
    lw      $sp, stack_ptr
    jr      $ra

# main function ########################################################
#
#  this will test 'mips_asm
#
#########################################################################
.globl main
main:
    # allocate stack frame
    sub     $sp, $sp, 4
    sw      $ra, 0($sp)     # save $ra on stack
    sw      $sp, stack_ptr  # save the stack pointer in case student deletes it

    # Code for calling test case goes here
    sub     $sp, $sp, 4
    la      $a0, array
    la      $a1, length
    lw      $a1, 0($a1)
    lw      $t0, 0($a0)    # save original array[0] contents on stack
    sw      $t0, 0($sp)  
    jal     mips_asm  # calls the student's code

    # Print result to the terminal and compare with "correct" from server.py
    lw      $t0, 0($sp)    # restore original array[0]
    add     $sp, $sp, 4
    la      $a0, array
    lw      $t1, 0($a0)
    bne     $t0, $t1, print_error
    la      $a1, length
    lw      $a1, 0($a1)
    jal     print_int_array
    jal     print_newline
    j       cleanup
print_error:
    li      $v0, PRINT_STRING
    la      $a0, error
    syscall

cleanup:
    # Clean up the stack
    jal     fix_stack      # in case the student destroyed the stack pointer
    lw      $ra, 0($sp)
    add     $sp, $sp, 4
    jr      $ra