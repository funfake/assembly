EXEFILE	= leaverange
OBJECTS = leaverange.o rng.o
CCFMT = -m32 
NASMFMT = -f elf32
CCOPT = -c -ggdb -O0
NASMOPT = -w+all

.c.o:
	gcc $(CCFMT) $(CCOPT) $<

.s.o:
	nasm $(NASMFMT) $(NASMOPT) $< -l $*.lst

$(EXEFILE): $(OBJECTS)
	cc $(CCFMT) -o ${EXEFILE} $(OBJECTS)

clean:
	rm *.o *.lst $(EXEFILE)