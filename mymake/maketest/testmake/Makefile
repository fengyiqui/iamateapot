#main:main.o my.o you.o
#	g++ -o $@ $^
#objfiles="main.o my.o you.o"
#dep:$(objfiles) 
#	g++ -g -Wall main.cpp my/my.h you/you.h -o main.o
#	g++ -g -Wall my/my.cpp -o my.o
#	g++ -g -Wall you/you.cpp -o you.o
.POHNY: all dep  clean
srcfiles=$(wildcard *.cpp)
depfiles=$(patsubst %.cpp,%.d,$(srcfiles))
objfiles=$(patsubst %.cpp,%.o,$(srcfiles))
all:main
main:$(objfiles)
	g++ -g -Wall -o $@ $(objfile)
dep:$(depfiles)
	@echo "make dep done^^)"
%.o:%.d
	@echo "question"
%.d:%.cpp
	g++ -MM -MT "$(patsubst %.d,%.o,$@) $@" -MF $@ $< 
	@echo "\tg++ -g -Wall -c -o $(patsubst %.d,%.o,$@) $<" >>$@
#include $(depfiles)
clean:
	rm *.o *.d
