# Local Settings
# A quick globbing reference, stolen from GRML.
help-aliases () {
echo -e "
    List of global aliases
    ======================
"
    alias -g | ruby -ne 'a=$_.split("="); printf("%10-s\t=\t%10s",a[0],a[1])'
}

help-glob() {
echo -e "
    List of glob modifiers
    ======================

    /      directories
    .      plain files
    @      symbolic links
    =      sockets
    p      named pipes (FIFOs)
    *      executable plain files (0100)
    %      device files (character or block special)
    %b     block special files
    %c     character special files
    r      owner-readable files (0400)
    w      owner-writable files (0200)
    x      owner-executable files (0100)
    A      group-readable files (0040)
    I      group-writable files (0020)
    E      group-executable files (0010)
    R      world-readable files (0004)
    W      world-writable files (0002)
    X      world-executable files (0001)
    s      setuid files (04000)
    S      setgid files (02000)
    t      files with the sticky bit (01000)
    print *(m-1)          # Dateien, die vor bis zu einem Tag modifiziert wurden.
    print *(a1)           # Dateien, auf die vor einem Tag zugegriffen wurde.
    print *(om[1])        # Zuletzt modifizierte Datei (neueste)
    print *(^m0)          # files NOT modified today *N*
    print *(@)            # Nur Links
    print *(Lk+50)        # Dateien die ueber 50 Kilobytes grosz sind
    print *(Lk-50)        # Dateien die kleiner als 50 Kilobytes sind
    print **/*.c          # Alle *.c - Dateien unterhalb von \$PWD
    print **/*.c~file.c   # Alle *.c - Dateien, aber nicht 'file.c'
    print (foo|bar).*     # Alle Dateien mit 'foo' und / oder 'bar' am Anfang
    print *~*.*           # Nur Dateien ohne '.' in Namen
    chmod 644 *(.^x)      # make all non-executable files publically readable
    print *(.c|.h)        # Nur Dateien mit dem Suffix '.c' und / oder '.h'
    print **/*(g:users:)  # Alle Dateien/Verzeichnisse der Gruppe >users<
    echo /proc/*/cwd(:h:t:s/self//) # Analog zu >ps ax | awk '{print \$1}'<
    "
}

help-history() {
echo -e  "
    List of Event Designators (zshexpn)
    ===================================
    !:0                 first word from previous command
    !$                  last word
    !:0-2               first three words 
    !!:s^foo^bar^
    ^foo^bar            replace on previous command
    ^foo^bar:G          greedy replace
    !0                  first command-line
    !-1                 previous
    !{str}              
    !str                most recent line starting with 'str'
    !?str               containing 'str'
    !#                  current command line
    !#1                 current command line, second parameter
"
}

help-event() { 
    help-history 
}

help-variable () {
echo -e "
    List of parameter expansion (zshexpn)
    =====================================

    \${name}
    \${name-word}       word unless name is set
    \${name+word}       word if name is set
    \${name=word}       name is set to word if unset
    ...
    \${name#pattern}    pattern matches beginning of name, remove match
    \${name%pattern}    pattern matches end of name, remove match
    \${i:s/foo/bar/} 
    \$var[(w)1]         split variable by word not char

    Examples:
    \${\${(s.:.)f}[1]}               split \$j by : and return first field
    \${(j.:.)\${(s.:.)f}[2,3]}       split \$j by : and join second and third field by :

"
}

help-keys-long() {
echo -e "
Cutting  & Pasting
===================
cp termine.rdf /tmp/
              ^
ctrl-u                  /tmp/ 
ctrl-w                  cp /tmp/
ctrl-k                  cp termine.rdf
ctrl-t                  cp termine.rd f/tmp/        # move a letter arround
ctrl-y                  insert last delete

ctrl-k                  kill text to right of cursor. This is the bash equiv. of cut
ctrl-K                  This command deletes from the cursor to the end of the line.
ctrl-y                  yank text. This is the bash equiv.  of paste
ctrl-d                  delete
Esc-Del                 Delete word to the left of the cursor

History
========
ctrl-r                  reverse search (semi-interactive)
ctrl-n                  next history
ctrl-p                  prev history
ctrl-o                  switch and execute last two commands (?)
ctrl-O                  exec command an reuse

Movement
=========
ctrl-x x                jump to beginning of line / jump back
ctrl-p                  previous command. This is the same as the up arrow
ctrl-n                  next charachter. self explanitory
ctrl-b                  left one charachter aka back or left arrow
ctrl-f                  forward one charachter or right arrow
ctrl-a                  beginning of line. this is also useful in long commands if you just want to change the first part
Esc-b                   Move cursor to the beginning of the word to the left
Esc-f                   Move cursor to the beginning of the word to the right

Misc
=========
ctrl-v                  next control key is shown in cmdline (usefull for bind)
ctrl-s                  argh
ctrl-q                  ah

Previously typed commands
==========================
!!                     previous command
!xxx                   where xxx is the most recent command STARTING with xxx
!?xxx                  where xxx is the most recent command CONTAINING xxx (Note: the above command will not find the command if it doesn't start with your pattern. realizing this will save you a little bit of trouble.
^string1^string2       this REPEATS the last command replacing string1 with string2. I love to use this one on lengthy commands that I need to repeat slightly changed again.
"
}

# command line editing keys
help-keys () {
echo -e "

    alt-b   word backward
    alt-f   word forward
    alt-h   help on current command?

    esc-backspace delete word 
    esc-q   kill line, restore after next command
    esc-t   transpose words

    ctrl-a  jump to beginning of line
    ctrl-b  backward char
    ctrl-d  delete char
    ctrl-e  jump to end of line
    ctrl-f  forward char
    ctrl-k  kill to eol
    ctrl-n  history next
    ctrl-o  in history, execute command, bring up next
    ctrl-p  history prev
    ctrl-r  search history
    ctrl-s  forward search?
    ctrl-w  kill last word
    ctrl-x  jump start, again jump back?
    ctrl-y  yank copied text

"
}
