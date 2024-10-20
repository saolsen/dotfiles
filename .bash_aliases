alias ll='ls -l'
alias la='ls -A'
alias lla='ls -l -A'
alias l='ls -CF'

alias genv='printenv | grep -i'
alias path='echo -e ${PATH//:/\\n} | less'
alias now='date +"%T"'
alias nowd='date +"%d-%m-%Y"'
alias df='df -h'
alias dusage='du -sh * 2>/dev/null'

alias pint='ping -c 5'
alias fastping='ping -c 100 -i 0.2'

alias emacs="emacsclient -t -a ''"
