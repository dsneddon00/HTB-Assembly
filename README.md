# HTB-Assembly
This repo contains my class work and projects with the Assembly Module of Hack the Box Academy.
## Assembly

### Manually

Without dynamic linking to the libc library.
```
nasm -f elf64 example.s
ld -o example example.o
./example
```
With dynamic linking to the libc library
```
nasm -f elf64 example.s &&  ld example.o -o example -lc --dynamic-linker /lib64/ld-linux-x86-64.so.2 && ./example
```

### Automated
```
./assembler.sh example.s
./assembler.sh example.s -g
```

### Automated with Shellcode

Use the assembler.py tool and pass in a shellcode argument and a file to write to.

```
python3 assembler.py '4831db66bb79215348bb422041636164656d5348bb48656c6c6f204854534889e64831c0b0014831ff40b7014831d2b2120f054831c0043c4030ff0f05' 'helloAcademy'
./helloAcademy
```

## Disassembly
```
objdump -M intel -d example
objdump -sj .data example
```

## Extract Shellcode

We can use the tool getShellCode.py to extact shellcode from an executable.
```
python3 getShellCode.py example
```

## Load Shellcode

We can use the tool loadShellCode.py to load shellcode and run it.
```
python3 loadShellCode.py 'exampleShellCode'
```
