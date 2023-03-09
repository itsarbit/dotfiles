#!/bin/bash
#############################################################################
# The script is used to startup a developing environment when reinstall a
# computer. For now is OSX only
#############################################################################

export WORKSPACE=$HOME/workspace

#### Install Homebrew
#### Homebrew however is already installed before retrieving the script
if ! type "brew" > /dev/null; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

#### Install Git and Wget
brew install \
  wget \
  git \
  tmux \
  cmake \
  mercurial \
  pkg-config \
  python go nodejs emacs fontconfig shellcheck markdown fd ripgrep fzf

$(brew --prefix)/opt/fzf/install

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
ln -s $WORKSPACE/github/arbit/dotfiles/.tmux-macosx ~/.tmux-macosx
ln -s $WORKSPACE/github/arbit/dotfiles/.tmux.conf ~/.tmux-linux


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

brew install go minikube
brew install --cask visual-studio-code

### for vscode con
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
defaults write com.microsoft.VSCodeInsiders ApplePressAndHoldEnabled -bool false
defaults write com.microsoft.VSCodeExploration ApplePressAndHoldEnabled -bool false

#### Install Plug for vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

#### Setup Vim
# brew install macvim
# brew linkapps
mv ~/.vimrc ~/.vimrc.bak
ln -s $WORKSPACE/github/arbit/dotfiles/.vimrc ~/.vimrc
# vim -c 'BundleInstall' -c 'qa!'
vim -c 'PluginInstall' -c 'qa!'
