AC_INIT([gnome-gitlab], [0.1], [gergely@polonkai.eu], [gnome-gitlab])
AC_CONFIG_HEADERS([config.h])
AM_INIT_AUTOMAKE([-Wall foreign])
AM_SILENT_RULES([no])
AC_CONFIG_MACRO_DIR([m4])
AC_CONFIG_SRCDIR([src/main.vala])
IT_PROG_INTLTOOL(0.40)
AM_GNU_GETTEXT([external])
AM_GNU_GETTEXT_VERSION([0.17])
GETTEXT_PACKAGE=AC_PACKAGE_NAME
AC_SUBST([GETTEXT_PACKAGE])
AC_DEFINE_UNQUOTED(GETTEXT_PACKAGE, "$GETTEXT_PACKAGE", [The name of the gettext domain])

AC_PROG_CC
AC_PROG_CC_STDC
AC_PROG_INSTALL
AC_PROG_MAKE_SET
AM_PROG_VALAC([0.23.3])

AC_PATH_PROG([GLIB_COMPILE_RESOURCES], glib-compile-resources)

GLIB_GSETTINGS

LT_INIT([disable-static])

PKG_PROG_PKG_CONFIG([0.22])

PKG_CHECK_MODULES(GITLAB, [
    glib-2.0 >= 2.39,
    gtk+-3.0 >= 3.0
])

YELP_HELP_INIT

AC_CONFIG_FILES([
    Makefile
    src/Makefile
    po/Makefile.in
])

AC_OUTPUT

echo "
    gnome-gitlab ${VERSION}

    prefix:        ${prefix}
    Vala compiler: ${VALAC}
    C compiler:    ${CC}

    Now type 'make' to build ${PACKAGE}
"
