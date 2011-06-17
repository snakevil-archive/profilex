# ~/.local/ProfileX/share/prompt/pwd.sh
#
# AUTHOR     Snakevil Zen <zsnakevil@gmail.com>
# COPYRIGHT  © 2011 Snakevil.in.

[ -n "${_PROFILEX_PWD}" -a "${PWD}" = "${_PROFILEX_pwd}" ] && return

local homed

case "${PWD}" in
  "${HOME}" )
    homed=Y
    _PROFILEX_PWD=''
    ;;
  "${HOME}/"* )
    homed=Y
    _PROFILEX_PWD="${PWD:1+${#HOME}}"
    ;;
  * )
    homed=
    _PROFILEX_PWD="${PWD:1}"
    ;;
esac

[ 0 -lt ${#_PROFILEX_PWD} ] && {
  'which' awk > /dev/null && {
    local depth=`'echo' -n "${_PROFILEX_PWD}" \
      | 'awk' -F'/' 'END{print NF}'`
    _PROFILEX_PWD=`'echo' -n "${_PROFILEX_PWD}" \
      | 'awk' -v 'CH=${CYellow}${CUnder}' -v 'CN=${COlive}' ' \
        BEGIN { \
          RS = "/"; \
          OFS = ""; \
          ORS = "/"; \
        } \
        2 < NR && '"${depth}"' - 1 > NR { \
          print CH, substr($0, 0, 1), CN; \
          next; \
        } \
        { \
          print; \
        }'`
    unset depth
    eval '_PROFILEX_PWD="'"${_PROFILEX_PWD:0:${#_PROFILEX_PWD}-1}"'"'
  }

  _PROFILEX_PWD="${COlive}/${_PROFILEX_PWD}"
}


[ -n "${homed}" ] && _PROFILEX_PWD="${CYellow}~${_PROFILEX_PWD}"
unset homed

# vim:ft=sh:fenc=utf-8:ff=unix:tw=75:ts=2:sts=2:et:ai:si
# vim:nowrap:sw=2:nu:nuw=4:so=5:fen:fdm=marker
