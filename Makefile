mac-testvar:
	make -f makefile.mac testvar

mac-ohmyzsh:
	make -f makefile.mac ohmyzsh

mac-all:
	make -f makefile.mac all

mac-nodepython:
	make -f makefile.mac nodepython

mac-nvmtest:
	make -f makefile.mac nvmtest

mac-clean:
	make -f makefile.mac clean

ubuntu-test:
	make -f makefile.ubuntu test

