# ~/.local/ProfileX/share/prompt/svn-info.sh
#
# AUTHOR     Snakevil Zen <zsnakevil@gmail.com>
# COPYRIGHT  © 2011 Snakevil.in.

'which' svn awk > /dev/null && {
  _PROFILEX_SVN_INFO=`'svn' info 2> /dev/null \
    | 'awk' '"Revision:"==$1{print $2}'`
  [ -z "${_PROFILEX_SVN_INFO}" ] && return 0
  _PROFILEX_SVN_INFO="|s${CBlue}${_PROFILEX_SVN_INFO}"
}

# vim:ft=sh:fenc=utf-8:ff=unix:tw=75:ts=2:sts=2:et:ai:si
# vim:nowrap:sw=2:nu:nuw=4:so=5:fen:fdm=marker
