#Main application file name
MAIN_APP = test
#Main hex file path in windows format
MAIN_HEX_PATH = C:\test_avr\$(MAIN_APP).hex

# Compiler and other Section
CC = avr-gcc
OBJCOPY = avr-objcopy.exe
AVRDUDE := avrdude

#Options for avr-gcc
CFLAGS = -g -Os -o

#Linking options for avr-gcc
LFLAGS = -mmcu=atmega328p -o

#Options for HEX file generation
HFLAGS = elf32-avr -O ihex

#Options for avrdude to burn the hex file
#MMCU model here according to avrdude options
DUDEFLAGS = -c
DUDEFLAGS += arduino 
DUDEFLAGS += -p
DUDEFLAGS += m8  
DUDEFLAGS += -P 
DUDEFLAGS += COM4 
DUDEFLAGS += -b 
DUDEFLAGS += 19200 
DUDEFLAGS += -U flash:w:$(MAIN_HEX_PATH):i

# Sources files needed for building the application 
SRC = $(MAIN_APP).c
SRC += 

# The headers files needed for building the application
INCLUDE = -g 
INCLUDE += 

# commands Section
Burn : Build
	$(AVRDUDE) $(DUDEFLAGS)

Build : $(MAIN_APP).elf
	$(OBJCOPY) -I $(HFLAGS) $(MAIN_APP).elf $(MAIN_APP).hex
	
$(MAIN_APP).elf: $(MAIN_APP).o
	$(CC) $(INCLUDE) $(LFLAGS)  $(SRC)  $@
	
$(MAIN_APP).o:$(SRC)
	$(CC) $^ $(INCLUDE) $(CFLAGS) $@