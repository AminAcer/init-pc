export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

alias ll='ls -l'
alias sb='source ~/.bashrc'

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
alias deac='deactivate'
alias vimb='vim ~/.bashrc'

alias cac='conda activate ml4t'


# Env variables -----------------
export PYTHONPATH=../:.
export PATH=$HOME/dev/flutter/bin:$HOME/dev/cmdline-tools/bin/:$PATH
