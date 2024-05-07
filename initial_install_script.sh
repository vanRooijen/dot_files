#!/usr/bin/env sh

current_dir=$(pwd)

# Function to check the exit status of the last command
check_status() {
	if [ $? -ne 0 ]; then
		echo "$1"
		exit 1
	fi
}

#---------------------------------------------------------IDENTIFY OS


# --------------------------------------------------------- WALLPAPERS
# This should not really be a risk for overwriting a file, however it might if
# the user has used my script before. and maybe they would not want to remove
# the old wallpapers, if I have removed some, so it should not ask, however
# if the file does exist, it should only add to the file. As long as you do that
# it probably won't be a problem.

info_general() {
	echo
	echo "OVERVIEW OF SCRIPT"
	echo "	- Install Wallpapers"
	echo "	- Install GTK-3 and GTK-4 themes"
	echo "	- Install GNOME theme"
	echo "	- Install Icon theme"
	echo "	- Install Kitty setup"
	echo "	- Install Tmux setup"
	echo "	- Install Starship setup"
	echo "	- Install Bash setup"
	echo "	- Install Git setup"
	echo "	- Install Neovim setup"
	echo "	- Install Zathura setup"
	echo
	echo "HOW IT WORKS"
	echo "Before every category of thing to install, I will give a bit of
information about how it works or just generally some tips concerning that
category of installation. After reading this, you can choose to install of not
that specific category of thing/s."

	echo
	echo "VERY IMPORTANT NOTICE"
	echo "This script will save your current setup, such that you can revert to
it if it does not work or you don't like the setup.
It will put all the configuration files that it replaces in a directory called
state_restore.
Further, it will remember all environmental variables that where changed in your
gnome environment.

When you want to restore it, you can simply run the command
'ray_dotfiles --restore'
And it should if everything works correctly restore your previous setup.
It will also delete everything it has installed.
Packages installed with apt, will also be removed, however they will be removed
with apt remove and not purge as I would be hesitant to possibly remove
dependencies if you are the type of person who has a problem with that you
will most likely be able to change it yourself in my source code."
}

info_wallpapers() {
	DEST_WALLPAPERS="$HOME/Pictures/the_chosen_ones"

	echo "This function will simply install a few wallpapers in your pictures
directory."
echo"(Specifically in the directory $DEST_WALLPAPERS)"
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


# --------------------------------------------------------- PROMPT GTK THEMES
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

# --------------------------------------------------------- ICON THEME
# Here there might be writing into a directory that already exists and doing so
# either corrupting it or overwriting the files that are in there. Which is very
# likely as they probably have identical names.
# Further this should be enabled with G-settings.

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


# -------------------------TERM SETUP----------------------
#
# --------------------------------------------------------- KITTY SETUP
# This could possibly override the kitty setup they already have installed. 
# Further I should still look into downloading kitty automatically.
# There is no things that must be enabled here, you simply pop in the config and
# you are done.


prompt_kitty_setup() {
	read -p "--------------------------------------------------
Do you want to install Kitty setup? (Y/N): " response
	case $response in
		[yY])
			install_kitty_setup
			;;
		[nN])
			echo "Skipping Kitty setup installation."
			;;
		*)
			echo "Invalid response. Please enter Y or N."
			prompt_kitty_setup
			;;
	esac
}

install_kitty_setup() {
SRC_KITTY="$current_dir/term_setup/kitty_setup/kitty"
DEST_KITTY="$HOME/.config/kitty"

# Ensure the destination directory exists
if [ ! -d "$DEST_KITTY" ]; then
	echo "
Creating directory $DEST_KITTY..."
mkdir -p "$DEST_KITTY"
check_status "Failed to create directory $DEST_KITTY"
else
	echo "
	Directory $DEST_KITTY already exists."
fi

# Install Kitty setup
echo "Installing Kitty setup..."
#: cp -r "$SRC_KITTY"/* "$DEST_KITTY"
check_status "Failed to copy Kitty setup"

echo "✓ Kitty setup installation complete.
"
}

