#
# include.mk -- Common definitions;
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

include ${top_srcdir}/include.mk





#####################
# Texinfo Variables #
#####################

texinfo_includes = -I ${abs_top_srcdir}/build-aux \
  -I ${abs_top_srcdir}/src -I ${abs_top_srcdir}/src/release \
  -I ${abs_top_srcdir}/src/www -I ${abs_top_srcdir}/src/essays \
  -I ${abs_top_srcdir}/src/help -I ${abs_top_builddir}/src

AM_MAKEINFOFLAGS = ${texinfo_includes}
makeinfo = ${MAKEINFO} ${AM_MAKEINFOFLAGS} ${MAKEINFOFLAGS}

AM_MAKEINFOHTMLFLAGS = ${texinfo_includes}
MAKEINFOHTML = ${makeinfo} --html
makeinfohtml = ${MAKEINFOHTML} ${AM_MAKEINFOHTMLFLAGS} ${MAKEINFOHTMLFLAGS}

TEXI2DVI := ${TEXI2DVI} ${texinfo_includes}

# TEXINPUTS =											\
# ${top_srcdir}/build-aux${PATH_SEPARATOR}${top_builddir}${PATH_SEPARATOR}${TEXINPUTS}
# export TEXINPUTS

makeinfo += --no-split
makeinfohtml += --no-split --no-node-files --no-headers -c SHOW_TITLE=undef





#####################
# General Variables #
#####################

lingua = en

release_texi = ${top_srcdir}/src/release.texi
essay_header = ${top_srcdir}/src/essay-header.texi
