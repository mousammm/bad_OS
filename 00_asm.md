## base 10 (decimal)

```txt
# base representation
eg: 13
    1 x (10^1) + 3 x (10^0)
    10 + 3

# decimal to binary
eg: 37 [100101]

div     res     remainder
37/2    18      1
18/2    9       0
9/2     4       1
4/2     2       0
2/2     1       0

* read from bottom to top
```

## base 2 (binary)

```
# binary to decimal
eg: 
    1010
    1 x (2^3) + 0 x (2^2) + 1 x (2^1) + 0 x (2^0)
    8 + 0 + 2 + 0 
    10

# bin to hex
eg:
    1100 0100
    12   4
    C4
```

## base 16 (hexadecimal)

* 0-9 
* A-F (10-15)

* 0000 0000 (this a byte which is 8bits)
* 1111 1111 ( 4bits max 1111 = 15 )
^ FF = 1111 1111 (see that 2 hex needed)

```txt
# hex to decimal
eg: 
    FF = 1111 1111
    15 x (16^1) + 15 x (15^0)
    15 x 16 + 15 
    255

# hex to binary
eg: 
    A3 = 1010 0011
```
