%.42f: %.per 
	fglform -M $<

%.42m: %.4gl 
	fglcomp -M $*

MODS=$(patsubst %.4gl,%.42m,$(wildcard *.4gl))
FORMS=$(patsubst %.per,%.42f,$(wildcard *.per))

all:: $(MODS) $(FORMS)

run: all
	fglrun main

clean:
	rm -f *.42?
