#!/bin/bash

set -euxo pipefail

# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# set homebrew installable packages
brew install ansible git curl

# install xcode tools
#xcode-select install

# clone dotfiles repo
if test -d dotfiles; then
  cd dotfiles && git checkout main && git pull && cd ..
else
  git clone https://github.com/saikolab/dotfiles.git
fi

# run setup tasks
ansible-playbook dotfiles/ansible/macos.yml --ask-become-pass
