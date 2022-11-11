hellofun.o:
	gcc -o hellofun.o -c hellofun.c

testhello.o:
	gcc -o testhello.o -c testhello.c

testhello: hellofun.o testhello.o
	gcc -o testhello.exe hellofun.o testhello.o 

hellofun.dll: hellofun.o
	gcc -o hellofun.dll -s -shared hellofun.o -Wl,--subsystem,windows

usehello.o:
	gcc -o usehello.o -c usehello.c

usehello: usehello.o hellofun.dll
	gcc -o usehello.exe -s usehello.o -L. -lhellofun

adahello.o:
	gcc -o adahello.o -c adahello.adb

helloadafun.o:
	gcc -o helloadafun.o -c helloadafun.c

testadahello.o:
	gcc -o testadahello.o -c testadahello.c

testadahello: adahello.o helloadafun.o testadahello.o
	gnatbind -n adahello
	gnatlink -C adahello helloadafun.o testadahello.o \
		 -o testadahello.exe

helloadafun.dll: adahello.o helloadafun.o
	gnatbind -n adahello
	gnatlink -C adahello -o helloadafun.dll \
                 -shared helloadafun.o -Wl,--subsystem,windows

clean:
	del *~
	del hellofun.o testhello.o testhello.exe
	del hellofun.dll usehello.o usehello.exe
	del adahello.o adahello.ali helloadafun.o
	del testadahello.o testadahello.exe
	del helloadafun.dll
