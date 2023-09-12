EXEFILE	= mainstrlen
OBJECTS = main.o mystrlen.o
CCFMT = -m32 
NASMFMT = -f elf32
CCOPT = -c -ggdb -O0
NASMOPT = -w+all

.c.o:
	cc $(CCFMT) $(CCOPT) $<

.s.o:
	nasm $(NASMFMT) $(NASMOPT) $< -l $*.lst

$(EXEFILE): $(OBJECTS)
	cc $(CCFMT) -o ${EXEFILE} $(OBJECTS)

clean:
	rm *.o *.lst $(EXEFILE)