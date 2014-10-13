gsettings_SCHEMAS = eu.polonkai.gergely.gnome-gitlab.gschema.xml

@INTLTOOL_XML_RULE@
@GSETTINGS_RULES@

EXTRA_DIST = \
	eu.polonkai.gergely.gnome-gitlab.gschema.xml.in.in

DISTCLEANFILES = \
	$(gsettings_SCHEMAS)

MAINTAINERCLEANFILES = \
	$(gsettings_SCHEMAS:.xml=.valid)
