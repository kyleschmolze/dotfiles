### Setup

1. Clone into `~/dotfiles` (or wherever you'd like).
2. Link your files and directories:

```
    ln -s ~/dotfiles/vim/.vimrc .vimrc
    ln -s ~/dotfiles/zsh/.zshrc .zshrc
```

Install Vundle:

```
    mkdir ~/.vim
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
````

Install plugins with `vim`, `:PluginInstall`.
