# LINUX SETTINGS (not needed for mac)
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'
# END LINUX SETTINGS


# Git Prompt
source ~/.git-prompt.sh

# Coloring bash
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export PS1='\[\033[38;5;9m\]\u\[\033[38;5;15m\] @ \[\033[38;5;10m\]$(__git_ps1 "⎇ (%s) ")\[\033[38;5;14m\]\w\[\033[38;5;9m\]\n❤ \[$(tput sgr0)\]'
# vv found on stack overflow to fix coloring vv
export TERM=xterm-256color

### Added by the Heroku Toolbelt and other things
export PATH="/usr/local/heroku/bin:$PATH"
export PATH="/usr/local/smlnj/bin:$PATH"
export PATH="/Applications/Postgres.app/Contents/Versions/9.3/bin:$PATH"
# export JAVA_HOME=$(/usr/libexec/java_home)
# export PYTHONPATH=/usr/local/lib/python2.7/site-packages:$PYTHONPATH

### GOLANG
export GOPATH=/Users/granttimmerman/Documents/github
export PATH=$PATH:$GOPATH/bin

### Shortcuts

alias ss='python -m SimpleHTTPServer'
alias attu='ssh gctimmer@attu.cs.washington.edu'

alias p='pwd'

alias c='cd'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias ~='cd ~'

alias l='ls -al'
alias sl='ls'

# Makes a directory and goes to it
function m () { mkdir -p "$@" && eval cd "\"\$$#\""; }

alias st="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl "
alias preview="open -a 'Preview'"

alias z="du -sh ."

# History

export HISTFILESIZE=20000
export HISTSIZE=10000
shopt -s histappend
# Combine multiline commands into one in history
shopt -s cmdhist
# Ignore duplicates, ls without options and builtin commands
HISTCONTROL=ignoredups
export HISTIGNORE="&:ls:[bf]g:exit"

# Git

alias g='git'
alias pull='git pull --all'
alias push='git push'
alias gc='git commit -m $1'
alias ga='git add -A'
alias clone='git clone'
# Adds all and commits (gg 'Commit message')
function gg () {
  git add -A;
  git commit -m "$1";
  git push;
}
# Create gh pages
function gh () {
  git checkout --orphan gh-pages;
}
# Pushes to gh pages
function ghpush () {
  git checkout gh-pages;
  git rebase master;
  git push origin gh-pages;
  git checkout master;
}
alias gs='git status -sb'
alias gd='git diff --color'
alias gdc='git diff --cached'
alias gstat='git diff --stat'
alias log='git log --all --graph --decorate --oneline --abbrev-commit'
git config --global help.autocorrect 1
alias master='git checkout master'

# Other


# Create a new directory and enter it
function md() {
  mkdir -p "$@" && cd "$@"
}

# find shorthand
function f() {
  find . -name "$1" 2>&1 | grep -v 'Permission denied'
}

# Start an HTTP server from a directory, optionally specifying the port
function server() {
  local port="${1:-8000}"
  open "http://localhost:${port}/" &
  # statik is good because it won't expose hidden folders/files by default.
  # npm install -g statik
  statik --port "$port" .
}

alias gf='gofmt -s -w .'

# Search history for term
alias his='history | grep $1'

# Copy Working Directory
alias cwd='printf "%q\n" "$(pwd)" | pbcopy'

# Get the number of lines of a certain filetype in the current working directory
function lines () { find . -name "*.$1" | xargs wc -l; }

alias chrome='open /Applications/Google\ Chrome.app'
alias canary='open /Applications/Google\ Chrome\ Canary.app'

### Help
alias h="echo 'p c ~ .. ... l m st preview sz g pull push gc ga gg gs gd gdc gstat his cwd lines'"

export NVM_DIR="/Users/granttimmerman/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

[[ -s "/Users/granttimmerman/.gvm/scripts/gvm" ]] && source "/Users/granttimmerman/.gvm/scripts/gvm"
export GOPATH=$HOME/Documents/go
export PATH=$PATH:$GOPATH/Documents/bin
