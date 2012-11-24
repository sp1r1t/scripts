# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle :compinstall filename '/home/jinn/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd nomatch notify
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install

# Jinn's customization

function prompt_char {
    git branch >/dev/null 2>/dev/null && echo '±' && return 
    echo '$'
}

function git_branch {
    git branch >/dev/null 2>/dev/null && echo $(git branch | grep "*" | sed 's/* //')
}

PROMPT='%{%F{blue}%}%n%{%F{white}%}@%{%F{cyan}%}%m%{%F{reset}%}:%~$(prompt_char) '
RPROMPT='$(git_branch) $(date +%H:%M

