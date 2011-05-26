# ~/.local/ProfileX/share/prompt/ip.sh
#
# AUTHOR     Snakevil Zen <zsnakevil@gmail.com>
# COPYRIGHT  © 2011 Snakevil.in.

[ -z "${_PROFILEX_IP}" ] && {
  _PROFILEX_IP='.0.1'
  'which' awk head ifconfig sed > /dev/null \
    && _PROFILEX_IP=`'ifconfig' \
      | 'awk' '/inet /&&!/127\./{sub("addr:","");print $2}' \
      | 'head' -n1 \
      | 'sed' -e 's/^[^\.]*\.[^\.]*\(\.\)/\1/'`
  _PROFILEX_IP="${CPurple}${_PROFILEX_IP}"
}

# vim:ft=sh:fenc=utf-8:ff=unix:tw=75:ts=2:sts=2:et:ai:si
# vim:nowrap:sw=2:nu:nuw=4:so=5:fen:fdm=marker
