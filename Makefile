



all:
	cd rtl/tests/prgms && $(MAKE)
	cd rtl/tests && $(MAKE)
	cd sapr/syn && $(MAKE)
	cd sapr/apr && $(MAKE)
	cd sapr/verif/post-syn && $(MAKE)
	cd sapr/verif/post-apr && $(MAKE)




 
.PHONY: all
