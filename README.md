#### [[Test_AVR]참고자료](https://www.youtube.com/watch?v=LE7-uzhlGVM) 

> ### vscode 
> - Add folder to Workspace -> led_test_ws
> - C/C++ exten -? ctrl+shift+p -> C/C++:Edit ... [Edit]

#### [WinAVR](https://sourceforge.net/projects/winavr/files/)
- 환경 변수 편집 -> 사용자변수 -> Path -> 편집 -> C:\cygwin64\bin
#### [Cygwin](http://www.cygwin.com/)
- .vscode -> c_cpp_p... -> "includePath":["C:\\WinAVR-20100110\\avr\\include"],

---

### Step by step RTOS for study embedded FW programming
1. [arm-none-eabi-gdb](https://goobgood.tistory.com/31)
2. [makefile](https://opensource.com/article/18/8/what-how-makefile)
3. [make errer](https://doc.kldp.org/KoreanDoc/html/GNU-Make/GNU-Make-8.html)

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
- make all, debug
