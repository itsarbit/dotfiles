#!/bin/bash
#############################################################################
# The script is used to startup a developing environment when reinstall a
# computer. For now is OSX only
#############################################################################

export WORKSPACE=/Users/arbit/Develop/workspace

#### Install Homebrew
#### Homebrew however is already installed before retrieving the script
if ! type "brew" > /dev/null; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

#### Install Git and Wget
brew install wget git tmux cmake mercurial pkg-config

# Retrieve dotfiles
mkdir $WORKSPACE
mkdir $WORKSPACE/github/arbit
# NOTE: the clone script is called by cloning itself
git clone https://github.com/isArbit/dotfiles.git $WORKSPACE/github/arbit/dotfiles

# Setup dotfiles
ln -s $WORKSPACE/github/arbit/dotfiles/.exports ~/.exports
ln -s $WORKSPACE/github/arbit/dotfiles/.paths ~/.paths
ln -s $WORKSPACE/github/arbit/dotfiles/.aliases ~/.aliases
ln -s $WORKSPACE/github/arbit/dotfiles/.functions ~/.functions
ln -s $WORKSPACE/github/arbit/dotfiles/.tmux.conf ~/.tmux.conf


#### Change default shell to zsh
chsh -s /bin/zsh

#### Install Oh-My-Zsh
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
mv ~/.zshrc ~/.zshrc.bak
ln -s $WORKSPACE/github/arbit/dotfiles/.zshrc ~/.zshrc

#### Setup Git
mv ~/.gitconfig ~/.gitconfig.bak
ln -s $WORKSPACE/github/arbit/dotfiles/.gitconfig ~/.gitconfig


#
##Install fasd
if ! type "fasd" > /dev/null; then
  mkdir -p $WORKSPACE/3rdparty ;cd $WORKSPACE/3rdparty
  git clone https://github.com/clvv/fasd.git
  cd fasd
  make install
fi

#### Install Vundle
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

#### Setup Vim
brew install macvim --override-system-vim
brew linkapps
mv ~/.vimrc ~/.vimrc.bak
ln -s $WORKSPACE/github/arbit/dotfiles/.vimrc ~/.vimrc
vim -c 'BundleInstall' -c 'qa!'
vim -c 'PluginInstall' -c 'qa!'
### Setup YouCompleteMe
cd ~/.vim/bundle/YouCompleteMe
./install.sh --clang-completer
