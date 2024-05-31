#!/usr/bin/env sh


#----------------------------------THis file is not just filled with remnants of
#what was. If there is anything like directory locations I used, that is not
#initialized, I will probably find it in either wallpaper or general
#installation scripts. 



# -------------------------TERM SETUP----------------------
#
# --------------------------------------------------------- KITTY SETUP
# This could possibly override the kitty setup they already have installed. 
# Further I should still look into downloading kitty automatically.
# There is no things that must be enabled here, you simply pop in the config and
# you are done.

info_kitty_setup() {
	echo "--------------------------------------------------"
	echo "If you don't have kitty Terminal installed, you can skip this."
	echo 
	echo "However if you do have Kitty installed, this is a nice setup for it."
	echo "Kitty is a fast, featureful, GPU based terminal emulator."
	echo
	echo "The Kitty setup will be installed in the following directory:"
	echo "	- Kitty: $HOME/.config/kitty"
	echo
}

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
