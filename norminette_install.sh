#!/bin/bash

# exit when any command fails
set -e
# keep track of the last executed command
trap 'last_command=$current_command; current_command=$BASH_COMMAND' DEBUG
# echo an error message before exiting
trap 'echo "\"${last_command}\" command filed with exit code $?."' EXIT
# check for SIGINT or CTRL+C
trap exit INT

read -p 'Linux, Macos ? [L, M]: ' OS
case $OS in
"L" | "l" | "linux" | "Linux")
		read -p 'En, Fr ? [en, fr]: ' lang
		case $lang in
			"EN" | "En" | "en")
				clear
				printf "\033[32m  _ _ ___   _  _               _          _   _       \\n | | |_  ) | \\| |___ _ _ _ __ (_)_ _  ___| |_| |_ ___ \\n |_  _/ /  | .\` / _ \\ \'_| \'  \\| | \' \\/ -_)  _|  _/ -_)\\n   |_/___| |_|\\_\\___/_| |_|_|_|_|_||_\\___|\\__|\\__\\___|\n\nWelcome to the installation of the norminette.\nDuring the installation your password will be asked several times, so keep an eye out!\nTo start, press \`Enter\` or press \`Ctrl\` C to stop the installation.\033[m"
				read void
				clear
				printf "\033[32mUpdating all packages\n\033[m"
				printf "\033[32mThis may take some time depending on the power of your computer and your connection.\n\033[m"
				sudo apt-get update && sudo apt-get upgrade && clear
				printf "\033[32mInstall all required packages\n\033[m"
				printf "\033[32mThis may take some time depending on the power of your computer and your connection.\n\033[m"
				sudo apt-get install zsh git ruby ruby-bundler ruby-dev build-essential && clear
				printf "\033[32mInstall Norminette\n\033[m"
				git clone https://github.com/42Paris/norminette.git ~/.norminette/ && \
				cd ~/.norminette/ && \
				sudo bundle && clear
				printf "\033[32mAdd zsh alias\n\033[m"
				echo 'alias norminette="~/.norminette/norminette.rb"' >> ~/.zshrc && source ~/.zshrc
				printf "\033[32mAdd bash alias\n\033[m"
				echo 'alias norminette="~/.norminette/norminette.rb"' >> ~/.bashrc && source ~/.bashrc
			;;
			"FR" | "Fr" | "fr")
				clear
				printf "\033[32m  _ _ ___   _  _               _          _   _       \\n | | |_  ) | \\| |___ _ _ _ __ (_)_ _  ___| |_| |_ ___ \\n |_  _/ /  | .\` / _ \\ \'_| \'  \\| | \' \\/ -_)  _|  _/ -_)\\n   |_/___| |_|\\_\\___/_| |_|_|_|_|_||_\\___|\\__|\\__\\___|\n\nBienvenue a l'installation de la norminette.\nDurant l'installation votre mot de passe vous sera demandez plusieurs fois, donc gardées un œil !\nPour commencer, appuyez sur \`Enter\` ou faite \`Ctrl C\` pour arreter l'installation.\033[m"
				read void
				clear
				printf "\033[32mMise à jour de tous les paquets\n\033[m"
				printf "\033[32mCela peut prendre du temps dépendant de la puissance de votre ordinateur et de votre connection.\n\033[m"
				sudo apt-get update && sudo apt-get upgrade && clear
				printf "\033[32mInstallation tous les paquets nécessaires\n\033[m"
				printf "\033[32mCela peut prendre du temps dépendant de la puissance de votre ordinateur et de votre connection.\n\033[m"
				sudo apt-get install zsh git ruby ruby-bundler ruby-dev build-essential && clear
				printf "\033[32mInstallation Norminette\n\033[m"
				git clone https://github.com/42Paris/norminette.git ~/.norminette/ && \
				cd ~/.norminette/ && \
				sudo bundle && clear
				printf "\033[32mAjout de l'alias zsh\n\033[m"
				echo 'alias norminette="~/.norminette/norminette.rb"' >> ~/.zshrc && source ~/.zshrc
				printf "\033[32mAjout de l'alias zsh bash\n\033[m"
				echo 'alias norminette="~/.norminette/norminette.rb"' >> ~/.bashrc && source ~/.bashrc
			;;
			*)
					echo "Error, wrong lang"
			;;
		esac
;;
"M" | "m" | "macos" | "Macos")
	read -p 'En, Fr ? [en, fr]: ' lang
	case $lang in
		"EN" | "En" | "en")
			printf "\033[32mEn Macos WIP\n\033[m"
		;;
		"FR" | "Fr" | "fr")
			printf "\033[32mFr Macos WIP\n\033[m"
		;;
		*)
			echo "Error, wrong lang"
		;;
	esac
;;
esac