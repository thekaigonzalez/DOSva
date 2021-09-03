
all:
	gcc rlwrap.c -c
	gcc fun.c -c
	dmd initramfs.d rlwrap.o fun.o -L-llua5.3 -L-lreadline
	dmd dos.d fun.o rlwrap.o initramfs.o -L-llua5.3 -L-lreadline -ofDOS
	gcc liba.c -llua5.3 -fPIC -lreadline -shared -o ./libdos.so


clean:
	rm *.o
restart:
	rm *.so
	rm *.o
	rm DOS
