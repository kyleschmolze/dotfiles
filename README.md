### Setup

1. Install Xcode, and the Xcode dev tools with `xcode-select --install`
2. Clone this repo into `~/.dotfiles` (or wherever you'd like), then `cd` into it.

If you are using Boxen, go ahead and run that, which will install Homebrew, rbenv, Ruby versions, and more.
Follow the instructions (here)[https://github.com/boxen/our-boxen#bootstrapping].

2. Install Homebrew:

```
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

3. Install all apps with Brew:

```
  brew tap homebrew/bundle
  brew bundle
```

4. Install yo dotfiles! (Replace with locations as needed)

```
  cd ~
  ln -s ~/.dotfiles/.zshrc
  ln -s ~/.dotfiles/.vimrc

  mkdir ~/.vim
  mkdir ~/.vim/backup
  mkdir ~/.vim/swap
  mkdir ~/.vim/undo

  git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

  vim +PluginInstall +qall
```

5. Oh-my-zsh

```
  curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
```
