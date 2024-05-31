#!/usr/bin/env sh

# This is the shell script for all the other scripts in this repository.
# It will basically just handle the parameters and call the appropriate script.
#
# TODO: This is far from being the final set of options, I will still have to see
# exactly what I use and adjust accordingly.


# Check if the first parameter is empty
if [ -z "$1" ]; then
	echo "Usage: raydots.sh [OPTIONS]"
	echo "Options:"
	echo " -g, --general		Install General Modifications to the Gnome Environment"
	echo " -t, --terminal		Install Terminal Setup"
	echo " -n, --nvim			Install NVIM Setup"
# NOTE: I will not activate this at all, I am thinking of removing it for this
# reason except if I decide to not automatically install everything from the
# dotfiles, but rather only installing parts through wget or curl.
# TODO: What I think I will have to do here is actually understand my own
# nvim setup better and make a list of all the keybindings and commands you need
# to know and do to use the setup.
# One example of something to do is to mention that how you update with my
# Packer setup is to run :PackerSync.
# This is the bulk of what you should know, that and that the error messages are
# not much of a problem.
	echo " -h, --help			Show this help message"
	echo " -r, --restore		Restore to your previous Gnome Environment"
	echo " -w, --wallpaper		Install Wallpapers and related."
	echo " -k, --keybindings	Install my keybindings and a map to using them."
	exit 1
fi


