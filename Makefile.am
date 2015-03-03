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

EXTRA_DIST = include.mk help.mk ${release_doc}	\
  build-aux/gendocs.sh build-aux/texinfo.tex
SUBDIRS = src pot po

ACLOCAL_AMFLAGS = -I m4

# These flags are here with the main purpose of saving time in the
# distribution creation process.
AM_DISTCHECK_CONFIGURE_FLAGS = \
  --with-font=/home/felix/share/fonts/unifont-6.3.20131020.ttf

# AM_DISTCHECK_CONFIGURE_FLAGS = --enable-all-stdal --enable-all-col \
#   --with-font=/home/felix/share/fonts/unifont-6.3.20131020.ttf





#################################
# Top level documentation files #
#################################

### Template recipe intended to generate the top-level documentation
### files from the respective Texinfo sources.
define release_doc_recipe
${1} : $${top_srcdir}/src/release/${1}.texi
	$${AM_V_GEN}
	$${AM_V_at} $${MAKEINFO} -D file --plaintext \
	  -I $${top_srcdir}/src \
	  -I $${top_srcdir}/src/release \
	  -I $${top_srcdir}/src/help \
	  --output=$$@ $${srcdir}/$$<
endef

### Instantiate the above recipe template for each top-level
### documentation file.
$(foreach f,${release_doc},$(eval $(call release_doc_recipe,${f})))

### Regenerate the top-level documentation at the distribution stage.
dist : ${release_doc}
