# ~/.local/ProfileX/share/prompt/pwd.sh
#
# AUTHOR     Snakevil Zen <zsnakevil@gmail.com>
# COPYRIGHT  © 2011 Snakevil.in.

local homed
local depth

PWD=`pwd`

case "${PWD}" in
  "${HOME}"* )
    homed=1
    _PROFILEX_PWD=`'echo' "${PWD}" \
      | 'sed' -e "s@^${HOME}@@"`
    ;;
  * )
    homed=0
    _PROFILEX_PWD="${PWD}"
    ;;
esac

'which' awk expr > /dev/null && {
  depth=`'echo' -n "${_PROFILEX_PWD}" \
    | 'awk' -F'/' 'END{print NF-1}'`
  [ 3 -lt $depth ] && {
    local line
    local index=0
    _PROFILEX_PWD=`'echo' -n "${_PROFILEX_PWD}" \
      | 'awk' 'BEGIN{RS="/"}{print}' \
      | while 'read' line
        do
          [ 1 -lt $index -a $index -lt $('expr' $depth - 1) ] && {
            line="${CUnder}${CYellow}${line:0:1}${COlive}"
          }
          [ 0 -eq $index ] || 'echo' -n "/${line}"
          index=$('expr' $index + 1)
        done`
    unset line
    unset index
  }
}

_PROFILEX_PWD="${COlive}${_PROFILEX_PWD}"

[ 1 -eq $homed ] && _PROFILEX_PWD="${CYellow}~${_PROFILEX_PWD}"
unset homed

unset depth

# vim:ft=sh:fenc=utf-8:ff=unix:tw=75:ts=2:sts=2:et:ai:si
# vim:nowrap:sw=2:nu:nuw=4:so=5:fen:fdm=marker
