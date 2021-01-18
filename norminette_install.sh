#!/bin/bash


read -p 'Linux, Macos ? [L, M]: ' OS
case $OS in
"L" | "l" | "linux" | "Linux")
		read -p 'En, Fr ? [en, fr]: ' lang
		case $lang in
			"EN" | "En" | "en")
				clear
				printf "\033[32mUpdating all packages\n\033[m"
				sudo apt-get update && sudo apt-get upgrade && clear
				printf "\033[32mInstall all required packages\n\033[m"
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
				printf "\033[32mMise à jour de tous les paquets\n\033[m"
				printf "\033[32mCela peut prendre du temps dépendant de la puissance de votre ordinateur et de votre correction.\n\033[m"
				sudo apt-get update && sudo apt-get upgrade && clear
				printf "\033[32mInstallation tous les paquets nécessaires\n\033[m"
				printf "\033[32mCela peut prendre du temps dépendant de la puissance de votre ordinateur et de votre correction.\n\033[m"
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