PREFIX = $$HOME/.local/bin

install:
	mkdir -p ${PREFIX}
	cp backlightcontrol ${PREFIX}/

uninstall:
	rm ${PREFIX}/backlightcontrol

.PHONY: install uninstall
