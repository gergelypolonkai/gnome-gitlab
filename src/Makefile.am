res_dir = $(srcdir)/resources
res_src = $(res_dir)/gnome-gitlab.gresource.xml
resource_files = $(shell $(GLIB_COMPILE_RESOURCES) --generate-dependencies --sourcedir=$(res_dir) $(res_src))

AM_CPPFLAGS = \
	-DGETTEXT_PACKAGE=\""$(GETTEXT_PACKAGE)"\" \
	-DGNOMELOCALEDIR=\""$(localedir)"\"

AM_VALAFLAGS = \
	--target-glib=2.38 \
	--pkg gtk+-3.0 \
	--gresources $(res_src)

bin_PROGRAMS = gnome-gitlab
BUILT_SOURCES = \
	gg-resources.c

gg-resources.c: $(res_src) $(resource_files)
	$(AM_V_GEN) $(GLIB_COMPILE_RESOURCES) --target=$@ --sourcedir=$(srcdir)/resources --generate-source $<

VALA_SOURCES = \
	gg-application.vala \
	gg-window.vala \
	gg-main.vala

gnome_gitlab_SOURCES = \
	$(BUILT_SOURCES) \
	$(VALA_SOURCES) \
	$(srcdir)/config.vapi

AM_CFLAGS = \
	$(GITLAB_CFLAGS) \
	-Wall

gnome_gitlab_LDADD = \
	$(GITLAB_LIBS) \
	-lm
