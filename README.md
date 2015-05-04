### Setup

1. Clone this repo into `~/.dotfiles` (or wherever you'd like), then `cd` into it.
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

  git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

  vim +PluginInstall +qall
```
