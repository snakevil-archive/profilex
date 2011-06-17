# ~/.local/ProfileX/share/prompt/exit.sh
#
# AUTHOR     Snakevil Zen <zsnakevil@gmail.com>
# COPYRIGHT  © 2011 Snakevil.in.

if [ 'x0' = "x${_PROFILEX_EXIT}" ]
then
  _PROFILEX_EXIT=''
elif [ 'Linux' = `'uname' -s` ]
then
  local length=`'expr' "${COLUMNS}" - 5`
  _PROFILEX_EXIT=" ${_PROFILEX_EXIT}   "
  _PROFILEX_EXIT="${CGray}\e[41mE${CWhite}${_PROFILEX_EXIT:0:5}"
  _PROFILEX_EXIT="\e[s\e[1;${length}H${_PROFILEX_EXIT}\e[u"
else
  _PROFILEX_EXIT=" E${CRed}${CUnder}${_PROFILEX_EXIT}"
fi

# vim:ft=sh:fenc=utf-8:ff=unix:tw=75:ts=2:sts=2:et:ai:si
# vim:nowrap:sw=2:nu:nuw=4:so=5:fen:fdm=marker
