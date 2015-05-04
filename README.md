### Setup

1. Install Xcode, and the Xcode dev tools with `xcode-select --install`
2. Get vim and zsh to your liking:

```
  git clone https://github.com/kyletns/dotfiles.git ~/.dotfiles
  cd ~
  ln -s ~/.dotfiles/.zshrc
  ln -s ~/.dotfiles/.vimrc

  mkdir ~/.vim
  mkdir ~/.vim/backup
  mkdir ~/.vim/swap
  mkdir ~/.vim/undo

  git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

  vim +PluginInstall +qall

  chsh -s $(which zsh)
  curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
```


3. Brew, Boxen, and more.

**Option 1**:
If you are using Boxen, go ahead and run that, which will install Homebrew, rbenv, Ruby versions, etc.
Follow the instructions [here](https://github.com/boxen/our-boxen#bootstrapping) (if your disk isn't
encrypted, use this install command: `./script/boxen --no-fde`).

**Option 2**: Install Homebrew on your own:

```
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

4. Install all apps with Brew and Cask:

```
  brew tap homebrew/bundle
  brew bundle
```

5. Install [Groupmuse](https://github.com/kyletns/groupmuse/wiki/Setup)!
