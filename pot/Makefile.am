##
## Makefile.am -- Process this file with automake to produce
##                Makefile.in.
##
#
# Copyright (C) 2013, 2014 Bruno Félix Rezende Ribeiro
# <oitofelix@gnu.org>
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 3, or (at your option)
# any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#

$(eval include ${srcdir}/include.mk)
$(eval include ${srcdir}/local.mk)

SUBDIRS = release essays
EXTRA_DIST = include.mk local.mk ${aux_texi:=.pot}





####################
# POT distribution #
####################

%.pot : ${top_srcdir}/src/%.texi
	$(AM_V_GEN)
	$(AM_V_at) ${PO4A_GETTEXTIZE} ${po4a_options} --master $< --po $@
