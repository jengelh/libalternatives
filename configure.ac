AC_INIT([libalternatives], [1.2])
AC_CONFIG_AUX_DIR([build-aux])
AC_CONFIG_MACRO_DIR([build-aux])
AC_PROG_INSTALL
AM_INIT_AUTOMAKE([-Wall -Wno-override foreign subdir-objects
	tar-pax no-dist-gzip dist-xz])
AC_PROG_CC
AM_PROG_CC_C_O
m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])
m4_ifdef([AM_PROG_AR], [AM_PROG_AR])
AC_DISABLE_STATIC
LT_INIT
PKG_PREREQ([0.27])
PKG_INSTALLDIR
PKG_CHECK_MODULES([cunit], [cunit])

our_CFLAGS="-Wall -Wextra -Wpedantic -fvisibility=hidden -std=gnu99"
AC_ARG_ENABLE([coverage], [AS_HELP_STRING([--enable-coverage], [Add coverage flags])],
	[our_CFLAGS="$our_CFLAGS -g -fprofile-arcs -ftest-coverage"])
AC_SUBST([our_CFLAGS])

AC_CONFIG_FILES([Makefile cmake/libalternatives.pc])
AC_OUTPUT
