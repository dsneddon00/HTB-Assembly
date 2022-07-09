# HTB-Assembly

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
