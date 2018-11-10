
cd /usr/share/gnome-shell;

if ! [[ -h gnome-shell-theme.gresource ]];
	then sudo mv gnome-shell-theme.gresource gnome-shell-theme.gresource.original;
fi;

sudo ln -frs /usr/share/themes/Adapta-Nokto/gnome-shell/gnome-shell-theme.gresource gnome-shell-theme.gresource;

