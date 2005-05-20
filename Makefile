uname=2.6.11.10
MYSRC=linux-$(uname)-caps

capslock.patch-$(uname).gz: capslock.patch-$(uname)
	gzip -c $< > $@

dontdiff:
	wget http://www.moses.uklinux.net/patches/dontdiff

capslock.patch-$(uname): dontdiff
	-diff -upr -X dontdiff {linux-$(uname),$(MYSRC)}/drivers/macintosh/ > $@

.PHONY: clean
clean:
	rm -f capslock.patch-$(uname){,.gz} dontdiff
