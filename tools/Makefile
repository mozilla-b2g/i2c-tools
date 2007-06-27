# I2C tools for Linux
#
# Copyright (C) 2007  Jean Delvare <khali@linux-fr.org>
#
# Licensed under the GNU Public License.

CC	= gcc
CFLAGS	= -Wall -Wstrict-prototypes -Wshadow -Wpointer-arith -Wcast-qual \
	  -Wcast-align -Wwrite-strings -Wnested-externs -Winline -W \
	  -Wundef -Wmissing-prototypes -I../include

CFLAGS	+= -O2
# When debugging, use the following instead
#CFLAGS	+= -O -g

# Pass linker flags here
LDFLAGS	=

DESTDIR	=
prefix	= /usr/local
sbindir	= $(prefix)/sbin
mandir	= $(prefix)/share/man
man8dir	= $(mandir)/man8

INSTALL		:= install
INSTALL_DATA	:= $(INSTALL) -m 644
INSTALL_DIR	:= $(INSTALL) -m 755 -d
INSTALL_PROGRAM	:= $(INSTALL) -m 755
RM		:= rm -f

PROGRAMS	:= i2cdetect i2cdump i2cset i2cget

all : $(PROGRAMS)

#
# Programs
#

i2cdetect : i2cdetect.o i2cbusses.o
	$(CC) $(LDFLAGS) -o $@ $^

i2cdump : i2cdump.o i2cbusses.o util.o
	$(CC) $(LDFLAGS) -o $@ $^

i2cset : i2cget.o i2cbusses.o util.o
	$(CC) $(LDFLAGS) -o $@ $^

i2cget : i2cset.o i2cbusses.o util.o
	$(CC) $(LDFLAGS) -o $@ $^

#
# Objects
#

i2cdetect.o : i2cdetect.c i2cbusses.h
	$(CC) $(CFLAGS) -c $< -o $@

i2cdump.o : i2cdump.c i2cbusses.h util.h
	$(CC) $(CFLAGS) -c $< -o $@

i2cset.o : i2cset.c i2cbusses.h util.h
	$(CC) $(CFLAGS) -c $< -o $@

i2cget.o : i2cget.c i2cbusses.h util.h
	$(CC) $(CFLAGS) -c $< -o $@

i2cbusses.o : i2cbusses.c i2cbusses.h
	$(CC) $(CFLAGS) -c $< -o $@

util.o : util.c util.h
	$(CC) $(CFLAGS) -c $< -o $@

#
# Commands
#

strip : $(PROGRAMS)
	strip $(PROGRAMS)

install : install-bin install-man

uninstall : uninstall-bin uninstall-man

install-bin : $(PROGRAMS)
	$(INSTALL_DIR) $(DESTDIR)$(sbindir)
	for program in $(PROGRAMS) ; do \
	$(INSTALL_PROGRAM) $$program $(DESTDIR)$(sbindir) ; done

uninstall-bin :
	for program in $(PROGRAMS) ; do \
	$(RM) $(DESTDIR)$(sbindir)/$$program ; done

install-man :
	$(INSTALL_DIR) $(DESTDIR)$(man8dir)
	for program in $(PROGRAMS) ; do \
	$(INSTALL_DATA) $$program.8 $(DESTDIR)$(man8dir) ; done

uninstall-man :
	for program in $(PROGRAMS) ; do \
	$(RM) $(DESTDIR)$(man8dir)/$$program.8 ; done

clean :
	$(RM) *.o $(PROGRAMS) core
