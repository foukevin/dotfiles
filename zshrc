# The following lines were added by compinstall
zstyle :compinstall filename '/home/kdelbrayelle/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install

# color output
alias ls='ls --color=auto'
export GREP_OPTIONS='--color=auto'

# git prompt status
if [ -f /usr/share/git/git-prompt.sh ]; then
. /usr/share/git/git-prompt.sh
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
    ;;
esac
