#!/bin/bash
clear
printf "\033[32mUpdating all packages\n\033[m"
if sudo apt-get update && sudo apt-get upgrade && clear
else exit 1
printf "\033[32mInstall all required packages\n\033[m"
if sudo apt-get install zsh git ruby ruby-bundler ruby-dev build-essential && clear
else exit 1
printf "\033[32mInstall Norminette\n\033[m"
if git clone https://github.com/42Paris/norminette.git ~/.norminette/ && \
cd ~/.norminette/ && \
sudo bundle && clear
else exit 1
printf "\033[32mAdd zsh alias\n\033[m"
if echo 'alias norminette="~/.norminette/norminette.rb"' >> ~/.zshrc && source ~/.zshrc
else exit 1
printf "\033[32mAdd bash alias\n\033[m"
if echo 'alias norminette="~/.norminette/norminette.rb"' >> ~/.bashrc && source ~/.bashrc
else exit 1
