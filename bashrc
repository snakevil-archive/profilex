# ~/.bashrc
#
# Personal .bashrc file for interactive Bourne Again shells (bash(1)).
#
# http://dev.snakevil.be/profiles/bashrc
#
# AUTHOR         Snakevil Zen <zsnakevil at gmail dot com>
# VERSION        1.1.0
# COPYRIGHT      (c) 2010 Snakevil.be/HERE

# Defines attributes in ANSI colors.
COLOR_ATTRIBUTE_RESET='\e[0m'
CANormal=$COLOR_ATTRIBUTE_RESET
CAReset=$COLOR_ATTRIBUTE_RESET
COLOR_ATTRIBUTE_BOLD='\e[1m'
CABold=$COLOR_ATTRIBUTE_BOLD
CABright=$COLOR_ATTRIBUTE_BOLD
CAHigh=$COLOR_ATTRIBUTE_BOLD
CAHighlight=$COLOR_ATTRIBUTE_BOLD
COLOR_ATTRIBUTE_ITALIC='\e[3m'
CAItalic=$COLOR_ATTRIBUTE_ITALIC
CAItalics=$COLOR_ATTRIBUTE_ITALIC
COLOR_ATTRIBUTE_UNDERLINE='\e[4m'
CAUnder=$COLOR_ATTRIBUTE_UNDERLINE
CAUnderline=$COLOR_ATTRIBUTE_UNDERLINE
COLOR_ATTRIBUTE_BLINK='\e[5m'
CABlink=$COLOR_ATTRIBUTE_BLINK
COLOR_ATTRIBUTE_REVERSE='\e[7m'
CAInverse=$COLOR_ATTRIBUTE_REVERSE
CAReverse=$COLOR_ATTRIBUTE_REVERSE
COLOR_ATTRIBUTE_CONCEAL='\e[8m'
CAConceal=$COLOR_ATTRIBUTE_CONCEAL
CAInvisible=$COLOR_ATTRIBUTE_CONCEAL
COLOR_ATTRIBUTE_DELETED='\e[9m'
CADeleted=$COLOR_ATTRIBUTE_DELETED
CAThrough=$COLOR_ATTRIBUTE_DELETED

# Defines text colors in ANSI colors.
COLOR_TEXT_BLACK='\e[30m'
CFBlack=$COLOR_TEXT_BLACK
CTBlack=$COLOR_TEXT_BLACK
COLOR_TEXT_RED='\e[31m'
CFRed=$COLOR_TEXT_RED
CTRed=$COLOR_TEXT_RED
COLOR_TEXT_GREEN='\e[32m'
CFGreen=$COLOR_TEXT_GREEN
CTGreen=$COLOR_TEXT_GREEN
COLOR_TEXT_YELLOW='\e[33m'
CFYellow=$COLOR_TEXT_YELLOW
CTYellow=$COLOR_TEXT_YELLOW
COLOR_TEXT_BLUE='\e[34m'
CFBlue=$COLOR_TEXT_BLUE
CTBlue=$COLOR_TEXT_BLUE
COLOR_TEXT_MAGENTA='\e[35m'
CFMagenta=$COLOR_TEXT_MAGENTA
CTMagenta=$COLOR_TEXT_MAGENTA
COLOR_TEXT_CYAN='\e[36m'
CFCyan=$COLOR_TEXT_CYAN
CTCyan=$COLOR_TEXT_CYAN
COLOR_TEXT_WHITE='\e[37m'
CFWhite=$COLOR_TEXT_WHITE
CTWhite=$COLOR_TEXT_WHITE
COLOR_TEXT_DEFFAULT='\e[39m'
CFDefault=$COLOR_TEXT_DEFFAULT
CTDefault=$COLOR_TEXT_DEFFAULT

# Defines background colors in ANSI colors.
COLOR_BACKGROUND_BLACK='\e[40m'
CBBlack=$COLOR_BACKGROUND_BLACK
COLOR_BACKGROUND_RED='\e[41m'
CBRed=$COLOR_BACKGROUND_RED
COLOR_BACKGROUND_GREEN='\e[42m'
CBGreen=$COLOR_BACKGROUND_GREEN
COLOR_BACKGROUND_YELLOW='\e[43m'
CBYellow=$COLOR_BACKGROUND_YELLOW
COLOR_BACKGROUND_BLUE='\e[44m'
CBBlue=$COLOR_BACKGROUND_BLUE
COLOR_BACKGROUND_MAGENTA='\e[45m'
CBMagenta=$COLOR_BACKGROUND_MAGENTA
COLOR_BACKGROUND_CYAN='\e[46m'
CBCyan=$COLOR_BACKGROUND_CYAN
COLOR_BACKGROUND_WHITE='\e[47m'
CBWhite=$COLOR_BACKGROUND_WHITE
COLOR_BACKGROUND_DEFFAULT='\e[49m'
CBDefault=$COLOR_BACKGROUND_DEFFAULT

# Defines shortcut colors for quick-usings.
CAqua=$CAHigh$CTCyan
CBlack=$CAReset$CTBlack
CBlink=$CABlink
CBlue=$CAHigh$CTBlue
CDef=$CTDefault
CDefault=$CTDefault
CFuchsia=$CAHigh$CTMagenta
CGray=$CAHigh$CTBlack
CGreen=$CAReset$CTGreen
CHigh=$CAHigh
CInvisible=$CAInvisible
CItalic=$CAItalic
CLime=$CAHigh$CTGreen
CMaroon=$CAReset$CTRed
CNavy=$CAReset$CTBlue
CNone=$CAReset
COlive=$CAReset$CTYellow
CPurple=$CAReset$CTMagenta
CRed=$CAHigh$CTRed
CReverse=$CAReverse
CSilver=$CAReset$CTWhite
CTeal=$CAReset$CTCyan
CThrough=$CAThrough
CUnder=$CAUnder
CWhite=$CAHigh$CTWhite
CYellow=$CAHigh$CTYellow

