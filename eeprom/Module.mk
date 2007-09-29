# EEPROM decoding scripts for the Linux eeprom driver
#
# Copyright (C) 2007  Jean Delvare <khali@linux-fr.org>
#
# Licensed under the GNU Public License.

EEPROM_DIR	:= eeprom

EEPROM_TARGETS	:= decode-dimms.pl decode-vaio.pl ddcmon decode-edid.pl \
		   decode-xeon.pl

#
# Commands
#

install-eeprom: $(addprefix $(EEPROM_DIR)/,$(EEPROM_TARGETS))
	$(INSTALL_DIR) $(DESTDIR)$(bindir)
	for program in $(EEPROM_TARGETS) ; do \
	$(INSTALL_PROGRAM) $(EEPROM_DIR)/$$program $(DESTDIR)$(bindir) ; done

uninstall-eeprom:
	for program in $(EEPROM_TARGETS) ; do \
	$(RM) $(DESTDIR)$(bindir)/$$program ; done

install: install-eeprom

uninstall: uninstall-eeprom
