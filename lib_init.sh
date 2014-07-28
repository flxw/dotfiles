#!/bin/bash
# Last Edit: 19.05.2014

## function definitions
symlink_file() {
    echo -n "Linking `basename $1` to $2..." &&
        ln --symbolic "$1" "$2" 2> /dev/null &&
        echo "SUCCEEDED" ||
        echo "FAILED"
}

## the main script logic
if [ $# -eq 0 ]; then
    echo "You must pass at least the name of one program that you want to install the configuration for!"
    exit 1
fi

for ITEM in $@; do

	case "$ITEM" in
        sublime)
            mkdir -p "$HOME/.config/sublime-text-3/Packages/"
            symlink_file "$PWD/sublime" "$HOME/.config/sublime-text-3/Packages/User"
            ;;
        i3)
            mkdir "$HOME/.i3"
            symlink_file "$PWD/.i3/config" "$HOME/.i3"
            symlink_file "$PWD/.i3/conki3" "$HOME/.i3"
            symlink_file "$PWD/.i3/dunstrc" "$HOME/.i3"
            symlink_file "$PWD/.i3/i3status.conf" "$HOME/.i3"
            ;;

        vim)
            mkdir "$HOME/.vim"
            symlink_file "$PWD/.vimrc" "$HOME"
            symlink_file "$PWD/.vim/colors" "$HOME/.vim/"
            symlink_file "$PWD/.vim/spell" "$HOME/.vim"

            if which git &> /dev/null; then
                git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
                vim -nX +BundleInstall +qall
                echo "REMINDER: vim-atp needs python2-psutil to work properly!"
            fi
            ;;

        zsh)
            symlink_file "$PWD/.zshrc"  "$HOME"
            symlink_file "$PWD/.zlogin" "$HOME"
            symlink_file "$PWD/.zshenv" "$HOME"
            symlink_file "$PWD/.dircolors" "$HOME"
            ;;

        fish)
			mkdir -p "$HOME/.config/fish"
			symlink_file "$PWD/fish/config.fish" "$HOME/.config/fish/"
			symlink_file "$PWD/fish/functions" "$HOME/.config/fish/"
			;;

        git)
            symlink_file "$PWD/.gitconfig" "$HOME"
            ;;

        tmux)
            symlink_file "$PWD/.tmux.conf" "$HOME"
            ;;

        X)
            symlink_file "$PWD/.Xdefaults" "$HOME"
            symlink_file "$PWD/.xprofile" "$HOME"
            ;;

        xpdf)
            symlink_file "$PWD/.xpdfrc" "$HOME"
            ;;

		qtcreator)
			mkdir -p "$HOME/.config/QtProject/qtcreator/styles"
			symlink_file "$PWD/qtcreator/solarized_dark.xml"  "$HOME/.config/QtProject/qtcreator/styles"
			symlink_file "$PWD/qtcreator/solarized_light.xml" "$HOME/.config/QtProject/qtcreator/styles"
			symlink_file "$PWD/qtcreator/zenburn.xml"         "$HOME/.config/QtProject/qtcreator/styles"
			;;
		
        htop)
			mkdir -p "$HOME/.config/htop"
			symlink_file "$PWD/htoprc" "$HOME/.config/htop/"
			;;

        gnuplot)
            symlink_file "$PWD/.gnuplot" "$HOME"
            ;;

        termite)
			mkdir -p "$HOME/.config"
			symlink_file "$PWD/termite" "$HOME/.config"
			;;


        # Custom program direcories
		bin)
			symlink_file "$PWD/bin" "$HOME"
			;;

        templates)
            symlink_file "$PWD/templates" "/home/$USER/"
            ;;

		*)
			echo "Sorry! Program '$ITEM' isn't even in the configs!"
			;;
	esac

	echo ""
done
