# Helper for the Linux i2c-stub bus driver
#
# Copyright (C) 2007  Jean Delvare <khali@linux-fr.org>
#
# Licensed under the GNU General Public License.

STUB_DIR	:= stub

#
# Commands
#

install-stub: $(STUB_DIR)/i2c-stub-from-dump
	$(INSTALL_DIR) $(DESTDIR)$(bindir)
	$(INSTALL_PROGRAM) $(STUB_DIR)/i2c-stub-from-dump $(DESTDIR)$(sbindir)

uninstall-stub:
	$(RM) $(DESTDIR)$(sbindir)/i2c-stub-from-dump

install: install-stub

uninstall: uninstall-stub