# Provides essential functions.
SNAKEVIL_RETRIEVE_LOAD() {
  [ "?.??" = "${SNAKEVIL_LOAD}" ] && return
  export SNAKEVIL_LOAD=`uptime \
    | sed -e 's/^.*load average: \([^,]*\),.*$/\1/'`
  return
}

SNAKEVIL_UPDATE_PS1() {
  local _ecode=$?
  local _jobs=`jobs`
  local _c=$CNone
  local _cs=$CGray
  local _cu=$CAqua
  local _cur=$CRed
  local _cus=$CTeal
  local _ci=$CPurple
  local _cp=$COlive
  local _cph=$CYellow
  local _cn=$CSilver
  local _cl=$CGreen
  local _cln=$CMaroon
  local _clw=$CRed
  local _ce=$CRed
  local _title="${USER}"
  local _info=""
  local _user="\[${_cu}\]${USER}"
  if [ "0" -eq "${UID}" ]; then
    _user="\[${_cur}\]${USER}"
    [ -z "${SUDO_USER}" ] \
      || { \
        _title="${_title}(${SUDO_USER})"
        _user="${_user}\[${_cs}\](\[${_cus}\]${SUDO_USER}\[${_cs}\])"
      }
  fi
  _info="${_user}\[${_cs}\]@"
  unset _user
  local _ip=`echo "${SNAKEVIL_IP}" \
    | sed -e 's/^[^\.]*\.[^\.]*\(\.\)/\1/'`
  _title="${_title}@${_ip}"
  _ip="\[${_ci}\]${_ip}"
  _info="${_info}${_ip}"
  unset _ip
  local _path=`echo "${PWD}" \
    | sed -e 's@^'"${HOME}"'/*@:@'`
  if [ ":" = "${_path}" ]; then
    _title="${_title}~"
    _path="\[${_cph}\]~"
  else
    _title="${_title}${_path}"
    _path="\[${_cp}\]${_path}"
  fi
  _title="${_title}"
  case "${TERM}" in
     xterm* )
      echo -ne "\033]0;${_title}\007"
      ;;
  esac
  _info="<${_info}${_path}\[${_cs}\]>"
  if [ -n "${COLUMNS}" ]; then
    local _len=`echo -n "${_title}" | wc -c`
    _len=`expr "6" "+" "11" + "2" + "${_len}"`
    [ "${_len}" -gt "${COLUMNS}" ] || _info="\d ${_info}"
  fi
  unset _title
  _info="\[${_cs}\]\A ${_info}"
  unset _path
  local _prompt="\[${_cs}\]["
  local _index="\[${_cs}\]i:\[${_cn}\]\!"
  _prompt="${_prompt}${_index}"
  unset _index
  SNAKEVIL_RETRIEVE_LOAD
  local _load="${SNAKEVIL_LOAD}"
  if [ "?.??" = "${_load}" -o "0.00" = "${_load}" ]; then
    _load=""
  elif expr "1.00" ">" "${_load}" > /dev/null 2>&1; then
    _load=" \[${_cs}\]L:\[${_cl}\]${_load}"
  elif expr "10.00" ">" "${_load}" > /dev/null 2>&1; then
    _load=" \[${_cs}\]L:\[${_cln}\]${_load}"
  else
    _load=" \[${_cs}\]L:\[${_clw}\]${_load}"
  fi
  _prompt="${_prompt}${_load}"
  unset _load
  if [ -z "${_jobs}" ]; then
    _jobs=
  else
    _jobs=" \[${_cs}\]J:\[${_cn}\]\j"
  fi
  _prompt="${_prompt}${_jobs}"
  unset _jobs
  local _exit=" \[${_cs}\]E:\[${_ce}\]\$?"
  [ "0" -eq "${_ecode}" ] && _exit=""
  _prompt="${_prompt}${_exit}"
  unset _ecode
  unset _exit
  local _sign="\[${_c}\]\\$"
  _prompt="${_prompt}\[${_cs}\]] ${_sign} "
  unset _sign
  export PS1="${_info}\n${_prompt}"
  unset _c
  unset _cs
  unset _cu
  unset _cur
  unset _cus
  unset _ci
  unset _cp
  unset _cph
  unset _cn
  unset _cl
  unset _cln
  unset _clw
  unset _ce
}

# Sets personal PROMPT.
export PROMPT_COMMAND='SNAKEVIL_UPDATE_PS1'

# Loads bash-completion
if [ -f "/opt/local/etc/bash_completion" ]; then
  . "/opt/local/etc/bash_completion"
elif [ -f "/usr/local/etc/bash_completion" ]; then
  . "/usr/local/etc/bash_completion"
elif [ -f "/usr/etc/bash_completion" ]; then
  . "/usr/etc/bash_completion"
elif [ -f "/etc/bash_completion" ]; then
  . "/etc/bash_completion"
fi

# Includes common aliases.
[ -f "${HOME}/.aliasz" ] && . "${HOME}/.aliasz"

# vim:ft=sh:fenc=utf-8:ff=unix:nowrap:nu:nuw=4
# vim:tw=75:ts=2:sts=2:et:si:ai:sw=2
