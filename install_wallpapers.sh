#!/usr/bin/env sh

# This start of this script is wrong, but still something I will have to build
# into the script, I initially just wanted a script to seperate the installation
# of Variety, however I have now decided as I know to seperate much more than
# that. This is now the wallpaper installation script.

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

# -------------------------------------------INSTALLATION OF WALLPAPERS

info_wallpapers() {
	echo "--------------------------------------------------"
	echo "This function will just download some nice wallpapers."
	echo
	echo "The wallpapers will be downloaded to the following directory:"
	echo "	- Wallpapers: $HOME/Pictures/the_chosen_ones"
	echo

}
prompt_wallpapers() {
	read -p "--------------------------------------------------
Do you want to download wallpapers? (Y/N): " response
	case $response in
		[yY])
			download_wallpapers
			;;
		[nN])
			echo "Skipping wallpapers download."
			;;
		*)
			echo "Invalid response. Please enter Y or N."
			prompt_wallpapers
			;;
	esac
}

download_wallpapers() {
# Source and destination directories
SRC_WALLPAPERS="$current_dir/wallpapers"
DEST_WALLPAPERS="$HOME/Pictures/the_chosen_ones"

# Check if the destination directory exists, create it if not
if [ ! -d "$DEST_WALLPAPERS" ]; then
	echo "
Creating directory $DEST_WALLPAPERS..."
	mkdir -p "$DEST_WALLPAPERS"
	check_status "Failed to create directory $DEST_WALLPAPERS"
else
	echo "
Directory $DEST_WALLPAPERS already exists."
fi

# Copy wallpapers to the destination directory
echo "Downloading wallpapers..."
#TODO: cp -r "$SRC_WALLPAPERS/"* "$DEST_WALLPAPERS"
check_status "Failed to download wallpapers"

echo "
✓ Wallpapers download complete.
"
}

applying_wallpapers() {
	echo "Changing your wallpaper to $HOME/Pictures/the_chosen_ones/highland_cow_grain_0_070.jpg"
	gsettings set org.gnome.desktop.background picture-uri "file://$HOME/Pictures/the_chosen_ones/highland_cow_grain_0_070.jpg"

}



#-----------------------------------------------------------SOME NOTES:

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
