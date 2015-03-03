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

SUBDIRS = tottfs
EXTRA_DIST = include.mk \
$(call figure_dist,categories-of-free-and-nonfree-software-diagram,svg) \
$(call figure_dist,a-note-on-software-diagram,pdf) \
$(call figure_dist,the-free-software-song-score,pdf)

CLEANFILES = ${figures:=.eps}
MAINTAINERCLEANFILES= ${figures:=.png}





#######################################
# Figures variables for ../include.mk #
#######################################

figures = ${top_level_figures}

figures_subdir =

figure_dist = $(foreach f,${2} png txt,${1}.${f})





#######################
# Recipes for figures #
#######################

figure_targets = $(foreach ext,png eps,${1}.${ext})

$(call figure_targets, categories-of-free-and-nonfree-software-diagram) :	\
  categories-of-free-and-nonfree-software-diagram.svg
	${AM_V_GEN}
	${AM_V_at} ${CONVERT} $< $@

$(call figure_targets, a-note-on-software-diagram) : a-note-on-software-diagram.pdf
	${AM_V_GEN}
	${AM_V_at} ${CONVERT} $< $@

$(call figure_targets, the-free-software-song-score) : the-free-software-song-score.pdf
	${AM_V_GEN}
	${AM_V_at} ${CONVERT} $< $@
