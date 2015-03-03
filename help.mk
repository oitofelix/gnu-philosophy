#
# help.mk -- Help targets;
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





#######################
# Help topic template #
#######################

# 1 : topic

define help_topic
${1} : $${top_builddir}/src/help/make-${1}.txt
	@cat $${top_builddir}/src/help/make-${1}.txt

$${top_builddir}/src/help/make-${1}.txt : \
  $${top_srcdir}/src/help/make-${1}.texi
	$${AM_V_GEN}
	$${AM_V_at} $${MAKEINFO} -D help \
	  -I $${top_srcdir}/src \
	  --plaintext --output=$$@ $$<

.PHONY : ${1}
endef





#########################
# Help topics instances #
#########################

$(eval $(call help_topic,help))
$(eval $(call help_topic,help-suffixes))
$(eval $(call help_topic,help-build))
$(eval $(call help_topic,help-install))
$(eval $(call help_topic,help-clean))
$(eval $(call help_topic,help-dist))
