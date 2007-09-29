# I2C tools for Linux
#
# Copyright (C) 2007  Jean Delvare <khali@linux-fr.org>
#
# Licensed under the GNU General Public License.

DESTDIR	=
prefix	= /usr/local
bindir	= $(prefix)/bin
sbindir	= $(prefix)/sbin
mandir	= $(prefix)/share/man
man8dir	= $(mandir)/man8

INSTALL		:= install
INSTALL_DATA	:= $(INSTALL) -m 644
INSTALL_DIR	:= $(INSTALL) -m 755 -d
INSTALL_PROGRAM	:= $(INSTALL) -m 755
RM		:= rm -f

CC	:= gcc
CFLAGS	:= -Wall

CFLAGS	+= -O2
# When debugging, use the following instead
#CFLAGS	+= -O -g

.PHONY: all strip clean install uninstall

all:

include eeprom/Makefile
include tools/Makefile
