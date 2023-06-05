1. [arm-none-eabi-gdb](https://goobgood.tistory.com/31)
2. [makefile](https://opensource.com/article/18/8/what-how-makefile)

#### Compiler install
- sudo apt install gcc-arm-none-eabi
- sudo apt install qemu-system-arm

#### Just Do it
- arm-none-eabi-as -march=armv7-a -mcpu=cortex-a8 -o Entry.o ./Entry.S
- arm-none-eabi-objcopy -O binary Entry.o Entry.bin
- hexdump Entry.bin
- arm-none-eabi-ld -n -T ./navilos.ld -nostdlib -o navilos.axf boot/Entry.o
- arm-none-eabi-objdump -D navilos.axf
- ./navilos.axf
- qemu-system-arm -M realview-pb-a8 -kernel navilos.axf -S -gdb tcp::1234,ipv4
- arm-none-eabi-gdb
    - target remote:1234
    - x/4x 0
- make all
