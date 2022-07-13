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

## Disassembly
```
objdump -M intel -d example
objdump -sj .data example
```
