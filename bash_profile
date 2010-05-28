# ~/.bash_profile
#
# http://dev.snakevil.be/profiles/bash_profile
#
# AUTHOR     Snakevil Zen <zsnakevil@gmail.com>
# VERSION    1.1.0
# COPYRIGHT  (c) 2010 Snakevil.be/HERE

[ -z "${BASH}" ] && return

SNAKEVIL_SHTYPE="bash"
export SNAKEVIL_SHTYPE

[ -f "${HOME}/.profile" ] && source "${HOME}/.profile"

# vim:ft=sh:fenc=utf-8:ff=unix:nowrap:nu:nuw=4
# vim:tw=75:ts=2:sts=2:et:si:ai:sw=2
