# ~/.local/ProfileX/share/prompt/load.sh
#
# AUTHOR     Snakevil Zen <zsnakevil@gmail.com>
# COPYRIGHT  © 2011 Snakevil.in.

which awk sed uptime > /dev/null && {
  _PROFILEX_LOAD=`uptime \
    | awk -F'load average' '{print $2}' \
    | awk '{print $2}'`
  _PROFILEX_LOAD="${_PROFILEX_LOAD:0:4}"
  if which expr > /dev/null
  then
    if [ 1 -eq `expr "${_PROFILEX_LOAD}" \> 1` ]
    then
      _PROFILEX_LOAD="${CMaroon}${_PROFILEX_LOAD}"
    elif [ 1 -eq `expr "${_PROFILEX_LOAD}" \> 0.1` ]
    then
      _PROFILEX_LOAD="${COlive}${_PROFILEX_LOAD}"
    else
      _PROFILEX_LOAD="${CGreen}${_PROFILEX_LOAD}"
    fi
  else
    _PROFILEX_LOAD="${CSilver}${_PROFILEX_LOAD}"
  fi
  _PROFILEX_LOAD=" L${_PROFILEX_LOAD}"
}

# vim:ft=sh:fenc=utf-8:ff=unix:tw=75:ts=2:sts=2:et:ai:si
# vim:nowrap:sw=2:nu:nuw=4:so=5:fen:fdm=marker
