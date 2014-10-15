int
main (string[] args)
{
    Intl.bindtextdomain (Config.GETTEXT_PACKAGE, Config.GNOMELOCALEDIR);
    Intl.bind_textdomain_codeset (Config.GETTEXT_PACKAGE, "UTF-8");

    var app = new GnomeGitlab.Application ();
    return app.run (args);
}
