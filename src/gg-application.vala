namespace GnomeGitlab
{
    public class Application : Gtk.Application
    {
        const OptionEntry[] option_entries = {
            { "version", 'v', 0, OptionArg.NONE, null, N_("Print version information and exit"), null },
            { null }
        };

        const GLib.ActionEntry[] action_entries = {
            { "preferences", on_preferences_activate },
            { "quit", on_quit_activate }
        };

        private Window window;

        private void ensure_window ()
        {
            if (window == null) {
                window = new Window (this);
                window.destroy.connect (() => {
                    window = null;
                });
            }
        }

        public Application ()
        {
            Object (application_id: "eu.polonkai.gergely.gnome-gitlab");

            add_main_option_entries (option_entries);
            add_action_entries (action_entries, this);
        }

        protected override void activate ()
        {
            ensure_window ();
            window.present ();
        }

        protected override void startup ()
        {
            base.startup ();

            add_accelerator ("<Primary>n", "win.new", null);
        }

        protected override int handle_local_options (GLib.VariantDict options)
        {
            if (options.contains("version")) {
                print ("%s %s\n", Environment.get_application_name (), Config.VERSION);

                return 0;
            }

            return -1;
        }

        void on_quit_activate ()
        {
            quit ();
        }

        void on_preferences_activate ()
        {
            Preferences.show ((Window)get_active_window ());

            return;
        }
    }
}
