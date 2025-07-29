#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'

# https://bash-prompt-generator.org/
PS1='\n\[\e[38;5;204m\]\[\e[7m\]󰀉  \u \[\e[27;48;5;238m\]\[\e[39m\]   \w \[\e[0;38;5;238m\]\[\e[0m\] '
