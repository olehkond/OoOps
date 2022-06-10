



all:
	cd rtl/tests/prgms && $(MAKE)
	cd rtl/tests && $(MAKE)
	cd sapr/syn && $(MAKE)
	cd sapr/apr && $(MAKE)




 
.PHONY: all
