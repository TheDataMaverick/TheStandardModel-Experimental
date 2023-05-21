#!/bin/zsh


bold="\033[1m"
blue="\033[0;34m"
green="\033[0;32m"
red="\033[0;31m"
reset="\033[0m"


# Set git user
echo "${blue}${bold}Set git user${reset}"
echo ""
zsh .devcontainer/01_setGitUser.zsh

# Setup Ubuntu
echo "${blue}${bold}Setup Ubuntu${reset}"
echo ""
zsh .devcontainer/02_setupUbuntu.zsh

# Install Python
echo "${blue}${bold}Install Python${reset}"
echo ""
zsh .devcontainer/03_installPython.zsh


# Install requirements
echo "${blue}${bold}Install requirements.txt${reset}"
echo ""
zsh .devcontainer/04_installPipRequirements.zsh

# Copy dbt profiles to home
echo "${blue}${bold}Copy dbt profiles to home${reset}"
echo ""
zsh .devcontainer/05_copyDbtProfiles.zsh

# Set HTTP Proxy
#echo "${blue}${bold}Set HTTP Proxy${reset}"
#echo ""
#zsh .devcontainer/06_setHttpProxy.zsh
