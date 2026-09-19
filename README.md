### Setup (new Mac)

1. Install Xcode dev tools: `xcode-select --install`
2. Install Homebrew: https://brew.sh
3. Clone and symlink:

```
  git clone git@github.com:kyletns/dotfiles.git ~/.dotfiles
  cd ~
  ln -s ~/.dotfiles/.zshrc
  ln -s ~/.dotfiles/.vimrc

  mkdir -p ~/.config/nvim
  ln -s ~/.dotfiles/nvim/init.vim ~/.config/nvim/init.vim

  mkdir -p ~/.vim/backup ~/.vim/swap ~/.vim/undo
```

4. zsh + oh-my-zsh:

```
  chsh -s $(which zsh)
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

   The oh-my-zsh installer overwrites `~/.zshrc`; if it replaces your symlink, run
   `cd ~/.dotfiles && git checkout .zshrc` and re-create the symlink.

5. Vim plugins (managed with [vim-plug](https://github.com/junegunn/vim-plug)):

```
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  vim +PlugInstall +qall
```

6. Secrets. API keys and tokens are **not** in this repo (it's public). Create
   `~/.zshrc.local` (git-ignored, sourced by `.zshrc`) with:

```
  export OPENAI_API_KEY="..."
  export ANTHROPIC_API_KEY="..."
  export GEMINI_API_KEY="..."
  export DEEPSEEK_API_KEY="..."
  export SHORTENER_TOKEN="..."   # used by the `shorten` function
  export DOKKU_HOST="..."        # used by the `gpdm` alias
```

   then `chmod 600 ~/.zshrc.local`.

7. Brew bundle. NOTE: the Brewfile is old (2018) and needs a refresh before it
   works on a current Homebrew.

```
  brew bundle
```

#### Additional notes

Postgres.app

Once setup, ensure that the version/directory in ~/.zshrc correctly appends
the postgres tools to your PATH.
