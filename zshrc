# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
export UPDATE_ZSH_DAYS=7

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Determine platform bins
if [[ "$OSTYPE" == "linux-gnu" ]]; then
    bins='/usr/bin'
elif [[ "$OSTYPE" == "darwin"* ]]; then
    bins='/usr/local/bin'
    DISABLE_AUTO_TITLE="true"
fi

unsetopt correct_all
unsetopt correct

# Code Review
UPLOAD_PY="${HOME}/Code/kernel-tools/codereview/upload.py"
CR_SERVER="codereview.10gen.com"
alias cr="python $UPLOAD_PY -y -s $CR_SERVER -m"

# Customize to your needs...
export PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/share/npm/bin:${HOME}/Code/mongo

# Python
export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENV_DISTRIBUTE=true
export VIRTUALENVWRAPPER_PYTHON=${bins}/python2.7
export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages'
export VIRTUAL_ENV_DISABLE_PROMPT=true
export PIP_VIRTUALENV_BASE=$WORKON_HOME
export PIP_REQUIRE_VIRTUALENV=true
export PIP_RESPECT_VIRTUALENV=true
export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache

if [[ -r ${bins}/virtualenvwrapper.sh ]]; then
    source ${bins}/virtualenvwrapper.sh
fi

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git rbenv ruby jruby gem rake python node fabric rsync jira sublime virtualenv zsh-syntax-highlighting)

# Disable Autocorrect
alias git lg='nocorrect git lg'

# Deploy xgen docs
DEPLOY_CMD="ops/systems/apache/www-c/deploy api master"
API_DEPLOY_EAST="ssh 10gen-east ${DEPLOY_CMD}"
API_DEPLOY_WEST="ssh 10gen-west ${DEPLOY_CMD}"
alias deploy-api-docs="${API_DEPLOY_EAST} && ${API_DEPLOY_WEST}"

# AWS
export AWS_DEFAULT_REGION=us-east-1

# rbenv
#eval "$(rbenv init -)"

export EDITOR="vim"
export MAKE_OPTS="-j8"

MONGOD_ARGS="--smallfiles --noprealloc --nojournal --jsonp"
alias mongod="mongod ${MONGOD_ARGS}"
alias smoke="${HOME}/Code/buildscripts/smoke.py"

alias gs="git status"
alias gp="git pull --rebase"

alias gentags="ctags -R --extra=+qf --fields=+iasnfSKtm --c++-kinds=+p --sort=foldcase"

export TERM="xterm-256color"

# syntax highlighting
#source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#ZSH_HIGHLIGHT_STYLES[path]='fg=cyan'
export JAVA_HOME="/Library/Internet Plug-Ins/JavaAppletPlugin.plugin/Contents/Home"

# load oh-my-zsh
source $ZSH/oh-my-zsh.sh

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

## COLOR Man pages and other stuff
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'
