# Linux I2C header files
#
# Copyright (C) 2007  Jean Delvare <khali@linux-fr.org>
#
# Licensed under the GNU General Public License.

INCLUDE_DIR	:= include

INCLUDE_TARGETS	:= linux/i2c-dev.h

#
# Commands
#

install-include: $(addprefix $(INCLUDE_DIR)/,$(INCLUDE_TARGETS))
	$(INSTALL_DIR) $(DESTDIR)$(incdir)/linux
	for file in $(INCLUDE_TARGETS) ; do \
	$(INSTALL_DATA) $(INCLUDE_DIR)/$$file $(DESTDIR)$(incdir)/$$file ; done

uninstall-include:
	for file in $(INCLUDE_TARGETS) ; do \
	$(RM) $(DESTDIR)$(incdir)/$$file ; done

install: install-include

uninstall: uninstall-include
