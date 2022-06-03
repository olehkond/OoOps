.PHONY: apr clean

RESULTDIR=./results
REPORTDIR=./reports
LOGDIR=./results

apr:
	if [ ! -d $(RESULTDIR) ]; then mkdir $(RESULTDIR); fi
	if [ ! -d $(REPORTDIR) ]; then mkdir $(REPORTDIR); fi
	icc_shell -64bit -shared_license -f ./../src/apr/apr.tcl | tee $(LOGDIR)/apr.log

clean:
	-@ rm -rf $(LOGDIR) \
			  $(RESULTDIR) \
			  $(REPORTDIR)


