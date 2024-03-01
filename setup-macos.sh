#!/bin/bash

set -euxo pipefail

# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# set homebrew installable packages
brew install ansible git curl

# install xcode tools
#xcode-select install

# clone dotfiles repo
git clone https://github.com/saikolab/dotfiles.git

# run setup tasks
ansible-playbook dotfiles/ansible/macos.yml --ask-become-pass
