namespace GnomeGitlab
{
    [GtkTemplate (ui = "/eu/polonkai/gergely/gnome-gitlab/ui/gg-window.ui")]

    public class Window : Gtk.ApplicationWindow
    {
        private const GLib.ActionEntry[] action_entries = {
            { "help", on_help_activate },
            { "about", on_about_activate },
        };

        [GtkChild]
        private Gtk.HeaderBar header_bar;

        private GLib.Settings settings;

        public Window (Application app)
        {
            Object (application: app);

            add_action_entries (action_entries, this);

            settings = new Settings ("eu.polonkai.gergely.gnome-gitlab.state.window");
            settings.delay ();

            destroy.connect (() => {
                settings.apply ();
            });

            Gdk.WindowState window_state = (Gdk.WindowState)settings.get_int ("state");

            if (Gdk.WindowState.MAXIMIZED in window_state) {
                maximize ();
            }

            int width, height;

            settings.get ("size", "(ii)", out width, out height);
            resize (width, height);

            show_all ();
        }

        private void on_help_activate ()
        {
            try {
                Gtk.show_uri (get_screen (), "help:gnome-gitlab", Gtk.get_current_event_time ());
            } catch (Error e) {
                warning (_("Failed to show help: %s"), e.message);
            }
        }

        private void on_about_activate ()
        {
            const string copyright = "Copyright \xc2\xa9 2014 Gergely Polonkai\n";

            const string authors[] = {
                "Gergely Polonkai",
                null
            };

            Gtk.show_about_dialog (this,
                                   "program-name", _("Gnome Gitlab"),
                                   "logo-icon-name", "gnome-gitlab",
                                   "version", Config.VERSION,
                                   "comments", _("GitLab frontend"),
                                   "copyright", copyright,
                                   "authors", authors,
                                   "license-type", Gtk.License.GPL_3_0,
                                   "wrap-license", false,
                                   "translator-credits", _("translator-credits"),
                                   null);
        }
    }
}
