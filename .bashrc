# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
  # We have color support; assume it's compliant with Ecma-48
  # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
  # a case would tend to support setf rather than setaf.)
  color_prompt=yes
    else
  color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
PS1="\[\e[00;37m\]\u\[\e[0m\]\[\e[00;36m\]@\[\e[0m\]\[\e[00;33m\]\h\[\e[0m\]\[\e[00;37m\]{\[\e[0m\]\[\e[00;36m\][\[\e[0m\]\[\e[00;37m\]\A\[\e[0m\]\[\e[00;36m\]]\[\e[0m\]\[\e[00;32m\]->\[\e[0m\]\[\e[00;31m\]\w\[\e[0m\]\[\e[00;37m\]}\[\e[0m\]\[\e[00;32m\]:\[\e[0m\]\[\e[00;37m\] \[\e[0m\]"
else
PS1="\[\e[00;37m\]\u\[\e[0m\]\[\e[00;36m\]@\[\e[0m\]\[\e[00;33m\]\h\[\e[0m\]\[\e[00;37m\]{\[\e[0m\]\[\e[00;36m\][\[\e[0m\]\[\e[00;37m\]\A\[\e[0m\]\[\e[00;36m\]]\[\e[0m\]\[\e[00;32m\]->\[\e[0m\]\[\e[00;31m\]\w\[\e[0m\]\[\e[00;37m\]}\[\e[0m\]\[\e[00;32m\]:\[\e[0m\]\[\e[00;37m\] \[\e[0m\]"
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls -las --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -as'
alias la='ls -A'
#alias l='ls -CF'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# some cool stuff

# Some information about your system
hsname=`uname -n`
KERNEL=`uname -r`
ARCH=`uname -m`
CPU=`uname -p`

# Colorcodes packed into handy variables - adjust to your will
W="\033[01;37m"
B="\033[01;34m"
R="\033[01;31m"
G="\033[00;37m"
N="\033[0m"

cat .nexus2
echo -en '\n'
echo -en "$W Hi, $(whoami), today is $(date +%A).\n"
echo -en "\033[1;36m"
cowsay -f tux "$(fortune)"
echo -en "\033[0m\n"
echo -en "$G Have a lot of Fun here!!\n\n$N"

echo -e "$W| $R KERNEL     $W= $KERNEL  $W|"
echo -e "$W| $R CPU        $W= $CPU     $W|"
echo -e "$W| $R ARCH       $W= $ARCH    $W|"
echo -e "$W| $R MASCHINE   $W= $hsname  $W|"

echo -e "\n"
