DEST ?= /usr/bin

all:
	@echo Run \'make install\' to install funst on your device

install:
	@cp funst $(DEST)/funst
	@chmod 755 $(DEST)/funst
	@echo funst has been installed on your device

uninstall:
	@rm -rf $(DEST)/funst
	@echo funst has been removed from your device
