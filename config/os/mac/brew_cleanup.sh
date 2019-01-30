#!/bin/sh

brew_packages_to_be_cleaned=$(brew list -1 | grep -vi python | tr '\n' ' ')
echo "packages to be cleaned: $brew_packages_to_be_cleaned"
echo "Do you wish to clean those packages (y/n)? "
read answer
echo "you choose $answer"

if [[ "$answer" == "y" || "$answer" == "Y" ]]; then
    brew cleanup $brew_packages_to_be_cleaned
else
    echo "brew will not cleanup any packages"
fi
