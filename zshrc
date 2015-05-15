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
setopt append_history
setopt inc_append_history
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_expire_dups_first
setopt share_history

autoload -Uz up-line-or-beginning-search
autoload -Uz down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

#=============================================================
# Color output
#=============================================================
LS_OPTIONS=""
unalias ls
case $(uname -s) in
	Linux)
		LS_OPTIONS+=" --color=auto"
		;;
	Darwin|FreeBSD)
		export CLICOLOR=1
		# export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
		export LSCOLORS=ExFxCxDxBxegedabagacad
		LS_OPTIONS+=" -G"
		;;
esac
alias ls="$(which ls) $LS_OPTIONS"
unset LS_OPTIONS

#=============================================================
# Grep output
#=============================================================
VCS_FOLDERS="{.bzr,.cvs,.git,.hg,.svn}"
GREP_OPTIONS="--color=auto"
GREP_OPTIONS+=" --exclude=tags,$VCS_FOLDERS"
GREP_OPTIONS+=" --exclude-dir=$VCS_FOLDERS"
alias grep="/usr/bin/grep $GREP_OPTIONS"
unset GREP_OPTIONS
unset VCS_FOLDER

#=============================================================
# git prompt status
#=============================================================
if [ -f /usr/share/git/git-prompt.sh ]; then
. /usr/share/git/git-prompt.sh
elif [ -f /usr/lib/git-core/git-sh-prompt ]; then
. /usr/lib/git-core/git-sh-prompt
elif [ -f /opt/local/share/git/git-prompt.sh ]; then
. /opt/local/share/git/git-prompt.sh
elif [ -f /usr/local/git/contrib/completion/git-prompt.sh ]; then
. /usr/local/git/contrib/completion/git-prompt.sh
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
# Make home, insert, delete and end work on PCs basically like in doskey. This
# may or may not work for you... the \e is the ESC character. To set this up
# for your favourite system, type cat > /dev/null, press the keys of interest,
# then enter here what you see. You should replace ^[ (escape) with \e.

case $TERM in
    *xterm*|rxvt|(u|dt|k|E)term)
    bindkey '\e[1~' beginning-of-line
    bindkey '\e[3~' delete-char
    bindkey '\e[4~' end-of-line
    bindkey '\177' backward-delete-char
    bindkey '\e[2~' overwrite-mode

    bindkey '\e[7~' beginning-of-line
    bindkey '\e[H' beginning-of-line
    bindkey '\eOH' beginning-of-line
    #bindkey '\e[2~' transpose-words
    bindkey '\e[8~' end-of-line
    bindkey '\e[F' end-of-line
    bindkey '\eOF' end-of-line

    bindkey '\eOA' up-line-or-beginning-search
    bindkey '\e[A' up-line-or-beginning-search
    bindkey '\eOB' down-line-or-beginning-search
    bindkey '\e[B' down-line-or-beginning-search
    ;;
esac

#=============================================================
# Source .profile
#=============================================================
if [ -f ~/.profile ]; then
. ~/.profile
fi
