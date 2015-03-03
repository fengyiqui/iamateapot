all:main
main:main.o you.o my.o
	g++ -o $@ $^
*.o:*.d
	@echo "iamc"
depfiles:= main.d you.d my.d
include ${depfiles}
#main.o:main.cpp you/you.h my/my.h
#	g++ -c  $^
#you.o:you/you.cpp you/you.h
#	g++ -c $^
#my.o:my/my.cpp my/my.h
#	g++ -c $^
clean:
	rm main
	rm *.o
