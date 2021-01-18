#!/bin/bash
# exit when any command fails
set -e

# keep track of the last executed command
trap 'last_command=$current_command; current_command=$BASH_COMMAND' DEBUG
# echo an error message before exiting
trap 'echo "\"${last_command}\" command filed with exit code $?."' EXIT

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
