#!/bin/bash

# get all python pkgs of current env
pip freeze | grep -Eo '(.*==)' | sed 's/==//g'
