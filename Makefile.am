# -*- Makefile -*-

ACLOCAL_AMFLAGS = -I build-aux
CONFIG_FILENAME = libalternatives.conf
AM_CPPFLAGS = -DETC_PATH=\"${sysconfdir}\" -DCONFIG_DIR=ETC_PATH -DCONFIG_FILENAME=\"${CONFIG_FILENAME}\"
AM_CFLAGS = ${our_CFLAGS}

lib_LTLIBRARIES = libalternatives.la
libalternatives_la_SOURCES = src/config_parser.c src/libalternatives.c src/libalternatives.h src/options_parser.c src/parser.h
libalternatives_la_LDFLAGS = -version-number 1:2 -Wl,--version-script=${srcdir}/src/libalternatives.version
EXTRA_libalternatives_la_DEPENDENCIES = src/libalternatives.version

bin_PROGRAMS = alts
alts_SOURCES = utils/alternatives.c utils/group_consistency_rules.c utils/list_binaries.c utils/utils.h
alts_LDADD = libalternatives.la

include_HEADERS = src/libalternatives.h
man_MANS = doc/alts.1
pkgconfig_DATA = cmake/libalternatives.pc

check_PROGRAMS = atest argv_replaced_helper
atest_CPPFLAGS = ${AM_CPPFLAGS} -UETC_PATH -DETC_PATH=\"${top_abs_srcdir}/test\" -UCONFIG_DIR -DCONFIG_DIR=\"${top_abs_srcdir}/test/test_defaults\" -DUNITTESTS=1
atest_SOURCES = ${alts_SOURCES} ${libalternatives_la_SOURCES} test/alternatives_tests.c test/config_parser_tests.c test/options_parser_tests.c test/test.c
atest_LDADD = ${cunit_LIBS}
argv_replaced_helper_SOURCES = test/argv_replaced_helper.c
TESTS = atest
