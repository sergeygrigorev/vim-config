alias sudo='sudo '

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias ip='ip --color=auto'

alias l='ls -lh'
alias ll='ls -lha'

alias gc='git commit -m'
alias gca='git commit -am'
alias gcane='git commit --amend --no-edit'
alias gs='git status'
alias gf='git fetch'
alias gps='git push'
alias gpsa='git remote | xargs -I{} git push {}'
alias gpl='git pull'
alias gl='git log'
alias glo='git log --oneline'

alias df-install="$DOTFILES_DIR/install.sh && source ~/.bashrc && source ~/user.bashrc"
