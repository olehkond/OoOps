

# We need the sumbmodule to be initialized so we check that an internal file 
# exists, and if it doesnt initialize it
VERIF_FLDR_INIT = verif/spoke



TARGETS = $(VERIF_FLDR_INIT)


all: $(TARGETS)



$(VERIF_FLDR_INIT):
	git submodule init
	git submodule update
	$(MAKE) -C verif
	setenv PATH="$(PATH):$(realpath $@)"

 

.FORCE:
 
.PHONY: all