# --------------------------------------------------------- TMUX SETUP
# This could possibly overwrite an existing tmux config, so once again just 
# Further TMUX might not be installed, so that is also something to check 

prompt_tmux_setup() {
	read -p "--------------------------------------------------
Do you want to install Tmux setup? (Y/N): " response
	case $response in
		[yY])
			install_tmux_setup
			;;
		[nN])
			echo "Skipping Tmux setup installation."
			;;
		*)
			echo "Invalid response. Please enter Y or N."
			prompt_tmux_setup
			;;
	esac
}

install_tmux_setup() {
SRC_TMUX="$current_dir/term_setup/tmux_setup/.tmux.config"
DEST_TMUX="$HOME/.tmux.conf"

# Install Tmux setup
echo "Installing Tmux setup..."
#: cp -r "$SRC_TMUX"/* "$DEST_TMUX"
check_status "Failed to copy Tmux setup"

echo "✓ Tmux setup installation complete.
"
}

# --------------------------------------------------------- STARSHIP SETUP

prompt_starship_setup() {
	read -p "--------------------------------------------------
Do you want to install Starship setup? (Y/N): " response
	case $response in
		[yY])
			install_starship_setup
			;;
		[nN])
			echo "Skipping Starship setup installation."
			;;
		*)
			echo "Invalid response. Please enter Y or N."
			prompt_starship_setup
			;;
	esac
}

install_starship_setup() {
SRC_STARSHIP="$current_dir/term_setup/starship_setup/starship.toml"
DEST_STARSHIP="$HOME/.config/starship.toml"

# Ensure the destination directory exists
if [ ! -d "$HOME/.config" ]; then
	echo "
Creating directory $HOME/.config..."
mkdir -p "$DEST_STARSHIP"
check_status "Failed to create directory $HOME/.config"
else
	echo "
	Directory $HOME/.config already exists."
fi

# Install Starship setup
echo "Installing Starship setup..."
#: cp -r "$SRC_STARSHIP"/* "$DEST_STARSHIP"
check_status "Failed to copy Starship setup"

#TODO: eval "$(/home/raymond/.cargo/bin/starship init bash)"
# The starship can be added to the bashrc file, but that is the catch so if they
# don't end up getting my bash rc, it will still work

echo "✓ Starship setup installation complete.
"
}

# --------------------------------------------------------- BASH SETUP

# Note here what the person has previously installed, I.e. Starship Toml, will
# have an influence on this. 
prompt_bash_setup() {
	read -p "--------------------------------------------------
Do you want to install Bash setup? (Y/N): " response
	case $response in
		[yY])
			install_bash_setup
			;;
		[nN])
			echo "Skipping Bash setup installation."
			;;
		*)
			echo "Invalid response. Please enter Y or N."
			prompt_bash_setup
			;;
	esac
}

install_bash_setup() {
SRC_BASH="$current_dir/term_setup/bash_setup/.bashrc"
DEST_BASH="$HOME/.bashrc"

# Install Bash setup
echo "Installing Bash setup..."
#: cp -r "$SRC_BASH"/* "$DEST_BASH"
check_status "Failed to copy Bash setup"

echo "✓ Bash setup installation complete.
"
}



# ------------------------- OTHER -------------------------

# --------------------------------------------------------- GIT SETUP

prompt_git_setup() {
	read -p "--------------------------------------------------
Do you want to install Git setup? (Y/N): " response
	case $response in
		[yY])
			install_git_setup
			;;
		[nN])
			echo "Skipping Git setup installation."
			;;
		*)
			echo "Invalid response. Please enter Y or N."
			prompt_git_setup
			;;
	esac
}

install_git_setup() {
SRC_GIT="$current_dir/other/git_setup/.gitconfig"
DEST_GIT="$HOME/.gitconfig"

# Install Git setup
echo "Installing Git setup..."
#: cp -r "$SRC_GIT"/* "$DEST_GIT"
check_status "Failed to copy Git setup"
}

# --------------------------------------------------------- NVIM SETUP

