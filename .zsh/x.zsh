# replace terminal title with current directory

case $TERM in
    sun-cmd) 
        function set_terminal_title() {
            print -Pn "\e]l%~\e\\"
        }
        precmd_functions+=(set_terminal_title)
    ;;
    *xterm*|rxvt|(dt|k|E)term)
        function set_terminal_title() {
            print -Pn "\e]0;%n@%m: %~\a"
        }
        precmd_functions+=(set_terminal_title)
    ;;
esac

[ -e /etc/profile.d/vte.sh ] && source /etc/profile.d/vte.sh
