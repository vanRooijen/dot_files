#!/bin/bash

# Check if --all argument is passed
CHECK_ICONS=false
if [ "$1" == "--all" ]; then
    CHECK_ICONS=true
fi

# Check if 'diff' command is available
if ! command -v diff &> /dev/null; then
    echo "'diff' command is not found. Please install it before running the script."
    exit 1
fi

# Function to check the exit status of the last command
check_status() {
    if [ $? -ne 0 ]; then
        echo "$1"
        exit 1
    fi
}

# Function to compare contents of source and destination using diff
# Outputs the differences and returns true if contents match, false otherwise
compare_contents() {
    local src="$1"
    local dest="$2"
    local config_name="$3"
    local diff_output=$(diff -r "$src" "$dest")
    if [ -z "$diff_output" ]; then
        return 0
    else
		echo "----------------------------------------------------"
		echo "$config_name"
        echo "----------------------------------------------------"
        echo "$diff_output"
        echo "----------------------------------------------------"
        return 1
    fi
}

# --------------------------------------------------------- NVIM
SRC_NVIM="/home/raymond/.config/nvim"
DEST_NVIM="/home/raymond/Documents/projects/dot_files/other/nvim_setup/nvim"

if compare_contents "$SRC_NVIM" "$DEST_NVIM" "NVIM config"; then
    echo "== NVIM config stays the same"
else
    [ -n "$DEST_NVIM" ] && rm -rf "$DEST_NVIM"/*
    cp -r "$SRC_NVIM"/* "$DEST_NVIM"
    check_status "Failed to copy nvim config"   
    echo "++ NVIM config is updated"
fi

# --------------------------------------------------------- WALLPAPERS
SRC_WALLPAPERS="/home/raymond/Pictures/the_chosen/chosen"
DEST_WALLPAPERS="/home/raymond/Documents/projects/dot_files/wallpapers"

if compare_contents "$SRC_WALLPAPERS" "$DEST_WALLPAPERS" "Wallpapers"; then
    echo "== Wallpapers stay the same"
else
    [ -n "$DEST_WALLPAPERS" ] && rm -rf "$DEST_WALLPAPERS"/*
    cp "$SRC_WALLPAPERS"/* "$DEST_WALLPAPERS"
    check_status "Failed to copy wallpapers"
    echo "++ Wallpapers are updated"
fi

# --------------------------------------------------------- GTK-3 THEME
SRC_GTK3="/home/raymond/.config/gtk-3.0"
DEST_GTK3="/home/raymond/Documents/projects/dot_files/gtk_theme/gtk-3.0/"

if compare_contents "$SRC_GTK3" "$DEST_GTK3" "GTK-3 theme"; then
	echo "== GTK-3 theme stays the same"
else
	[ -n "$DEST_GTK3" ] && rm -rf "$DEST_GTK3"/*
	cp -r "$SRC_GTK3"/* "$DEST_GTK3"
	check_status "Failed to copy GTK-3 theme"
	echo "++ GTK-3 theme is updated"
fi

# --------------------------------------------------------- GTK-4 THEME
SRC_GTK4="/home/raymond/.config/gtk-4.0"
DEST_GTK4="/home/raymond/Documents/projects/dot_files/gtk_theme/gtk-4.0/"

if compare_contents "$SRC_GTK4" "$DEST_GTK4" "GTK-4 theme"; then
	echo "== GTK-4 theme stays the same"
else
	[ -n "$DEST_GTK4" ] && rm -rf "$DEST_GTK4"/*
	cp -r "$SRC_GTK4"/* "$DEST_GTK4"
	check_status "Failed to copy GTK-4 theme"
	echo "++ GTK-4 theme is updated"
fi

# --------------------------------------------------------- GNOME THEME
SRC_GNOME="/home/raymond/.themes/Gruvbox-Dark-B"
DEST_GNOME="/home/raymond/Documents/projects/dot_files/gnome_theme/Gruvbox-Dark-B"

if compare_contents "$SRC_GNOME" "$DEST_GNOME" "GNOME theme"; then
	echo "== GNOME theme stays the same"
else
	[ -n "$DEST_GNOME" ] && rm -rf "$DEST_GNOME"/*
	cp -r "$SRC_GNOME"/* "$DEST_GNOME"
	check_status "Failed to copy GNOME theme"
	echo "++ GNOME theme is updated"
fi

# --------------------------------------------------------- ICON THEME
if $CHECK_ICONS; then
    SRC_ICON="/home/raymond/.icons/Gruvbox"
    DEST_ICON="/home/raymond/Documents/projects/dot_files/icon_theme/Gruvbox"

    if compare_contents "$SRC_ICON" "$DEST_ICON" "Icon theme"; then
        echo "== Icon theme stays the same"
    else
        [ -n "$DEST_ICON" ] && rm -rf "$DEST_ICON"/*
        cp -r "$SRC_ICON"/* "$DEST_ICON"
        check_status "Failed to copy Icon theme"
        echo "++ Icon theme is updated"
    fi
fi

# --------------------------------------------------------- FONTS
# I should remember to make an installer for fonts



# --------------------------------------------------------- BASH SETUP
SRC_BASH="/home/raymond/.bashrc"
DEST_BASH="/home/raymond/Documents/projects/dot_files/term_setup/bash_setup/.bashrc"

if compare_contents "$SRC_BASH" "$DEST_BASH" "Bash config"; then
	echo "== Bash config stays the same"
else
	cp "$SRC_BASH" "$DEST_BASH"
	check_status "Failed to copy Bash config"
	echo "++ Bash config is updated"
fi

# --------------------------------------------------------- KITTY SETUP
SRC_KITTY="/home/raymond/.config/kitty"
DEST_KITTY="/home/raymond/Documents/projects/dot_files/term_setup/kitty_setup/kitty"

if compare_contents "$SRC_KITTY" "$DEST_KITTY" "Kitty config"; then
	echo "== Kitty config stays the same"
else
	[ -n "$DEST_KITTY" ] && rm -rf "$DEST_KITTY"/*
	cp -r "$SRC_KITTY"/* "$DEST_KITTY"
	check_status "Failed to copy Kitty config"
	echo "++ Kitty config is updated"
fi




