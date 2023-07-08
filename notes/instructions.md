# 6502 Important Instructions

## Increment & Decrement Instructions

| Instruction | Mnemonic                    |
| :---------- | :-------------------------- |
| inc         | increment memory by one     |
| inx         | increment register X by one |
| iny         | increment register Y by one |
| dec         | decrement memory by one     |
| dex         | decrement register X by one |
| dey         | increment register Y by one |

* Z flag set to 1 if result is 0
* Z flag set to 0 if result is not 0
* N flag set to 1 if sign bit is 1
* N flag set to 0 if sign bit is 0

## Branching instructions

| Instruction | Mnemonic                 | Branch Condition |
| :---------- | :----------------------- | :--------------: |
| bpl         | branch on plus           |      N == 0      |
| bmi         | branch on minus          |      N == 1      |
| bvc         | branch on overflow clear |      V == 0      |
| bvs         | branch on overflow set   |      V == 1      |
| bcc         | branch on carry clear    |      C == 0      |
| bcs         | branch on carry set      |      C == 1      |
| bne         | branch on not equal to 0 |      Z == 1      |
| beq         | branch on equal to 0     |      Z == 0      |