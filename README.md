# HTB-Assembly
This repo contains my class work and projects with the Assembly Module of Hack the Box Academy.
## Assembly

### Manually

```
nasm -f elf64 example.s
ld -o example example.o
./example
```

### Automated
```
./assembler.sh
```

## Disassembly
```
objdump -M intel -d example
objdump -sj .data example
```
