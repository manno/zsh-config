setopt prompt_subst
autoload colors
colors
funny=
del="%{$fg[black]%}$funny%{$reset_color%}"

# Chroot
if [ -z "$debian_chroot" -a -r /etc/debian_chroot ]; then
     debian_chroot="$(cat /etc/debian_chroot)$del"
fi

# VCS - man zshcontrib
autoload -Uz vcs_info
zstyle ':vcs_info:*' actionformats \
    '%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f'
zstyle ':vcs_info:*' formats       \
    '%F{5}[%F{2}%b%F{5}]%f'
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{3}%r'

zstyle ':vcs_info:*' enable git cvs svn

# RPROMPT CONFIG
#
# Method 1: wrap vcs info in function
vcs_info_wrapper() { 
    vcs_info 
    if [ -n "$vcs_info_msg_0_" ]; then 
        echo "${vcs_info_msg_0_}%{$reset_color%}"
    fi
}

rvm_prompt_wrapper () {
    if [ -x ~/.rvm/bin/rvm-prompt ]; then
        ruby_version=$(~/.rvm/bin/rvm-prompt | sed 's/ruby-//')
        if [ -n "$ruby_version" ]; then
            echo "%{$fg[green]%}[%{$fg[magenta]%}$ruby_version%{$fg[green]%}]%{$reset_color%}"
        fi
    fi
}

if [ "$TERM" != "screen" ]; then
    #RPROMPT=$'${del}$(vcs_info_wrapper)$(rvm_prompt_wrapper)%{$reset_color%}'
    RPROMPT=$'${del}$(vcs_info_wrapper)%{$reset_color%}'
fi

# PROMPT CONFIG
cPre=$'%{$fg[black]%}%(1j.⚑ .)%{$reset_color%}'
cPS1=$'%n%{$fg[magenta]%}@%{$reset_color%}%m%{$fg[magenta]%}:%{$reset_color%}%~%{$fg[magenta]%}%# %{$reset_color%}'
PROMPT=${cPre}${debian_chroot}${cPS1}

# promptinit
autoload -U promptinit
promptinit

# Gnome UTF8 Support
# just select language in gdm and set locales to en_GB.UTF-8
# needed again:
echo -ne '\e%G'
