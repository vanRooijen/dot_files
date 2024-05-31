#!/usr/bin/env sh

#-----------------------------------------------NOTE
#this script is the general installation of the gnome setup
#Including: 
# - GTK-3 and GTK-4 themes
# - GNOME theme
# - Icon theme
# - Fonts

# I have done quite a bit of the actual work on creating the general structure
# of the program, however I should still mainly do the following:
#
# - Well first of all rewrite the general download and acceptance part of it, as
# that has quite significantlly changed, however this is very much the boring
# part of the work, however quite an importnnt party unfortunately.
# (Does not really including any coding.)
#
# - THen I have to make sure the actual installing from the directories are
# still working fine and that all the directories are in place. 
# (One thing I should really think of here is if I will be changing the
# directory structure because of the new change in the dotfiles generally.)
#
# - Then I should make the product actually implement the things it has
# installed, this will be actually activating the themes, icons, fonts.
#
# - Then finally I should make a yaml file that will store all the current
# settings and configurations that the user has,if the user does not have the
# user themes extension at all this might be as simple as saying so because it
# can always be disabled. Here is where it is wonderful that I am building on
# somehing that already has safety built in.
#
# BIG QUESTION: 
# Given this new structure of the script. It has made clear, that a choice
# should be made and that the choice can be made now to create a more
# complicated system that checks the version of gnome and then installs packages
# specifically for that specific version of gnome, therefore being able to
# savely update the dots at the pace the user updates their own system.
#
# I think so, it is not a very complicated system. I think you can simply write
# a little function that checks the gnome version of the system and then
# installs from the branch of that specific gnome version from my repository.
#
# I think branches are the way to go expandibility wise, I might have to fix
# things on my old repositories far along the line.

current_dir=$(pwd)

# Function to check the exit status of the last command
check_status() {
	if [ $? -ne 0 ]; then
		echo "$1"
		exit 1
	fi
}


# Header
echo "--------------------------------------------------"
echo "General Installation Script"
echo "--------------------------------------------------"
echo


info_general() {
	echo "VERY IMPORTANT NOTICE"
	echo "This script will save your current gnome setup, such that you can revert to
it if it does not work or you don't like the setup.
It will put all the configuration files that it replaces in a directory called
state_restore.
Further, it will remember all environmental variables that where changed in your
gnome environment.

When you want to restore it, you can simply run the command
'raydots --restore'
And it should if everything works correctly restore your previous setup."
	echo
	echo "No installation or changes will be made without your explicit consent."
	echo
}


#--------------------------------------------------------- PROMPT GTK THEMES

info_gtk_themes() {
	echo "--------------------------------------------------"
	echo "This function will install GTK-3 and GTK-4 themes."
	echo "GTK-3 and GTK-4 are the primary libraries used to render the user
interface of applications in GNOME."
	echo "The configuration files for GTK-3 and GTK-4 simply then changes the
way your windows look."
	echo
	echo "The themes will be installed in the following directories:"
	echo "	- GTK-3: $HOME/.config/gtk-3.0"
	echo "	- GTK-4: $HOME/.config/gtk-4.0"
	echo
}

prompt_gtk_themes() {
	read -p "--------------------------------------------------
Do you want to install GTK-3 and GTK-4 themes? (Y/N): " response
	case $response in
		[yY])
			install_gtk3_theme
			install_gtk4_theme
			;;
		[nN])
			echo "Skipping GTK theme installation."
			;;
		*)
			echo "Invalid response. Please enter Y or N."
			prompt_gtk3_theme
			;;
	esac
}

# --------------------------------------------------------- GTK-3 THEME

install_gtk3_theme() {
SRC_GTK3="$current_dir/gtk_theme/gtk-3.0/"
DEST_GTK3="$HOME/.config/gtk-3.0"

# Ensure the destination directory exists
if [ ! -d "$DEST_GTK3" ]; then
	echo "
Creating directory $DEST_GTK3..."
	mkdir -p "$DEST_GTK3"
	check_status "Failed to create directory $DEST_GTK3"
else
	echo "
Directory $DEST_GTK3 already exists."
fi

# Install GTK-3 theme
echo "Installing GTK-3 theme..."
#TODO: cp -r "$SRC_GTK3"/* "$DEST_GTK3"
check_status "Failed to copy GTK-3 theme"

echo "
✓ GTK-3 theme installation complete.
"
}

# --------------------------------------------------------- GTK-4 THEME

install_gtk4_theme() {
SRC_GTK4="$current_dir/gtk_theme/gtk-4.0/"
DEST_GTK4="$HOME/.config/gtk-4.0"

# Ensure the destination directory exists
if [ ! -d "$DEST_GTK4" ]; then
	echo "
Creating directory $DEST_GTK4..."
	mkdir -p "$DEST_GTK4"
	check_status "Failed to create directory $DEST_GTK4"
else
	echo "
Directory $DEST_GTK4 already exists."
fi

# Install GTK-4 theme
echo "Installing GTK-4 theme..."
#TODO: cp -r "$SRC_GTK4"/* "$DEST_GTK4"
check_status "Failed to copy GTK-4 theme"

echo "
✓ GTK-4 theme installation complete."
}

# --------------------------------------------------------- GNOME THEME

