# ~/.profilex/prompt.d/user.sh
#
# AUTHOR     Snakevil Zen <zsnakevil@gmail.com>
# COPYRIGHT  © 2011 Snakevil.in.

_PROFILEX_USER="${USER}"
[ 0 -eq $UID ] && {
  [ -z "${SUDO_USER}" ] || {
    _PROFILEX_USER="${SUDO_USER}(root)"
  }
}

# vim:ft=sh:fenc=utf-8:ff=unix:tw=75:ts=2:sts=2:et:ai:si
# vim:nowrap:sw=2:nu:nuw=4:so=5:fen:fdm=marker
