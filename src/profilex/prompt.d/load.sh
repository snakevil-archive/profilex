# ~/.profilex/prompt.d/load.sh
#
# AUTHOR     Snakevil Zen <zsnakevil@gmail.com>
# COPYRIGHT  © 2011 Snakevil.in.

[ -z "${_PROFILEX_LOAD}" ] || {
  which awk sed uptime > /dev/null && {
    _PROFILEX_LOAD=`uptime \
      | awk -F'load average' '{print $2}' \
      | awk '{print $2}'`
    _PROFILEX_LOAD=" L${_PROFILEX_LOAD:0:4}"
  }
}

# vim:ft=sh:fenc=utf-8:ff=unix:tw=75:ts=2:sts=2:et:ai:si
# vim:nowrap:sw=2:nu:nuw=4:so=5:fen:fdm=marker
