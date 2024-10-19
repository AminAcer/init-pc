# Bash configuration

alias ls='ls --color=auto'
alias sb='source ~/.bashrc'
alias vimb='vim ~/.bashrc'

# For git ------------------------
alias gs='git status'
alias ga='git add .'
alias gp='git push'
alias gf='git fetch'
alias gc='git commit -m'
alias gpl='git pull'
alias crun='cargo run'
alias cbld='cargo build'
alias pyrun='python3 .'
alias pyenv='source myenv/bin/activate'
alias vimb='vim ~/.bashrc'

# GIT
git config --global user.email "aminvatsal1999@gmail.com"
git config --global user.name "aminvatsal1999"
git config --global credential.helper store

# Env variables -----------------
export PYTHONPATH=../:.
export PATH=$HOME/dev/flutter/bin:$HOME/dev/cmdline-tools/bin/:$PATH
