# ~/.local/ProfileX/share/prompt/jobs.sh
#
# AUTHOR     Snakevil Zen <zsnakevil@gmail.com>
# COPYRIGHT  © 2011 Snakevil.in.

which wc > /dev/null && {
  _PROFILEX_JOBS=`jobs \
    | wc -l`
  if [ 0 -eq $_PROFILEX_JOBS ]
  then
    _PROFILEX_JOBS=''
  else
    _PROFILEX_JOBS=" J${CSilver}${_PROFILEX_JOBS}"
  fi
}

# vim:ft=sh:fenc=utf-8:ff=unix:tw=75:ts=2:sts=2:et:ai:si
# vim:nowrap:sw=2:nu:nuw=4:so=5:fen:fdm=marker
