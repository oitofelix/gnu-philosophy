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





######################
# Collection recipes #
######################

##########
### Collection rules
######

# 1 : make primary
# 2 : collection format

collection_rules = \
${1}-collection-${2}-en \
${1}-collection-${2} \
${1}-collection-en \
${1}-${2}-en \
${1}-collection \
${1}-${2} \
${1}-en \
${1}


##########
### Collection recipes
######

# 1 : collection format
# 2 : makeinfo format switch

define collection_recipes

$$(call collection_rules,all,${1}) : philosophy.${1}
philosophy.${1} : ${top_srcdir}/src/philosophy.texi \
  $$(addprefix ${top_srcdir}/src/essays/,$${essays:=.texi})	\
  $$(addprefix ${top_srcdir}/src/release/,$${release_doc:=.texi}) \
  $${release_texi}	\
  $${essay_header} \
  | figures_dep
	$${AM_V_GEN}
	$${AM_V_at} $${makeinfo} --${2} --output=$$@ $$< $${NULL};

$$(call collection_rules,all-install,${1}) : all-install-collection-${1}-en-local
all-install-collection-${1}-en-local : all-collection-${1}-en
	$${NORMAL_INSTALL}  # Normal commands follow.
	$${AM_V_at} $${MKDIR_P} $${DESTDIR}$${collection_${1}dir}
	$${AM_V_at} $${INSTALL_DATA} philosophy.${1} $${DESTDIR}$${collection_${1}dir}
	$${POST_INSTALL}    # Post-install commands follow.
	$${AM_V_at} if test ${1}x == infox; then \
	  $${MKDIR_P} $${DESTDIR}$${infodir}; \
	  $${LN_S} "$${DESTDIR}$${collection_${1}dir}/philosophy.info"* \
	    $${DESTDIR}$${infodir}; \
	  $${LN_S} "$${DESTDIR}$${collection_${1}dir}/philosophy-figures" \
	    $${DESTDIR}$${infodir}; \
	  install-info --dir-file="$${DESTDIR}$${infodir}/dir" \
	  "$${DESTDIR}$${infodir}/philosophy.info"; fi

$$(call collection_rules,all-uninstall,${1}) : all-uninstall-collection-${1}-en-local
all-uninstall-collection-${1}-en-local :
	$${PRE_UNINSTALL}     # Pre-uninstall commands follow.
	$${AM_V_at} if test ${1}x == infox; then install-info --delete \
	   --dir-file="$${DESTDIR}$${infodir}/dir" \
	   "$${DESTDIR}$${infodir}/philosophy.info"; \
	   rm -f "$${DESTDIR}$${infodir}/philosophy.info"*; \
	   rm -f "$${DESTDIR}$${infodir}/philosophy-figures"; \
         fi
	$${NORMAL_UNINSTALL}  # Normal commands follow.
	$${AM_V_at} rm -rf $${DESTDIR}$${collection_${1}dir}

mostlyclean : all-clean-collection-${1}-en-local
$$(call collection_rules,all-clean,${1}) : all-clean-collection-${1}-en-local
all-clean-collection-${1}-en-local :
	-$${AM_V_at} rm -rf philosophy.${1}

endef





########################
# Figures dependencies #
########################

figures_dep :
	${AM_V_at} $(MAKE) $(AM_MAKEFLAGS) \
	  -C ${top_builddir}/src/philosophy-figures

.PHONY : figures_dep





################################
# TeX auxiliary files cleaning #
################################

$(call collection_rules,all-clean,pdf) : TeX-aux-clean
$(call collection_rules,all-clean,ps) : TeX-aux-clean
$(call collection_rules,all-clean,dvi) : TeX-aux-clean

TeX-aux-clean :
	${AM_V_at} for s in ${TeX_aux_texi_suffixes}; do \
	    if test -f philosophy.$$s; then rm philosophy.$$s; fi; \
	  done;





#######################
# Compatibility rules #
#######################

mostlyclean clean distclean maintainer-clean : all-clean