info_gnome_theme() {
	echo "--------------------------------------------------"
	echo "This is what you would call a shell theme"

	echo "This function will install a GNOME theme."
	echo "GNOME is the default desktop environment for Ubuntu and Fedora. Gnome
is much more than just a desktop environment, it is an entire ecosystem of
software. It uses GTK-3 and GTK-4 to render the user interface of applications."
	echo "
You might want to see this as changing the theme of the top bar and the dock.
However because of the way GNOME is built, it will also change the aesthetics of
many other things you see."
	echo
	echo "The GNOME theme will be installed in the following directory:"
	echo "	- GNOME: $HOME/.themes/Gruvbox-Dark-B"
	echo
}

prompt_gnome_theme() {
	read -p "--------------------------------------------------
Do you want to install GNOME theme? (Y/N): " response
	case $response in
		[yY])
			install_gnome_theme
			;;
		[nN])
			echo "Skipping GNOME theme installation."
			;;
		*)
			echo "Invalid response. Please enter Y or N."
			prompt_gnome_theme
			;;
	esac
}

install_gnome_theme() {
SRC_GNOME="$current_dir/gnome_theme/Gruvbox-Dark-B"
DEST_GNOME="$HOME/.themes/Gruvbox-Dark-B"

# Ensure the destination directory exists
if [ ! -d "$DEST_GNOME" ]; then
	echo "
Creating directory $DEST_GNOME..."
	mkdir -p "$DEST_GNOME"
	check_status "Failed to create directory $DEST_GNOME"
else
	echo "
Directory $DEST_GNOME already exists."
fi

# Install GNOME theme
echo "Installing GNOME theme..."
#TODO: cp -r "$SRC_GNOME"/* "$DEST_GNOME"
check_status "Failed to copy GNOME theme"

echo "✓ GNOME theme installation complete.
"
}

applying_gnome_theme() {
# Enabling the Gnome theme will be significantly harder to manage, one way to do
# so would be to install the user themes extension and then to enable the theme
# in said extension's settings, specifically through the gsettings of this
# extension. 

# One way you can do this is by packaging the extension with my dotfiles,
# however the obvious problem with that is how it is handled during updating,
# speaking of updating however, making this script is very much dependent on the
# gnome version of the user. That will come in to play to an exagerated extent. 

#TODO: once you have the gnome extension you can simply enable the theme with
# gsettings set org.gnome.shell.extensions.user-theme name "Gruvbox-Dark-B"
#
# However this is then one thing I should think about quite a bit. What will I
# use to get the extension on their system for the first time.

# And then further how will you keep it updated. Because you can abstract them
# from the process of installing it, but can you abstract away the process of
# updating. Especially updating the version of the software but not the
# architecture it is built for.\
#
# So updating the version of the extension but working on the version built for
# a specific version of gnome.
#
# When you look at downloading zip files from gnome extensions website, you will
# find that you can make this distinction.

}

# --------------------------------------------------------- ICON THEME
# Here there might be writing into a directory that already exists and doing so
# either corrupting it or overwriting the files that are in there. Which is very
# likely as they probably have identical names.
# Further this should be enabled with G-settings.

info_icon_theme() {
	echo "--------------------------------------------------"
	echo "This function will install an Icon theme."
	echo "Icon themes are used to change the appearance of icons in your system."
	echo
	echo "The Icon theme will be installed in the following directory:"
	echo "	- Icon: $HOME/.icons/Gruvbox"
	echo
}

prompt_icon_theme() {
	read -p "--------------------------------------------------
Do you want to install Icon theme? (Y/N): " response
	case $response in
		[yY])
			install_icon_theme
			;;
		[nN])	
			echo "Skipping Icon theme installation."
			;;
		*)
			echo "Invalid response. Please enter Y or N."
			prompt_icon_theme
			;;
	esac
}

install_icon_theme() {
SRC_ICON="$current_dir/icon_theme/Gruvbox"
DEST_ICON="$HOME/.icons/Gruvbox"

# Ensure the destination directory exists
if [ ! -d "$DEST_ICON" ]; then
	echo "
Creating directory $DEST_ICON..."
	mkdir -p "$DEST_ICON"
	check_status "Failed to create directory $DEST_WALLPAPERS"
else
	echo "
Directory $DEST_ICON already exists."
fi

# Install Icon theme
echo "Installing Icon theme..."
#: cp -r "$SRC_ICON"/* "$DEST_ICON"
check_status "Failed to copy Icon theme"

echo "✓ Icon theme installation complete.
"
}

applying_icon_theme() {

}

# --------------------------------------------------------- FONTS
# One thing I have neglected to put in my dot files is my fonts, I feel rather
# bad distributing the fonts myself, therefore I might want to find an other way
# to download the fonts.
# The fonts I want to distribute is:
# - Cascadia Code by Microsoft
# - Balsamiq Sans by Balsamiq.

install_fonts() {

SRC_CASCADIA_CODE="$current_dir/fonts/CascadiaCode"
SRC_BALSAMIQ_SANS="$current_dir/fonts/BalsamiqSans"
DEST_CASCADIA_CODE="$HOME/.fonts/CascadiaCode"
DEST_BALSAMIQ_SANS="$HOME/.fonts/BalsamiqSans"

#Install Cascadia Code
echo "Installing Cascadia Code..."


#Install Balsamiq Sans
echo "Installing Balsamiq Sans..."
}



