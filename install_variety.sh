	echo "Variety is a wallpaper manager for Linux systems. It supports out-of-the-box
most Linux desktop environments, and can be configured to work on more esoteric ones.
It can use local images or automatically download wallpapers from Flickr, Wallhaven,
Unsplash, Bing, Reddit and other online sources.

How I use variety?
I set it to fetch wallpapers locally from whatever directory is my favorite at
the time.
Further I have a keybinding setup to pull up a banner of all the wallpapers in that directory,
that allows me to choose one without any hassle.
I do this by creating a key binding to run the following command in bash.
'variety --selector'"


check_distribution() {
# Identify the Linux distribution
if [ -f /etc/os-release ]; then
	# Include os-release to get the DISTRIBUTION ID
	. /etc/os-release
	DISTRO=$ID
elif type lsb_release >/dev/null 2>&1; then
	# linuxbase.org
	DISTRO=$(lsb_release -i | cut -d: -f2 | sed s/'^\t'//)
else
	# Older distros might not have the above methods.
	echo "Cannot identify the distribution. Exiting."
	exit 1
fi

# Normalize distro name to lowercase
DISTRO=$(echo $DISTRO | tr '[:upper:]' '[:lower:]')
}


example_installation() {
# Install Zathura based on distribution
case "$DISTRO" in
	ubuntu|debian|linuxmint)
		#TODO: sudo apt update && sudo apt install zathura -y
		;;
	fedora|centos|rhel)
		#TODO: sudo dnf install zathura -y
		;;
	arch|manjaro)
		#TODO: sudo pacman -Syu zathura
		;;
	*)
		echo "Distribution not recognized or not supported by this script."
		;;
esac
}


variety_installation() {
case "$DISTRO" in
	ubuntu|debian|linuxmint)
		sudo apt update && sudo apt install variety -y
		;;
	fedora|centos|rhel)
		sudo dnf install variety -y
		;;
	arch|manjaro)
		sudo pacman -Syu variety
		;;
	*)
		echo "Distribution not recognized or not supported by this script."
		;;
esac
}


# The following is one custom key binding, specifically my kitty binding. It can
# be pulled as follows.

dconf read /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/name
dconf read /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/command
dconf read /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/binding

# The following is the variety's 

dconf read /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/name
dconf read /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/command
dconf read /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/binding

# I have four of these custom keybindings.


# Adding keybindings through the command line:

dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/name "'Your Keybinding Name'"
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/command "'your-command'"
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/binding "'<Control><Shift>N'"
