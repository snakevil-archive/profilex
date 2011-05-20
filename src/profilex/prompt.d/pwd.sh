# ~/.profilex/prompt.d/pwd.sh
#
# AUTHOR     Snakevil Zen <zsnakevil@gmail.com>
# COPYRIGHT  © 2011 Snakevil.in.

case "${PWD}" in
  "${HOME}"* )
    _PROFILEX_PWD=`echo "${PWD}" \
      | sed -e "s@^${HOME}@@"`
    _PROFILEX_PWD="${CYellow}~${COlive}${_PROFILEX_PWD}"
    ;;
  * )
    _PROFILEX_PWD="${COlive}${PWD}"
    ;;
esac

# vim:ft=sh:fenc=utf-8:ff=unix:tw=75:ts=2:sts=2:et:ai:si
# vim:nowrap:sw=2:nu:nuw=4:so=5:fen:fdm=marker
