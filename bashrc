# ~/.bashrc
#
# http://dev.snakevil.be/profiles/bashrc
#
# AUTHOR     Snakevil Zen <zsnakevil@gmail.com>
# VERSION    1.2.0
# COPYRIGHT  (c) 2010 Snakevil.be/HERE

[ -f "${HOME}/.myshrc" ] && source "${HOME}/.myshrc"

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

if [ -f "/opt/local/etc/bash_completion" ]; then
  . "/opt/local/etc/bash_completion"
elif [ -f "/usr/local/etc/bash_completion" ]; then
  . "/usr/local/etc/bash_completion"
elif [ -f "/usr/etc/bash_completion" ]; then
  . "/usr/etc/bash_completion"
elif [ -f "/etc/bash_completion" ]; then
  . "/etc/bash_completion"
fi

[ -f "${HOME}/.aliasz" ] && . "${HOME}/.aliasz"

export PROMPT_COMMAND='SNAKEVIL_UPDATE_PS1'

# vim:ft=sh:fenc=utf-8:ff=unix:nowrap:nu:nuw=4
# vim:tw=75:ts=2:sts=2:et:si:ai:sw=2
