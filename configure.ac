dnl
dnl configure.ac -- Process this file with autoconf to produce a
dnl                 configure script.
dnl
dnl Copyright (C) 2013, 2014 Bruno Félix Rezende Ribeiro <oitofelix@gnu.org>
dnl
dnl This program is free software: you can redistribute it and/or modify
dnl it under the terms of the GNU General Public License as published by
dnl the Free Software Foundation, either version 3 of the License, or
dnl (at your option) any later version.
dnl
dnl This program is distributed in the hope that it will be useful,
dnl but WITHOUT ANY WARRANTY; without even the implied warranty of
dnl MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
dnl GNU General Public License for more details.
dnl
dnl You should have received a copy of the GNU General Public License
dnl along with this program.  If not, see <http://www.gnu.org/licenses/>.
dnl

##################
# Initialization #
##################

# GNU Autoconf settings;
AC_INIT([GNU philosophy], [0.1.20140214],
[https://savannah.gnu.org/bugs/?group=philosophy], [philosophy],
[https://www.gnu.org/software/philosophy/])
AC_CONFIG_AUX_DIR([build-aux])
AC_PREREQ(2.60)
AC_CONFIG_SRCDIR([src/philosophy.texi])

### Primaries
m4_set_add_all([PRIMARIES], [all], [all-install], [all-uninstall], [all-clean])

### Aggregate types
m4_set_add_all([AGGREGATES], [collection], [standalone])

### Output formats
m4_set_add_all([FORMATS],
  [info], [html], [pdf], [ps], [dvi], [txt], [dbk], [xml])

### Translation languages
m4_set_add_all([LANGUAGES],
  [en])

# GNU Automake settings;
AM_INIT_AUTOMAKE([-Wall -Wno-portability -Wno-override tar-pax foreign])
AM_SILENT_RULES([yes])
AM_EXTRA_RECURSIVE_TARGETS(

dnl PRIMARY-AGGREGATE-FORMAT-LANGUAGE goals;
m4_set_foreach([PRIMARIES], [PRIMARY],
  [m4_set_foreach([AGGREGATES], [AGGREGATE],
    [m4_set_foreach([FORMATS], [FORMAT],
      [m4_set_foreach([LANGUAGES], [LANGUAGE],
	[
	 PRIMARY-AGGREGATE-FORMAT-LANGUAGE])])])])

dnl PRIMARY-AGGREGATE-FORMAT goals;
m4_set_foreach([PRIMARIES], [PRIMARY],
  [m4_set_foreach([AGGREGATES], [AGGREGATE],
    [m4_set_foreach([FORMATS], [FORMAT],
      [
       PRIMARY-AGGREGATE-FORMAT])])])

dnl PRIMARY-AGGREGATE-LANGUAGE goals;
m4_set_foreach([PRIMARIES], [PRIMARY],
  [m4_set_foreach([AGGREGATES], [AGGREGATE],
    [m4_set_foreach([LANGUAGES], [LANGUAGE],
      [
       PRIMARY-AGGREGATE-LANGUAGE])])])

dnl PRIMARY-FORMAT-LANGUAGE goals;
m4_set_foreach([PRIMARIES], [PRIMARY],
  [m4_set_foreach([FORMATS], [FORMAT],
    [m4_set_foreach([LANGUAGES], [LANGUAGE],
      [
       PRIMARY-FORMAT-LANGUAGE])])])

dnl PRIMARY-AGGREGATE goals;
m4_set_foreach([PRIMARIES], [PRIMARY],
  [m4_set_foreach([AGGREGATES], [AGGREGATE],
    [
     PRIMARY-AGGREGATE])])

dnl PRIMARY-FORMAT goals;
m4_set_foreach([PRIMARIES], [PRIMARY],
  [m4_set_foreach([FORMATS], [FORMAT],
    [
     PRIMARY-FORMAT])])

dnl PRIMARY-LANGUAGE goals;
m4_set_foreach([PRIMARIES], [PRIMARY],
  [m4_set_foreach([LANGUAGES], [LANGUAGE],
    [
     PRIMARY-LANGUAGE])])

dnl PRIMARY-LANGUAGE goals for web-pages;
m4_foreach([PRIMARY], [[www-gnu], [homepage]],
  [m4_set_foreach([LANGUAGES], [LANGUAGE],
    [
     PRIMARY-LANGUAGE])])

dnl Remaining goals;
[all-install all-uninstall all-clean]
[www-gnu homepage])

# Decide whether you are configuring from CVS.
AS_IF([[test -d "$srcdir"/CVS]], [[CVS=y]], [[CVS=n]])





################################
# Programs Search and Checking #
################################

# Check for 'mkdir'.
AC_PROG_MKDIR_P

# Check for 'ln'.
AC_PROG_LN_S

# Check for 'grep'.
AC_PROG_GREP

# Check for 'sed'.
AC_PROG_SED


###########
### Check for GNU Texinfo program 'makeinfo'.
#######

### Define GNU Texinfo minimal version.
m4_define([TEXINFO_MINVER], 5.1)

### Declare 'MAKEINFO' as a precious variable.
AC_ARG_VAR([MAKEINFO], [Texinfo 'makeinfo' program])

### Check for 'makeinfo'.
AC_PATH_PROG([MAKEINFO], [makeinfo])

### If 'makeinfo' was not found, print an error message and
### abort.
AS_IF([[test x$MAKEINFO = x]],
  AC_MSG_ERROR(
[[GNU Texinfo not found.  It is required at least version ]]TEXINFO_MINVER.
[[You can find it at https://gnu.org/software/texinfo/.]]))

### If 'makeinfo' was found, test whether its version is at least
### TEXINFO_MINVER.
AS_IF([[test x$MAKEINFO != x]],
  # Put 'makeinfo' version in variable 'texinfo_version'.
  [[texinfo_version=`$MAKEINFO --version |
      $SED -n 's/^makeinfo.* \(@<:@@<:@:digit:@:>@.@:>@*\)$/\1/p'`]]

  # If 'makeinfo' version is less than TEXINFO_MINVER, print an error
  # message and abort.
  AS_VERSION_COMPARE([[$texinfo_version]], TEXINFO_MINVER,
    AC_MSG_ERROR(
[[GNU Texinfo is too old.  It is required at least version ]]TEXINFO_MINVER.
[[You can find it at https://gnu.org/software/texinfo/.]])))


##########
### Check for ImageMagick program 'convert'.
#####

### Check for 'convert'.
AC_PATH_PROG([CONVERT], [convert])

### Declare 'CONVERT' as a precious variable.
AC_ARG_VAR([CONVERT], [ImageMagick 'convert' program])

### If 'convert' was not found, print a warning message.
AS_IF([[test x$CONVERT = x]],
  AC_MSG_WARN(
[[ImageMagick 'convert' program  not found.
It will not be possible to regenerate figures.
Therefore, do not invoke 'make maintainer-clean'.
You can obtain ImageMagick at http://www.imagemagick.org/.]]))


##########
### Check for po4a program 'po4a'.
#######

### Define po4a minimal version.
m4_define([PO4A_MINVER], 0.45)

### Declare 'PO4A' as a precious variable.
AC_ARG_VAR([PO4A], [po4a 'po4a' program])

### Check for 'po4a'.
AC_PATH_PROG([PO4A], [po4a])

### Declare 'PO4A' as a precious variable.
AC_ARG_VAR([PO4A_GETTEXTIZE], [po4a 'po4a-gettextize' program])

### Check for 'po4a-gettextize'.
AC_PATH_PROG([PO4A_GETTEXTIZE], [po4a-gettextize])

### If 'po4a' was not found, print an error message and
### abort.
AS_IF([[test x$PO4A = x]],
  AC_MSG_ERROR(
[[po4a not found.  It is required at least version ]]PO4A_MINVER.
[[You can find it at http://po4a.alioth.debian.org/.]]))

### If 'po4a' was found, test whether its version is at least
### PO4A_MINVER.
AS_IF([[test x$PO4A != x]],
  # Put 'po4a' version in variable 'po4a_version'.
  [[po4a_version=`$PO4A --version |
      $SED -n 's/^po4a.* \(@<:@@<:@:digit:@:>@.@:>@*\)$/\1/p'`]]

  # If 'po4a' version is less than PO4A_MINVER, print an error
  # message and abort.
  AS_VERSION_COMPARE([[$po4a_version]], PO4A_MINVER,
    AC_MSG_ERROR(
[[po4a is too old.  It is required at least version ]]PO4A_MINVER.
[[You can find it at http://po4a.alioth.debian.org/.]])))




#####################
# Option Processing #
#####################

##################
######## Font options definition and check of availability;
##################

### Define the option '--with-font' which allow the user to select a
### font by name, file-name or pass the argument 'list' to see the
### available font names.
AC_ARG_WITH(font,
  AS_HELP_STRING([--with-font@<:@=FONT-NAME|FONT_FILE|list@:>@],
   [Font name or file-name to use for the multilingual essay
   'Translations of the Term "Free Software"'.
   Pass the argument 'list' to list all available font names.
  @<:@default=unifont@:>@]),
  # If the argument to the option is 'list', list all available font
  # names and quit.
  AS_IF([test x$withval = xlist],
    AS_ECHO("")
    AS_BOX([[Available Fonts]])
    AS_ECHO("")
    [[$CONVERT -list font | $SED -n 's/.*Font: *\(.*\)/\1/p']]
    AS_EXIT(0)),
  # If the option was not specified, use GNU Unifont by default.
  [with_font=unifont])


# Print a message indicating the check for font availability.
AC_MSG_CHECKING([Checking font availability])

# Check if the provided, or selected by default, font is available.
AS_IF([! ($CONVERT -list font | $SED -n 's/.*Font: *\(.*\)/\1/p' |
 $GREP "^$with_font$" > /dev/null || test -f "$with_font")],
   # If not, print an error message and abort.
   AC_MSG_RESULT([none])
   AC_MSG_WARN(
[Font $with_font not found.
It will not be possible to regenerate the rendered scripts of
the essay "Translations of the Term ''Free Software''".
You can check the list of available fonts with
'./configure --with-font=list'.
The recommended font is GNU Unifont.
You can obtain it from: https://gnu.org/software/unifont/.]),
   # Otherwise, print the font name or file-name accordingly.
   AC_MSG_RESULT([$with_font]))

# Make the information about which font was selected available to
# make-files.
AS_VAR_SET_IF([with_font],
  [AC_SUBST([FONT], ["-font $with_font"])],
  [AC_SUBST([FONT], [""])])





################
# Output Files #
################

AC_CONFIG_FILES(
[Makefile
 src/Makefile
 src/philosophy-figures/Makefile
 src/philosophy-figures/tottfs/Makefile
 src/philosophy-figures/tottfs/free/Makefile
 src/philosophy-figures/tottfs/gratis/Makefile]
[src/collection/Makefile]
m4_set_foreach([FORMATS], [FORMAT], [
  src/collection/FORMAT/Makefile])
[src/standalone/Makefile]
m4_set_foreach([FORMATS], [FORMAT], [
  src/standalone/FORMAT/Makefile])
[src/www/Makefile
 src/help/Makefile
 src/release/Makefile
 src/essays/Makefile
 pot/Makefile
 pot/release/Makefile
 pot/essays/Makefile
 po/Makefile])

AC_OUTPUT





##################################
# Configuration Settings Summary #
##################################

AS_ECHO("")
AS_ECHO("Type 'make help' for help on 'make' targets.")
