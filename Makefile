PREFIX = /usr/local

rst: rst.sh rst.awk rst.tsv
	cat rst.sh > $@
	echo 'exit 0' >> $@
	echo '#EOF' >> $@
	tar cz rst.awk rst.tsv >> $@
	chmod +x $@

test: rst.sh
	shellcheck -s sh rst.sh

clean:
	rm -f rst

install: rst
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	cp -f rst $(DESTDIR)$(PREFIX)/bin
	chmod 755 $(DESTDIR)$(PREFIX)/bin/rst

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/rst

.PHONY: test clean install uninstall
