# Simplest possible demonstration of ABI breakage.
# Inspired by
#  https://thephd.dev/to-save-c-we-must-save-abi-fixing-c-function-abi

.SILENT:

clean:
	rm -f main64 main128 *.a *~

right-abi:
	gcc -o main64 is_negative_64.c main.c -o main64
	./main64

wrong-abi:
	gcc -o main128 is_negative_128.c main.c -o main128
	./main128

libnegative64: is_negative_64.o libnegative64.h
	rm -f libnegative.a libnegative.h
	ar rs libnegative64.a is_negative_64.o
	echo "Picking 64-bit library"
	ln -s libnegative64.a libnegative.a
	echo "Picking 64-bit header"
	ln -s libnegative64.h libnegative.h

libnegative128: is_negative_128.o libnegative128.h
	rm -f libnegative.h libnegative.a
	ar rs libnegative128.a is_negative_128.o
	echo "Picking 128-bit library"
	ln -s libnegative128.a libnegative.a
	echo "Picking 64-bit header"
	ln -s libnegative64.h libnegative.h

right-abi-lib: libnegative64
	gcc -o main2-64  main2.c libnegative.a
	./main2-64

wrong-abi-lib: libnegative128
	gcc -o main2-128  main2.c libnegative.a
	echo "Oops!"
	./main2-128

