# ~/.profile
#
# Personal .profile file for interactive Bourne shells (sh(1)) and Bourne
# compatible shells (bash(1), ksh(1), ash(1), csh(1), zsh(1), ...).
#
# http://dev.snakevil.be/profiles/profile
#
# AUTHOR         Snakevil Zen <zsnakevil at gmail dot com>
# VERSION        1.0.0
# COPYRIGHT      (c) 2010 Snakevil.be/HERE

# Skipped for non-interactive shells.
[ -z "${PS1}" ] && return

# Rebuilds PATH to supports sbins for non-root users.
PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
PATHx="/opt/bin"
[ -d "${PATHx}" -a -r "${PATHx}" ] && PATH="${PATHx}:${PATH}"
PATHx="/opt/sbin"
[ -d "${PATHx}" -a -r "${PATHx}" ] && PATH="${PATHx}:${PATH}"
PATHx="/opt/local/bin"
[ -d "${PATHx}" -a -r "${PATHx}" ] && PATH="${PATHx}:${PATH}"
PATHx="/opt/local/sbin"
[ -d "${PATHx}" -a -r "${PATHx}" ] && PATH="${PATHx}:${PATH}"
PATHx="${HOME}/bin"
[ -d "${PATHx}" -a -r "${PATHx}" ] && PATH="${PATHx}:${PATH}"
export PATH

# Forces to use english UI and UTF-8 encoding.
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Detects used binaries.
vim --version > /dev/null 2>&1 && Bvim=`which vim`
dircolors --version > /dev/null 2>&1 && Bdircolors=`which dircolors`
ifconfig > /dev/null 2>&1 && Bifconfig=`which ifconfig`
awk -W version > /dev/null 2>&1 && Bawk=`which awk`
head --version > /dev/null 2>&1 && Bhead=`which head`
ps --version > /dev/null 2>&1 && Bps=`which ps`
grep --version > /dev/null 2>&1 && Bgrep=`which grep`
uname --version > /dev/null 2>&1 && Buname=`which uname`
wc --version > /dev/null 2>&1 && Bwc=`which wc`

# Forces to use VIM (vim(1)) as the default editor.
[ -n "${Bvim}" ] && export EDITOR="vim"

# Builds display colors for files.
[ -n "${Bdircolors}" ] && eval `dircolors -b`

# Gathers host ip.
SNAKEVIL_IP="127.0.0.1"
[ -n "${Bifconfig}" -a -n "${Bawk}" -a -n "${Bhead}" ] \
  && SNAKEVIL_IP=`ifconfig \
    | awk '/inet /&&!/127\./{sub("addr:","");print $2}' \
    | head -n1`

# Gathers shell type.
SNAKEVIL_SHELL="sh"
[ -n "${Bps}" -a -n "${Bgrep}" -a -n "${Bawk}" ] \
  && SNAKEVIL_SHELL=`ps | grep $$ | awk '{print $4}'`
if [ "sh" = "${SNAKEVIL_SHELL}" ]; then
  if [ -n "${BASH}" ]; then
    SNAKEVIL_SHELL="bash"
  elif [ -n "${KSH_VERSION}" ]; then
    SNAKEVIL_SHELL="ksh"
  fi
fi

# Gathers current load.
SNAKEVIL_LOAD="?.??"
uptime > /dev/null 2>&1 \
  && sed --version > /dev/null 2>&1 \
  && SNAKEVIL_LOAD="0.00"
export SNAKEVIL_LOAD

# Includes shell-specific rc file.
case "${SNAKEVIL_SHELL}" in
  bash )
    ENV="${HOME}/.bashrc"
  ;;
  *csh )
    ENV="${HOME}/.cshrc"
  ;;
  *ksh )
    ENV="${HOME}/.kshrc"
  ;;
  zsh )
    ENV="${HOME}/.zshrc"
  ;;
  * )
    ENV="${HOME}/.shrc"
  ;;
esac
export ENV
[ -f "${ENV}" ] && . "${ENV}"

# Includes common aliases.
[ -f "${HOME}/.aliasz" ] && . "${HOME}/.aliasz"

# Reclaims temporary variables.
unset PATHx
unset Bvim
unset Bdircolors
unset Bifconfig
unset Bawk
unset Bhead
unset Bps
unset Bgrep
unset Buname
unset Bwc

# vim:ft=sh:fenc=utf-8:ff=unix:nowrap:nu:nuw=4
# vim:tw=75:ts=2:sts=2:et:si:ai:sw=2
