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

EXTRA_DIST = include.mk





##################################
# GNU website philosophy section #
##################################

# Directory to put the GNU website pages into
www_dir = www-gnu
www_header = ${top_srcdir}/src/www/header.shtml
www_footer = ${top_srcdir}/src/www/footer.texi

www-gnu-local www-gnu-en-local : ${essays:%=${www_dir}/%.html}

${www_dir}/%.html : ${top_srcdir}/src/essays/%.texi ${essay_header}
	${AM_V_GEN}
	${AM_V_at} test -d ${www_dir} || mkdir -p ${www_dir}
	${AM_V_at} cat $< ${www_footer} > ${www_dir}/$(notdir $<).tmp
	${AM_V_at} ${makeinfohtml} --output=$@ ${www_dir}/$(notdir $<).tmp
	${AM_V_at} rm -f ${www_dir}/$(notdir $<).tmp
	${AM_V_at} ${SED} --in-place \
	  '/^<!DOCTYPE/,/^<\/head>$$/d;/^<div class="header">$$/,/^<\/div>$$/d;/^<body/d' $@
	${AM_V_at} cat ${www_header} $@ > $@-2 && mv $@-2 $@

mostlyclean-local ::
	-${AM_V_at} rm -rf ${www_dir}





###################################
# GNU philosophy package homepage #
###################################

# Directory to put the homepage into
homepage_dir = homepage

homepage-local homepage-en-local : ${release_doc:%=${homepage_dir}/%.html}

${homepage_dir}/%.html : ${top_srcdir}/src/release/%.texi homepage-collection ${release_texi}
	${AM_V_GEN}
	${AM_V_at} test -d ${homepage_dir} || mkdir -p ${homepage_dir}
	${AM_V_at} ${makeinfohtml} -D homepage --output=$@ $<
	${AM_V_at} ${SED} --in-place \
	  '/^<!DOCTYPE/,/^<\/head>$$/d;/^<div class="header">$$/,/^<\/div>$$/d;/^<body/d' $@
	${AM_V_at} cat ${www_header} $@ > $@-2 && mv $@-2 $@

mostlyclean-local ::
	-${AM_V_at} rm -rf ${homepage_dir}


###########
### Homepage collection
#######

manual_title = "<strong>GNU philosophy</strong> - <em>Essays on Free Software</em>"

### Gendocs settings

# Script executable
gendocs = ${abs_top_srcdir}/build-aux/gendocs.sh

# Environment variables
gendocs_envvars = TEXINPUTS="${abs_top_srcdir}/build-aux:$$TEXINPUTS"	\
  GENDOCS_TEMPLATE_DIR=${abs_top_srcdir}/src/www

# Arguments
gendocs_args = ${texinfo_includes} --email ${PACKAGE_BUGREPORT} \
  -s ${abs_top_srcdir}/src/${PACKAGE}.texi ${PACKAGE} ${manual_title}

homepage-collection :
	${AM_V_GEN}
	${AM_V_at} rm -rf ${homepage_dir}/manual
	${AM_V_at} ${MKDIR_P} ${homepage_dir}
	${AM_V_at} cd ${homepage_dir} && \
	  env ${gendocs_envvars} ${gendocs} ${gendocs_args} ${NULL};
	${AM_V_at} rm -f ${homepage_dir}/${PACKAGE_TARNAME}.*

.PHONY : homepage-collection
