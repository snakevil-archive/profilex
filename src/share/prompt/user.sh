# ~/.local/ProfileX/share/prompt/user.sh
#
# AUTHOR     Snakevil Zen <zsnakevil@gmail.com>
# COPYRIGHT  © 2011 Snakevil.in.

_PROFILEX_USER="${CAqua}${USER}"
[ 0 -eq $UID ] && {
  _PROFILEX_USER="${CMaroon}${USER}"
  [ -z "${SUDO_USER}" ] || {
    _PROFILEX_USER="${CRed}root${CBase}(${CTeal}${SUDO_USER}${CBase})"
  }
}

# vim:ft=sh:fenc=utf-8:ff=unix:tw=75:ts=2:sts=2:et:ai:si
# vim:nowrap:sw=2:nu:nuw=4:so=5:fen:fdm=marker
