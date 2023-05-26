SRC = gen-student permit update-defaulter mess-allocation fee-breakup
DATA = feeBreakup.txt mess.txt bashrc

all: install

install: ${SRC}
	mkdir -p ${DESTDIR}/usr/local/bin
	cp ${SRC} ${DESTDIR}/usr/local/bin
	mkdir -p ${DESTDIR}/usr/share/deltaT1
	cp ${DATA} ${DESTDIR}/usr/share/deltaT1

uninstall:
	@echo Removing installed files...
	rm -f $(addprefix ${DESTDIR}/usr/local/bin/,${SRC})
	rm -f $(addprefix ${DESTDIR}/usr/share/deltaT1/,${DATA})

.PHONY: all install uninstall
