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

include ${top_srcdir}/src/include.mk

# --- Input Variables ---
#
# figures
# figures_subdir





############################
# Figures recipes template #
############################

##########
### Figures rules
######

# 1 : primary
# 2 : 'collection' or 'standalone'
# 3 : aggregate format

figures_rules = \
${1}-${2}-${3}-en \
${1}-${2}-${3} \
${1}-${2}-en \
${1}-${3}-en \
${1}-${2} \
${1}-${3} \
${1}-en \
${1}


##########
### Figures recipes
######

# 1 : 'collection' or 'standalone'
# 2 : aggregate format
# 3 : figures format

define figures_recipes

$$(call figures_rules,all,${1},${2}) : $$(foreach f,${3},$${figures:=.$$f})

$$(call figures_rules,all-install,${1},${2}) : all-install-${1}-${2}-en-local
all-install-${1}-${2}-en-local : all-${1}-${2}-en
	$${MKDIR_P} $${DESTDIR}$${${1}_${2}dir}/$${PACKAGE_TARNAME}-figures/$${figures_subdir}
	$${AM_V_at} for f in $$(foreach f,${3},$${figures:=.$$f}); \
	  do if test -f $${srcdir}/$$$$f; \
	    then $${INSTALL_DATA} $${srcdir}/$$$$f \
	      $${DESTDIR}$${${1}_${2}dir}/$${PACKAGE_TARNAME}-figures/$${figures_subdir}; \
	    else $${INSTALL_DATA} $$$$f \
	      $${DESTDIR}$${${1}_${2}dir}/$${PACKAGE_TARNAME}-figures/$${figures_subdir}; \
	fi; done;

$$(call figures_rules,all-uninstall,${1},${2}) : all-uninstall-${1}-${2}-en-local
all-uninstall-${1}-${2}-en-local :
	-$${AM_V_at} rm -rf \
	  $${DESTDIR}$${${1}_${2}dir}/$${PACKAGE_TARNAME}-figures/$${figures_subdir}

$$(call figures_rules,all-clean,${1},${2}) : all-clean-${1}-${2}-en-local
all-clean-${1}-${2}-en-local :
	-$${AM_V_at} rm -rf $$(foreach f,${3},$${figures:=.$$f})

endef





#########################################
# Collections: Info, HTML, PDF, DVI, PS #
#########################################

### Info
$(eval $(call figures_recipes,collection,info,png))

### HTML
$(eval $(call figures_recipes,collection,html,png))

### PDF
$(call figures_rules,all,collection,pdf) : ${figures:=.png}

### DVI
$(call figures_rules,all,collection,dvi) : ${figures:=.eps}

### PS
$(call figures_rules,all,collection,ps) : ${figures:=.eps}

### Plain text
$(call figures_rules,all,collection,txt) : ${figures:=.txt}

### Docbook
$(eval $(call figures_recipes,collection,dbk,png))

### Texinfo XML
$(eval $(call figures_recipes,collection,xml,png txt eps))





##########################################################################
# Standalone: Info, HTML, PDF, DVI, PS, plain text, Docbook, Texinfo XML #
##########################################################################

### Info
$(eval $(call figures_recipes,standalone,info,png))

### HTML
$(eval $(call figures_recipes,standalone,html,png))

### PDF
$(call figures_rules,all,standalone,pdf) : ${figures:=.png}

### DVI
$(call figures_rules,all,standalone,dvi) : ${figures:=.eps}

### PS
$(call figures_rules,all,standalone,ps) : ${figures:=.eps}

### Plain text
$(call figures_rules,all,standalone,txt) : ${figures:=.txt}

### Docbook
$(eval $(call figures_recipes,standalone,dbk,png))

### Texinfo XML
$(eval $(call figures_recipes,standalone,xml,png txt eps))





#######################
# Compatibility rules #
#######################

distdir : ${figures:=.png} ${figures:=.eps}
# mostlyclean clean distclean maintainer-clean : all-clean
