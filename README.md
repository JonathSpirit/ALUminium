# ALUminium

Copyright (C) 2020 Guillaume Guillet\
Licensed under CERN-OHL-W v2 or later

<table border="0px">
<tr>
<td>
This source describes Open Hardware and is licensed under the CERN-OHL-W v2 or later.
</td>
</tr>
<tr>
<td>
You may redistribute and modify this documentation and make products
using it under the terms of the CERN-OHL-W v2 (https:/cern.ch/cern-ohl).
This documentation is distributed WITHOUT ANY EXPRESS OR IMPLIED
WARRANTY, INCLUDING OF MERCHANTABILITY, SATISFACTORY QUALITY
AND FITNESS FOR A PARTICULAR PURPOSE. Please see the CERN-OHL-W v2
for applicable conditions.
</td>
</tr>
</table>

## Description
ALUminium is a CPLD/FPGA code for a 8bits arithmetic–logic unit, made for processor like [GP8B](https://github.com/JonathSpirit/GP8B)

The goal is to have a powerful 8bits ALU without the need of a external clock.

[Block diagram.pdf](documents/Block%20diagram.pdf)

<img src="images/Block%20diagram.png" alt="Block diagram image" width="600"/>

**Available operation :**
```
0x00 = Addition
0x01 = Substraction

0x02 = AND Bitwise
0x03 = OR Bitwise
0x04 = XOR Bitwise
0x05 = INV Bitwise

0x06 = AND Logical
0x07 = OR Logical
0x08 = XOR Logical
0x09 = INV Logical

0x0A = Shift to the left
0x0B = Shift to the right

0x0C = Strict bigger than
0x0D = Strict smaller than
0x0E = Bigger than
0x0F = Smaller than
0x10 = Equal

0x11 = Multiplication

0x12 = 2Complement
0x13 = Rotate
0x14 = Rotate to the left
0x15 = Rotate to the right

0x16 = Buffer left
0x17 = Buffer right

0xXX = 0x00
```
