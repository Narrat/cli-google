# cli-google Makefile

DESTDIR=
PREFIX=/usr/local
BINDIR=$(PREFIX)/bin
MANDIR=$(PREFIX)/share/man/man1
DOCDIR=$(PREFIX)/share/doc/cli-google

.PHONY: install uninstall

install:
	install -m755 -d $(DESTDIR)$(BINDIR)
	install -m755 -d $(DESTDIR)$(MANDIR)
	install -m755 -d $(DESTDIR)$(DOCDIR)
	gzip -c google.1 > google.1.gz
	install -m755 -t $(DESTDIR)$(BINDIR) google
	install -m644 -t $(DESTDIR)$(MANDIR) google.1.gz
	install -m644 -t $(DESTDIR)$(DOCDIR) README
	rm -f google.1.gz

uninstall:
	rm -f $(DESTDIR)$(BINDIR)/google
	rm -f $(DESTDIR)$(MANDIR)/google.1.gz
	rm -rf $(DESTDIR)$(DOCDIR)
