#
# ~/.bashrc
#

# ---
# Default prompt
# PS1='[\u@\h \W]\$ '

# Default aliases
# alias ls='ls --color=auto'
# alias grep='grep --color=auto'
# ---

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# My Custom config
# -------------------------------------------------------------

# COLORS
WHITE='\[\033[00m\]'
GREEN='\[\033[01;32m\]'
BLUE='\[\033[01;34m\]'
RED='\[\033[01;31m\]'

PS1="[$GREEN\u$WHITE:$BLUE\W$WHITE]\$ "

# Starship prompt theme
eval "$(starship init bash)"

# System aliases
alias ls='ls --color=auto -l'
alias grep='grep --color=auto'
alias pacman='pacman --color auto'

# Alx aliases
alias alx_work='cd ~/Files/Alx/Workspace'
alias alx_projects='cd ~/Files/Alx/Workspace/projects'
alias alx_learning='cd ~/Files/Alx/Workspace/learning'
alias gcc_alx='gcc -Wall -Wextra -Werror -pedantic -std=gnu89 -g'
alias val_full='valgrind --show-leak-kinds=all --track-origins=yes -s'
alias betty_ch='betty *.[ch]'
alias ghidra='/home/eyob721/Files/Alx/Workspace/tools/ghidra/ghidra_10.3.3_PUBLIC/ghidraRun'

# -------------------------------------------------------------
# End of My Custom config

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"
set -o vi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/papi721/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/papi721/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/papi721/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/papi721/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

