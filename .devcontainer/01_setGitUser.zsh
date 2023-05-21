#!/bin/zsh

bold="\033[1m"
blue="\033[0;34m"
green="\033[0;32m"
red="\033[0;31m"
reset="\033[0m"


# This script checks if the .devcontainer/.env.gituser.zsh file exists and displays the git user name and email if it does.
# If the file does not exist, it prompts the user to create the file with the necessary git user configuration.

# Create .devcontainer/.env.gituser.zsh
# With the following content:
# git config --global user.email "you@example.com"
# git config --global user.name "Your Name"

# check if file exists .env.gituser.zsh
if [ -f .devcontainer/.env.gituser.zsh ]; then
    echo "${bold}Setting git user...${reset}"
    zsh .devcontainer/.env.gituser.zsh
    echo ""
    echo "${bold}git user.name:${reset} $(git config user.name)"
    echo "${bold}git user.email:${reset} $(git config user.email)"
else
    echo "${red}${bold}File .devcontainer/.env.gituser.zsh does not exist.${reset}"
    echo "Create .devcontainer/.env.gituser.zsh with the following content:"
    echo ""
    echo "git config --global user.email \"you@example.com\""
    echo "git config --global user.name \"Your Name\""
fi

echo ""
echo ""
