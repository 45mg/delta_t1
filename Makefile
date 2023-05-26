SRC = genstudent permit updatedefaulter messallocation feebreakup bashrc feeBreakup.txt mess.txt

all: install

install: ${SRC}
	@echo Installing to ${DESTDIR}${PREFIX}/bin...
	mkdir -p ${DESTDIR}${PREFIX}/bin
	cp ${SRC} ${DESTDIR}${PREFIX}/bin

uninstall:
	@echo Expecting installed files to be ${DESTDIR}${PREFIX}/bin
	@echo Removing installed files...
	rm -f $(addprefix ${DESTDIR}${PREFIX}/bin/,${SRC})

.PHONY: all install uninstall
