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
	@echo Your pre-installation .bashrc will be copied back to ${HOME} as .bashrc.bak
	@echo Please merge any changes you made since installation into it
	mv ${DESTDIR}/usr/share/deltaT1/.bashrc.bak ${HOME}
	rm -f $(addprefix ${DESTDIR}/usr/local/bin/,${SRC})
	rm -f $(addprefix ${DESTDIR}/usr/share/deltaT1/,${DATA})
	# reinstall backed-up bashrc

.PHONY: all install uninstall
