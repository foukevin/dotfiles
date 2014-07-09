# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#if [ -f $HOME/.zshrc ]; then
#zstyle :compinstall filename $HOME/.zshrc
#fi
zstyle ":completion:*:commands" rehash 1
autoload -U compinstall
autoload -Uz compinit && compinit
unsetopt beep
bindkey -e

#=============================================================
# History configuration
#=============================================================
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=$HISTSIZE
setopt inc_append_history
setopt hist_ignore_all_dups
setopt share_history

#=============================================================
# Color output
#=============================================================
case $(uname -s) in
  Linux)
    alias ls='ls --color=auto'
    ;;
  Darwin|FreeBSD)
    export CLICOLOR=1
    # export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
    export LSCOLORS=ExFxCxDxBxegedabagacad
    alias ls="ls -G"
    ;;
esac

export GREP_OPTIONS='--color=auto'

#=============================================================
# git prompt status
#=============================================================
if [ -f /usr/share/git/git-prompt.sh ]; then
. /usr/share/git/git-prompt.sh
elif [ -f /opt/local/share/git/git-prompt.sh ]; then
. /opt/local/share/git/git-prompt.sh
fi

prompt_custom_setup () {
  setopt PROMPT_SUBST
  autoload -U colors && colors
  local userhost=${1:-'white'}
  local cwd=${2:-'blue'}
  local gitstatus=${3:-'yellow'}
  GIT_PS1_SHOWDIRTYSTATE=true
  GIT_STATUS='$(__git_ps1 "(%s)")'
  PROMPT_NEWLINE=$(echo -ne "\n%{\r%}")
  PS1="%B%F{$userhost}%n@%m %F{$cwd}%~ %F{$gitstatus}${GIT_STATUS}%b%f$PROMPT_NEWLINE%# "
  PS2="%# "
}

prompt_custom_setup

# git aliases
if [ -f $HOME/.gitconfig ]; then
  alias gl='git lg -20'
  alias gs='git status'
fi

#=============================================================
# Key binding
#=============================================================
# Make home, insert, delete and end work on PCs basically# like in doskey. This
# may or may not work for you... the \e is the ESC character. To set this up
# for your favourite system, type cat > rubbish, press the keys of interest,
# then enter here what you see. You should replace ^[ (escape) with \e.

case $TERM in
    *xterm*|rxvt|(u|dt|k|E)term)
    bindkey "\e[1~" beginning-of-line
    bindkey "\e[3~" delete-char
    bindkey "\e[4~" end-of-line
    bindkey "\177" backward-delete-char
    bindkey "\e[2~" overwrite-mode

    bindkey "\e[7~" beginning-of-line
    bindkey "\e[H" beginning-of-line
    bindkey "\eOH" beginning-of-line
    #bindkey "\e[2~" transpose-words
    bindkey "\e[8~" end-of-line
    bindkey "\e[F" end-of-line
    bindkey "\eOF" end-of-line

    bindkey "\e[A" history-beginning-search-backward
    bindkey "\e[B" history-beginning-search-forward
    ;;
esac

#=============================================================
# Source .profile
#=============================================================
if [ -f ~/.profile ]; then
. ~/.profile
fi
