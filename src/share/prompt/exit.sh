# ~/.local/ProfileX/share/prompt/exit.sh
#
# AUTHOR     Snakevil Zen <zsnakevil@gmail.com>
# COPYRIGHT  © 2011 Snakevil.in.

if [ 'x0' = "x${_PROFILEX_EXIT}" ]
then
  _PROFILEX_EXIT=''
else
  _PROFILEX_EXIT=" E${CRed}${_PROFILEX_EXIT}"
fi

# vim:ft=sh:fenc=utf-8:ff=unix:tw=75:ts=2:sts=2:et:ai:si
# vim:nowrap:sw=2:nu:nuw=4:so=5:fen:fdm=marker
