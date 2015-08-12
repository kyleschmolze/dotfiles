# Path to your oh-my-zsh installation.
export ZSH=/Users/kyle/.oh-my-zsh

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
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

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
plugins=(git)

# User configuration

export PATH=$PATH:"/Users/kyle/.rvm/gems/ruby-2.0.0-p643/bin:/Users/kyle/.rvm/gems/ruby-2.0.0-p643@global/bin:/Users/kyle/.rvm/rubies/ruby-2.0.0-p643/bin:/Users/kyle/.rvm/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.4/bin

# android stuff!
export PATH=$PATH:/Users/kyle/Library/Android/sdk/tools # ant
export PATH=$PATH:/Users/kyle/Library/Android/sdk/platform-tools # adb
export PATH=$PATH:/Users/kyle/Library/Android/sdk/build-tools/22.0.1 # zipalign

export NVM_DIR="/Users/kyle/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm


# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

export VISUAL=vim
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

# Hub hook
eval "$(hub alias -s)"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias -g GM=groupmuse
alias -g GMS=groupmuse-staging
alias -g GMP=groupmusepages
alias -g GMR=groupmuse-rails
alias -g JOC=jumpoffcampus

alias rgrep=grep -rin
alias rs='redis-server &; rails server'
alias rs4='rails server -p 4000'
alias rc='rails console'
alias -g rg='rails generate'

alias hrc='heroku run console'
alias hl='heroku logs -t'

# Git!
alias gs='git status'
alias gaa='git add . -A'
alias gc='git commit -am'
alias rdbm='rake db:migrate'
alias rdbrb='rake db:rollback'
alias rdbms='rake db:migrate:status'
alias rdbsl='rake db:schema:load'
alias rdbtp='rake db:test:prepare'
alias rdbtl='rake db:test:load'
alias rr='rake routes'
alias rj='rake jobs:work'
alias rjc='rake jobs:clear'

alias so='source ~/.zshrc'
alias gpom='git push origin master'
alias gphm='git push heroku master'
alias gphmrdbm='git push heroku master; heroku run rake db:migrate -a groupmuse; heroku restart'
alias hrrdbm='heroku run rake db:migrate'

alias clearDS='sudo find / -name ".DS_Store" -depth -exec rm {} \;'

# Brewfile!
alias bb='cd ~/.dotfiles && brew bundle'

# Terminal-notifier
alias notify='terminal-notifier -message '

# Macvim
alias m='mvim'

# Don't correct me!
DISABLE_CORRECTION="true"

