#!/bin/zsh

bold="\033[1m"
blue="\033[0;34m"
green="\033[0;32m"
red="\033[0;31m"
reset="\033[0m"


echo "${blue}Installing Python 3.11 and pip ...${reset}"
sudo apt-get install python3.11 python3-pip -y
echo ""

echo "${blue}Setting Python 3.11 as default ...${reset}"
sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.11 1
echo ""

echo "${blue}Updating pip ...${reset}"
pip install --upgrade pip --no-warn-script-location
echo ""

echo "${blue}Checking versions of python3 and pip ...${reset}"
python3 --version
pip --version
echo ""
echo ""
