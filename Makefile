SRC = gen-student permit update-defaulter mess-allocation fee-breakup
DATA = feeBreakup.txt mess.txt aliasdefs.mk

all: install

install: ${SRC} ${DEST}
	mkdir -p ${DESTDIR}/usr/local/bin
	cp ${SRC} ${DESTDIR}/usr/local/bin
	mkdir -p ${DESTDIR}/usr/share/deltaT1
	cp ${DATA} ${DESTDIR}/usr/share/deltaT1
	# Back up existing .bashrc
	mv ${HOME}/.bashrc ${HOME}/.bashrc.bak
	# add alias definitions to .bashrc
	cat ${HOME}/.bashrc.bak aliasdefs.mk > ${HOME}/.bashrc
	# Save backed up bashrc in data dir
	mv ${HOME}/.bashrc.bak ${DESTDIR}/usr/share/deltaT1

uninstall:
	rm -f $(addprefix ${DESTDIR}/usr/local/bin/,${SRC})
	rm -f $(addprefix ${DESTDIR}/usr/share/deltaT1/,${DATA})
	# reinstall backed-up bashrc
	@echo Your old .bashrc will be copied back to ${HOME} as .bashrc.bak; please merge any changes made since installation
	mv ${DESTDIR}/usr/share/deltaT1/.bashrc.bak ${HOME}

.PHONY: all install uninstall
