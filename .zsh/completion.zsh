# cache
cachedir=$HOME/.zsh/cache/$UID
[ ! -d $cachedir ] && mkdir -p $cachedir
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path $cachedir

# ignore patterns
zstyle ':completion:*:(all-|)files' ignored-patterns '(|*/)CVS' '(|*/)#.svn'
zstyle ':completion:*:cd:*' ignored-patterns '(*/)#CVS' '(|*/)#.svn'

# path completion: ../
zstyle ':completion:*' special-dirs true

# hosts + ssh
typeset -U hosts
if [ -f "$HOME/.ssh/known_hosts" ]; then
    hosts=(${${${${(f)"$(<$HOME/.ssh/known_hosts)"}:#[0-9]*}%%\ *}%%,*})
    zstyle ':completion:*:hosts' hosts $hosts
fi

# fuzzy
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric

# increase tolerance with length of typing
zstyle -e ':completion:*:approximate:*' \
            max-errors 'reply=($((($#PREFIX+$#SUFFIX)/3))numeric)'

# insert all expansions for expand completer
#zstyle ':completion:*:expand:*' tag-order all-expansions

# ignore nonexisting command function
zstyle ':completion:*:functions' ignored-patterns '_*'

# process id menu
#zstyle ':completion:*:*:*:*:processes' menu yes select
#zstyle ':completion:*:processes' command 'ps -e'
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*'   force-list always

# ?
zstyle ':completion:*' completer _complete _match
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}'

autoload -Uz compinit
compinit -i

#autoload predict-on
#predict-on

# functions to make completion for git aliases work
_git_co() { _git_checkout }
_git_lg() { _git_log }
