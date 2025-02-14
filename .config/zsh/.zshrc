#612698 == Initial ==============================================================={{{

# ------------
fpath=(/usr/share/zsh/functions $fpath)
# ------------

# Command history size
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.histfile

# The following lines were added by compinstall
zstyle :compinstall filename '~/.config/zsh/.zshrc'

# Starship prompt theme
eval "$(starship init zsh)"

# }}}

# == VIM Mode =============================================================={{{

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# ZSH Key Mode
bindkey -v              # Vim mode
export KEYTIMEOUT=1     # For error with vi mode and autofill

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}

zle -N zle-keymap-select
zle-line-init() {
    zle -K viins    # Initiate to vim insert mode
    echo -ne "\e[5 q"   # Beam cursor
}
zle -N zle-line-init
echo -ne '\e[5 q' # cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # cursor for each new prompt.

# Edit command line in vim with ctrl-e:
autoload -z edit-command-line
zle -N edit-command-line
bindkey '^e' edit-command-line

# }}}

# == Aliases ==============================================================={{{
DEV="$HOME/Files/Dev"
ALXSE="$DEV/Alx/programs/software_engineering"

# System aliases
alias ls='ls --color=auto -l'
alias l='ls --color=auto -l'
alias grep='grep --color=auto'
alias pacman='pacman --color auto'

# Alx aliases
alias alxse="cd $ALXSE"
alias alxse_projects="cd $ALXSE/projects"
alias alxse_practice="cd $ALXSE/practice"
# alias alx_kitten_sandbox='kitten ssh alxsandbox@192.168.122.121'

# CLI aliases
alias gcc_alx='gcc -Wall -Wextra -Werror -pedantic -std=gnu89 -g'
alias val_full='valgrind --show-leak-kinds=all --track-origins=yes -s'
alias betty_ch='betty *.[ch]'
alias ghidra="$DEV/tools/ghidra/ghidra_10.3.3_PUBLIC/ghidraRun"
alias w3c="$DEV/tools/others/W3C-Validator/w3c_validator.py"
alias semijs="semistandard"
alias mysql='mariadb'
# alias live-server="live-server --browser='firefox-developer-edition'"

# Developer aliases
alias dev="cd $DEV/"
alias dev_web="cd $DEV/Web-Development"
alias dev_mobile="cd $DEV/Mobile-Development"
alias dev_data_analyst="cd $DEV/Data-Analyst"

# Java aliases
alias run_java="$DEV/tools/terminal/run_java.sh"

# Experimental
alias git_commit="$DEV/tools/terminal/git_commit.sh"
alias git_dotfiles="git --git-dir=$HOME/.dotfiles --work-tree=$HOME "

# Senbet
alias senbet="cd '/home/eyob721/Files/ኦርቶዶክስ ተዋሕዶ/ሰንበት ትምህርት/'"

# Reload zsh
alias reload_zsh="exec '$SHELL'"

# }}}

# == Completion ============================================================{{{

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# }}}

# == Misc =================================================================={{{

# ibus daemon autostart
# export GTK_IM_MODULE=ibus
# export XMODIFIERS=@im=ibus
# export QT_IM_MODULE=ibus
# ibus-daemon -rxRd

# choose editor
export EDITOR=nvim
export VISUAL=nvim

# Pyenv settings
if [[ -e $(which pyenv) ]]; then
    export PYENV_ROOT="$HOME/.pyenv"
    [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi

# pip3 requires $HOME/.local/bin to be in PATH
if [[ -e $(which pip3) ]]; then
    export PATH="$PATH:$HOME/.local/bin"
fi

# Add ruby to PATH for gem executables
if [[ -e $(which ruby) ]]; then
    export PATH="$PATH:$HOME/.local/share/gem/ruby/3.0.0/bin"
fi

# Homebrew
if [[ -e $(which brew) ]]; then
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

# Load zsh-syntax-highlighting; should be last.
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

# Start tmux if no tmux session has started already
if [[ -e $(which tmux) ]]; then
    TMUX_SESSION_NAME="manjaro"

    if [[ -z "$TMUX" ]]; then
        tmux new-session -A -s $TMUX_SESSION_NAME
    fi
fi

# ssh-agent service environemnt variable
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

# }}}
