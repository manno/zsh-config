# .zshenv: read first, all types (0)
# determine locale cfg
if [ -f /etc/default/locale ]; then
    localesfile=/etc/default/locale
elif [ -f /etc/environment ]; then
    localesfile=/etc/environment
else
    localesfile=
fi
if [ -f "$localesfile" ]; then
  source $localesfile
  export LANG LC_CTYPE LC_MESSAGES LC_ALL LC_NUMERIC LC_TIME LC_COLLATE LC_MONETARY LC_PAPER LC_NAME LC_ADDRESS LC_TELEPHONE LC_MEASUREMENT LC_IDENTIFICATION
fi

## shared env
[ -f ~/.env ] && source ~/.env
# host specific, not distributed
[ -f ~/.env.localhost ] && source ~/.env.localhost

# vim: ts=4 sw=4
