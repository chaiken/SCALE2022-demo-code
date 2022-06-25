clean:
	rm -f main64 main128 *~

right-abi:
	gcc -o main64 is_negative_64.c main.c -o main64
	./main64

wrong-abi:
	gcc -o main128 is_negative_128.c main.c -o main128
	./main128

