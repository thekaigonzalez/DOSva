all:
	gcc fun.c -c
	dmd dos.d fun.o -L-llua5.3 -ofDOS
	gcc liba.c -llua5.3 -fPIC -lreadline -shared -o ./libdos.so
clean:
	rm *.o
restart:
	rm *.so
	rm *.o
	rm DOS
