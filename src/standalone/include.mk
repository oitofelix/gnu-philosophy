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
# Standalone recipes #
######################

%.html : makeinfo := ${makeinfohtml}

##########
### Standalone rules
######

# 1 : make primary
# 2 : standalone format

standalone_rules = \
${1}-standalone-${2}-en \
${1}-standalone-${2} \
${1}-standalone-en \
${1}-${2}-en \
${1}-standalone \
${1}-${2} \
${1}-en \
${1}


##########
### Standalone recipes
######

# 1 : standalone format
# 2 : makeinfo format switch

define standalone_recipes

$$(call standalone_rules,all,${1}) : $${essays:=.${1}}
%.${1} : $${top_srcdir}/src/essays/%.texi $${essay_header} | figures_dep
	$${AM_V_GEN}
	$${AM_V_at} echo '\input texinfo' > $$(notdir $$<).tmp
	$${AM_V_at} cat $$< >> $$(notdir $$<).tmp
	$${AM_V_at} echo @bye >> $$(notdir $$<).tmp
	$${AM_V_at} $${makeinfo} --${2} --output=$$@ $$(notdir $$<).tmp $${NULL};
	$${AM_V_at} rm -rf $$(notdir $$<).tmp

$$(call standalone_rules,all-install,${1}) : all-install-standalone-${1}-en-local
all-install-standalone-${1}-en-local : all-standalone-${1}-en
	$${NORMAL_INSTALL}  # Normal commands follow.
	$${AM_V_at} $${MKDIR_P} $${DESTDIR}$${standalone_${1}dir}
	$${AM_V_at} $${INSTALL_DATA} $${essays:=.${1}} $${DESTDIR}$${standalone_${1}dir}
# $${POST_INSTALL}    # Post-install commands follow.
# $${AM_V_at} if test ${1}x == infox; \
#   then for f in $${essays:=.${1}}; \
#     do install-info \
#       --dir-file="$${DESTDIR}$${standalone_${1}dir}/dir" \
#       "$${DESTDIR}$${standalone_${1}dir}/$$$$f"; done; fi;

$$(call standalone_rules,all-uninstall,${1}) : all-uninstall-standalone-${1}-en-local
all-uninstall-standalone-${1}-en-local :
# $(PRE_UNINSTALL)     # Pre-uninstall commands follow.
# $${AM_V_at} if test ${1}x == infox; then install-info --delete \
#   --dir-file="$${DESTDIR}$${standalone_${1}dir}/dir" \
#   "$${DESTDIR}$${standalone_${1}dir}/philosophy.info"; fi
	$${NORMAL_UNINSTALL}  # Normal commands follow.
	-$${AM_V_at} rm -rf $${DESTDIR}$${standalone_${1}dir}

mostlyclean : all-clean-standalone-${1}-en-local
$$(call standalone_rules,all-clean,${1}) : all-clean-standalone-${1}-en-local
all-clean-standalone-${1}-en-local :
	-$${AM_V_at} rm -rf $${essays:=.${1}}

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

$(call standalone_rules,all-clean,pdf) : TeX-aux-clean
$(call standalone_rules,all-clean,ps) : TeX-aux-clean
$(call standalone_rules,all-clean,dvi) : TeX-aux-clean

TeX-aux-clean :
	${AM_V_at} for f in ${essays:=.texi}; \
	  do for s in ${TeX_aux_texi_suffixes}; do \
	    if test -f $$f.$$s; then rm $$f.$$s; fi; done; done;





#######################
# Compatibility rules #
#######################

mostlyclean clean distclean maintainer-clean : all-clean
