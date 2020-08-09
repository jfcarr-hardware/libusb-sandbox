COMPILER = clang
FORMATTER = clang-format -i
USBLIB = usb-1.0

default:
	@echo 'Targets:'
	@echo '  run'
	@echo '  build'
	@echo '  format'
	@echo '  clean'

run: build
	./libusb-sandbox

build: libusb-sandbox

libusb-sandbox: main.o
	$(COMPILER) -l$(USBLIB) -o libusb-sandbox main.o

main.o: main.c
	$(COMPILER) -c main.c

format:
	$(FORMATTER) main.c

clean:
	-rm -f main.o
	-rm -f libusb-sandbox
