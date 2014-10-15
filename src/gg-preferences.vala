namespace GnomeGitlab
{
    [GtkTemplate (ui = "/eu/polonkai/gergely/gnome-gitlab/ui/gg-preferences.ui")]

    public class Preferences : Gtk.Dialog
    {
        private static GLib.Once<Preferences> instance;

        private Preferences () {
            response.connect (() => {
                hide ();
            });
        }

        public static void show (Window parent)
        {
            Preferences inst;

            inst = instance.once (() => { return new Preferences (); });

            if (parent != inst.get_transient_for ()) {
                inst.set_transient_for (parent);
            }

            inst.present ();
        }
    }
}
