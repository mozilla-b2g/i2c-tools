# EEPROM decoding scripts for the Linux eeprom driver
#
# Copyright (C) 2007  Jean Delvare <khali@linux-fr.org>
#
# Licensed under the GNU Public License.

DESTDIR	=
prefix	= /usr/local
bindir	= $(prefix)/bin

INSTALL		:= install
INSTALL_DIR	:= $(INSTALL) -m 755 -d
INSTALL_PROGRAM	:= $(INSTALL) -m 755
RM		:= rm -f

PROGRAMS	:= decode-dimms.pl decode-vaio.pl ddcmon decode-edid.pl \
		   decode-xeon.pl

all : $(PROGRAMS)

#
# Commands
#

install : install-bin

uninstall : uninstall-bin

install-bin : $(PROGRAMS)
	$(INSTALL_DIR) $(DESTDIR)$(bindir)
	for program in $(PROGRAMS) ; do \
	$(INSTALL_PROGRAM) $$program $(DESTDIR)$(bindir) ; done

uninstall-bin :
	for program in $(PROGRAMS) ; do \
	$(RM) $(DESTDIR)$(bindir)/$$program ; done

clean :
