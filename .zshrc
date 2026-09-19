# Path to your oh-my-zsh installation.
export ZSH=/Users/kyle/.oh-my-zsh

# Secrets (API keys, tokens, hosts) live in an untracked file so this repo can be public
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(rails git)

# User configuration
export PATH=$PATH:/Users/kyle/scripts::/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin
export PATH=$PATH:~/Library/Python/3.9/bin

# android stuff!
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools


export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_201.jdk/Contents/Home
export PATH=$JAVA_HOME/bin:$PATH

export NVM_DIR="/Users/kyle/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# fastlane
export PATH="$HOME/.fastlane/bin:$PATH"

# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

export VISUAL=nvim
export EDITOR="$VISUAL"

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#

# FASD hook
eval "$(fasd --init auto)"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias -g GM=groupmuse
alias -g GME='groupmuse-edge'
alias -g GMS='groupmuse-staging'
alias -g GMP=groupmusepages
alias -g GMR='groupmuse-rails'
alias -g JOC=jumpoffcampus
alias -g J5=jumpoffcampus-5
alias -g J5S=jumpoffcampus-5-staging
alias -g SBAS='sunrisebayarea-spoke'
alias -g JOCS='jumpoffcampus-staging'
alias -g J5='jumpoffcampus-5'
alias -g J5S='jumpoffcampus-5-staging'
alias -g EBD=eastbaydsa
alias -g EBDS=eastbaydsa-staging

alias rndb='open "rndebugger://set-debugger-loc?host=localhost&port=8081"'

alias gpt=chatgpt
alias rgrep=grep -rin
alias rs='find_and_kill_ruby_server; rails server'
alias groupmuse-s='find_and_kill_ruby_server; concurrently "rails s" "redis-server" "stripe listen --latest --events payment_intent.created,payment_intent.succeeded,payment_intent.payment_failed,invoice.paid,invoice.created --forward-to localhost:3000/stripe/events/webhook --forward-connect-to localhost:3000/stripe/events/webhook"'
alias rs4='rails server -p 4000'
alias rc='rails console'

# Git!
alias gs='git status'
alias gaa='git add . -A'
alias gc='git commit -am'
alias rj='bin/rails jobs:work'
alias rjc='bin/rails jobs:clear'
alias git-delete-merged='git branch --merged master | grep -v "\* master" | xargs -n 1 git branch -d'

alias so='source ~/.zshrc'
alias gpom='git push origin master'
alias gpo='git push origin'
alias gpdm='git push dokku main:master && echo "==================================" && echo "Deploy complete, restarting app..." && echo "==================================" && ssh root@$DOKKU_HOST dokku ps:restart jumpoffcampus'

alias clearDS='sudo find / -name ".DS_Store" -depth -exec rm {} \;'

# Brewfile!
alias bb='cd ~/.dotfiles && brew bundle'

# Terminal-notifier
alias notify='terminal-notifier -message '

# Macvim
export PATH=$PATH:/Applications/MacVim.app/Contents/bin
alias m='mvim'
alias n='nvim'
alias how2r='how2 -l ruby'

alias b='bundle exec'

alias git-clear='git branch --merged | egrep -v "(^\*|master|main|dev)" | xargs git branch -d'

# disable autocorrect for necessary commands
#alias rspec='nocorrect rspec'

# Don't correct me!
DISABLE_CORRECTION="true"
ENABLE_CORRECTION="false"

eval "$(rbenv init -)"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

ulimit -n 65536 # increase the number of open files (required for chromedriver not to crash on my groupmuse tests)

# opencode
export PATH=/Users/kyle/.opencode/bin:$PATH
export PATH="$HOME/.local/bin:$PATH"

# peon-ping quick controls
alias peon="bash /Users/kyle/.claude/hooks/peon-ping/peon.sh"
[ -f /Users/kyle/.claude/hooks/peon-ping/completions.bash ] && source /Users/kyle/.claude/hooks/peon-ping/completions.bash

# kyletns-shortener
shorten() {
  local base="https://link.kyletns.com"
  local token="$SHORTENER_TOKEN"
  local code url
  if [ $# -eq 1 ]; then
    url="$1"
  elif [ $# -eq 2 ]; then
    code="$1"; url="$2"
  else
    echo "usage: shorten [code] <url>" >&2; return 1
  fi
  local payload
  if [ -n "$code" ]; then
    payload=$(printf '{"code":"%s","url":"%s"}' "$code" "$url")
  else
    payload=$(printf '{"url":"%s"}' "$url")
  fi
  local resp
  resp=$(curl -s -X POST "$base/api/create" \
    -H "Authorization: Bearer $token" \
    -H "content-type: application/json" \
    -d "$payload")
  local got
  got=$(printf '%s' "$resp" | python3 -c 'import json,sys;d=json.load(sys.stdin);print(d.get("code") or d.get("error",""))')
  if printf '%s' "$resp" | grep -q '"ok":true'; then
    local short="$base/$got"
    printf '%s\n' "$short"
    printf '%s' "$short" | pbcopy
  else
    echo "error: $got" >&2; return 1
  fi
}

# auto-switch node version from .nvmrc
autoload -U add-zsh-hook
  load-nvmrc() {
    local nvmrc_path="$(nvm_find_nvmrc)"
    if [ -n "$nvmrc_path" ]; then
      local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")
      if [ "$nvmrc_node_version" = "N/A" ]; then
        nvm install
      elif [ "$nvmrc_node_version" != "$(nvm version)" ]; then
        nvm use
      fi
    elif [ -n "$(PWD=$OLDPWD nvm_find_nvmrc)" ] && [ "$(nvm version)" != "$(nvm version default)" ]; then
      nvm use default
    fi
  }
  add-zsh-hook chpwd load-nvmrc
  load-nvmrc

# bun completions
[ -s "/Users/kyle/.bun/_bun" ] && source "/Users/kyle/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

# claude code provider switcher — profiles live in ~/.claude/providers/*.json
cc() {
  local dir="$HOME/.claude/providers"
  if [[ "$1" == "ls" ]]; then
    ls -1 "$dir"/*.json 2>/dev/null | xargs -n1 basename | sed 's/\.json$//'
    return
  fi
  if [[ -n "$1" && -f "$dir/$1.json" ]]; then
    local profile="$1"; shift
    claude --settings "$dir/$profile.json" "$@"
  else
    claude "$@"
  fi
}
compdef '_files -W ~/.claude/providers -g "*.json(:r)"' cc 2>/dev/null

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/kyle/.lmstudio/bin"
# End of LM Studio CLI section