prompt_nvim_setup() {
	read -p "--------------------------------------------------
Do you want to install Neovim setup? (Y/N): " response
	case $response in
		[yY])
			install_nvim_setup
			;;
		[nN])
			echo "Skipping Neovim setup installation."
			;;
		*)
			echo "Invalid response. Please enter Y or N."
			prompt_nvim_setup
			;;
	esac
}

install_nvim_setup() {
SRC_NVIM="$current_dir/other/nvim_setup/nvim"
DEST_NVIM="$HOME/.config/nvim"

# Ensure the destination directory exists
if [ ! -d "$DEST_NVIM" ]; then
	echo "
Creating directory $DEST_NVIM..."
mkdir -p "$DEST_NVIM"
check_status "Failed to create directory $DEST_NVIM"
else
	echo "
Directory $DEST_NVIM already exists."
fi

# Install Neovim setup
echo "Installing Neovim setup..."
#: cp -r "$SRC_NVIM"/* "$DEST_NVIM"
check_status "Failed to copy Neovim setup"

echo "✓ Neovim setup installation complete.
"
}

# --------------------------------------------------------- ZATHURA SETUP
prompt_zathura_setup() {
	read -p "--------------------------------------------------
Do you want to install Zathura setup? (Y/N): " response
	case $response in
		[yY])
			install_zathura_setup
			;;
		[nN])
			echo "Skipping Zathura setup installation."
			;;
		*)
			echo "Invalid response. Please enter Y or N."
			prompt_zathura_setup
			;;
	esac
}

install_zathura_setup() {
SRC_ZATHURA="$current_dir/other/zathura_setup/zathura"
DEST_ZATHURA="$HOME/.config/zathura"

# Ensure the destination directory exists
if [ ! -d "$DEST_ZATHURA" ]; then
	echo "
Creating directory $DEST_ZATHURA..."
mkdir -p "$DEST_ZATHURA"
check_status "Failed to create directory $DEST_ZATHURA"
else
	echo "
Directory $DEST_ZATHURA already exists."
fi

# Install Zathura setup
echo "Installing Zathura setup..."
#: cp -r "$SRC_ZATHURA"/* "$DEST_ZATHURA"
check_status "Failed to copy Zathura setup"

echo "✓ Zathura setup installation complete.
"
}


# General Script Structure

# Here show some general information about the script, the fact that it will
# not overwrite any files without sending the current to a restore point, which
# you can restore from if you don't like what you see.
#
# Also tell the user no installation or changes will be made without their
# explicit consent (Which will be given by typing "Y" or "y" when prompted).

# First comes general gnome ricing. This includes wallpapers, GTK themes, GNOME
# themes, icon themes.

start_prompt_general_information() {
	echo "--------------------------------------------------
IMPORTANT INFORMATION
--------------------------------------------------"
	echo "This script will not overwrite any files without first sending the
current files to a recovery point. You can restore from this recovery point.
Possible according to date even. If you are happy and you find that it is
functioning correctly, you can simply remove the specific sub directory you
don't need anymore from state_restore."
	echo
	echo "No installation or changes will be made without your explicit consent."
	echo "--------------------------------------------------"
}


finishing_the_script() {
	echo
	read -p "I promise that I will tell every person without asking why Linux is
so much better than every other operating system. (Y/N): " response
	case $response in
		[yY])
			echo
			echo "Good. Good."
			;;
		[nN])
			echo
			read -p "What is your name? " name
			echo
			echo "Fuck you, $name."
			;;
		*)
			echo "Invalid response. Please enter Y or N."
			finishing_the_script
			;;
	esac
}

prompt_wallpapers

prompt_gtk_themes

prompt_gnome_theme

prompt_icon_theme

# Next comes the terminal setup this includes bash, kitty, starship

prompt_bash_setup

prompt_starship_setup

prompt_kitty_setup

# Next comes the things specific for your heavy terminal users

prompt_tmux_setup

prompt_git_setup #basically just a log function

prompt_nvim_setup

# Finally comes my favorite PDF reader, Zathura!

prompt_zathura_setup

finishing_the_script
