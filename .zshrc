# .zshrc: interactive shell, after zprofile(login) and zshenv(always)
# vim: ft=zsh ts=4 sw=4

## Checks
[ -d $HOME/.zsh ] || echo "no ressource&config dir: .zsh" 

## Load Libs
fpath=(~/.zsh/func $fpath)

## Parse ~/.zsh files
autoload load_zshd
load_zshd

# clean up path
path=($^path(N))

## Overide:
# set PATH so it includes user's private bin if it exists
typeset -U path
if [ -d ~/bin ]; then
    path=(~/bin /usr/local/bin $path )
fi

# add super user paths
path=(/sbin /usr/sbin /usr/local/sbin $path)

## Load more modules
autoload zargs

## Show ssh agent keys
if [ -x /usr/bin/ssh-add ] && [ "$SSH_AUTH_SOCK" != "" ] && [ -r "$SSH_AUTH_SOCK" ]; then
    /usr/bin/ssh-add -l
fi

## Needs to go after other bindkey statements
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
