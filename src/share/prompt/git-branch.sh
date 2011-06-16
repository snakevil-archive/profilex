# ~/.local/ProfileX/share/prompt/git-branch.sh
#
# AUTHOR     Snakevil Zen <zsnakevil@gmail.com>
# COPYRIGHT  © 2011 Snakevil.in.

'which' git awk > /dev/null && {
  _PROFILEX_GIT_BRANCH=`'git' symbolic-ref HEAD 2> /dev/null \
    | 'awk' -F'/' '{print $3}'`
  [ -z "${_PROFILEX_GIT_BRANCH}" ] && return 0
  _PROFILEX_GIT_BRANCH="|g${CBlue}${_PROFILEX_GIT_BRANCH}"
}

# vim:ft=sh:fenc=utf-8:ff=unix:tw=75:ts=2:sts=2:et:ai:si
# vim:nowrap:sw=2:nu:nuw=4:so=5:fen:fdm=marker
