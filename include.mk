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

include ${top_srcdir}/help.mk





###################
# Texinfo sources #
###################

# Helper function
texi_docs = $(notdir $(basename $(wildcard ${abs_top_srcdir}/${1}/*.texi)))

# Auxiliary sources
aux_texi := $(call texi_docs,src)

# Release documentation
release_doc := $(call texi_docs,src/release)

# Build system documentation
help_doc := $(call texi_docs,src/help)

# Available essays and articles
essays := $(call texi_docs,src/essays)





###############
# Directories #
###############

#### Collection

# Info
collection_infodir = ${docdir}/${lingua}/collection/info

# HTML
collection_htmldir = ${docdir}/${lingua}/collection/html

# PDF
collection_pdfdir = ${docdir}/${lingua}/collection/pdf

# DVI
collection_dvidir = ${docdir}/${lingua}/collection/dvi

# PS
collection_psdir = ${docdir}/${lingua}/collection/ps

# Plain text
collection_txtdir = ${docdir}/${lingua}/collection/txt

# Docbook
collection_dbkdir = ${docdir}/${lingua}/collection/dbk

# Texinfo XML
collection_xmldir = ${docdir}/${lingua}/collection/xml


#### Standalone

# Info
standalone_infodir = ${docdir}/${lingua}/standalone/info

# HTML
standalone_htmldir = ${docdir}/${lingua}/standalone/html

# PDF
standalone_pdfdir = ${docdir}/${lingua}/standalone/pdf

# DVI
standalone_dvidir = ${docdir}/${lingua}/standalone/dvi

# PS
standalone_psdir = ${docdir}/${lingua}/standalone/ps

# Plain text
standalone_txtdir = ${docdir}/${lingua}/standalone/txt

# Docbook
standalone_dbkdir = ${docdir}/${lingua}/standalone/dbk

# Texinfo XML
standalone_xmldir = ${docdir}/${lingua}/standalone/xml





##################
# List of Images #
##################

tottfs = tottfs
tottfs_dir = ${top_srcdir}/src/philosophy-figures/tottfs

### Top-level figures
top_level_figures := categories-of-free-and-nonfree-software-diagram	\
  the-free-software-song-score \
  a-note-on-software-diagram

### Term "free software"
trans_term_free := \
$(notdir $(basename $(wildcard ${tottfs_dir}/free/[a-z][a-z].txt))) \
$(notdir $(basename $(wildcard ${tottfs_dir}/free/[a-z][a-z]-[a-z][a-z].txt)))

### Term "gratis software"
trans_term_gratis := \
$(notdir $(basename $(wildcard ${tottfs_dir}/gratis/[a-z][a-z].txt))) \
$(notdir $(basename $(wildcard ${tottfs_dir}/gratis/[a-z][a-z]-[a-z][a-z].txt)))





################################
# TeX auxiliary files suffixes #
################################

TeX_aux_texi_suffixes = aux cp cps fn ky log pg rg toc tp vr dvi





###################
# Null redirector #
###################

ifneq (${AM_V_at},)
NULL = > /dev/null
endif
