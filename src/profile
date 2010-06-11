# ~/.profile
#
# http://dev.snakevil.be/profiles/profile
#
# AUTHOR     Snakevil Zen <zsnakevil@gmail.com>
# VERSION    1.2.0
# COPYRIGHT  (c) 2010 Snakevil.be/HERE

[ "bash" = "${SNAKEVIL_SHTYPE}" ] || {
  SNAKEVIL_SHTYPE=`ps | grep $$ | awk '{print $4}'`
  [ "sh" = "${SNAKEVIL_SHTYPE}" -a -n "${KSH_VERSION}" ] && \
    SNAKEVIL_SHTYPE="ksh"
}

case "${SNAKEVIL_SHTYPE}" in
  bash )
    ENV="ba"
    ;;
  *csh )
    ENV="c"
    ;;
  *ksh )
    ENV="k"
    ;;
  zsh )
    ENV="z"
    ;;
  * )
    ENV=""
    ;;
esac
unset SNAKEVIL_SHTYPE
ENV="${HOME}/.${ENV}shrc"

if [ -f "${ENV}" ]; then
  export ENV
  source "${ENV}"
else
  unset ENV
fi

# Gathers host ip.

# Gathers current load.

# vim:ft=sh:fenc=utf-8:ff=unix:nowrap:nu:nuw=4
# vim:tw=75:ts=2:sts=2:et:si:ai:sw=2
