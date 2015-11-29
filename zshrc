#------------------------------
# History stuff
#------------------------------
HISTFILE=~/.histfile
HISTSIZE=500000
SAVEHIST=500000

#------------------------------
# Variables
#------------------------------
export PATH=/home/amiralis/Tools/libtool/bin:/home/amiralis/Tools/zsh/bin:/home/amiralis/Tools/m4/bin:/home/amiralis/Tools/tmux/bin:/home/amiralis/Tools/gwak/bin:/home/amiralis/Tools/emacs/bin:/home/amiralis/Tools/llvm/debug/Debug+Asserts/bin:/home/amiralis/Tools/llvm/build/Release+Asserts/bin:/home/amiralis/Tools/autoconf/bin:/home/amiralis/Tools/ranger/usr/local/bin:/home/amiralis/Tools/Vim/bin:/home/amiralis/Tools/lua/bin:/home/amiralis/Tools/cmake/bin:/bin:/home/amiralis/Tools/riscv/bin:/home/amiralis/Tools/gsl-2.0/bin:/home/amiralis/Tools/gperf-3.0.4/bin:/home/amiralis/Tools/sqlite-3090/bin:$HOME/bin:$PATH

export PYTHONPATH=/home/amiralis/Tools/ranger/usr/local/lib/python2.7/dist-packages

export CPLUS_INCLUDE_PATH=/home/amiralis/Tools/boost/include:/usr/local/include/c++/4.8.3:/usr/local/include/c++/4.8.3/x86_64-unknown-linux-gnu

export LD_LIBRARY_PATH=/home/amiralis/Tools/boost/lib:/home/amiralis/Tools/gmp/lib:/home/amiralis/Tools/mpc/lib:/home/amiralis/Tools/mpfr/lib:/home/amiralis/Tools/gwak/lib:/usr/local/lib64:/usr/local/lib:/home/amiralis/gsl-2.0/lib:/home/amiralis/Tools/readline-4.2/lib:/home/amiralis/Tools/termcap-1.3/lib:$$LD_LIBRARY_PATH

#export PATH=/bin:${HOME}/bin:${PATH}
# SLRN
#export NNTPSERVER='news.gmane.org'

export EDITOR=vim

# Set DE to gnome for chromium
export DE=gnome

#-----------------------------
# Dircolors
#-----------------------------
#LS_COLORS='rs=0:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44:ex=01;32:';
#export LS_COLORS

#------------------------------
# Font
# -----------------------------
if [[ -r /usr/lib/python3.4/site-packages/powerline/bindings/zsh/powerline.zsh ]]; then
        source /usr/lib/python3.4/site-packages/powerline/bindings/zsh/powerline.zsh
    fi

#------------------------------
# Keybindings
#------------------------------
bindkey -v
typeset -g -A key

bindkey '^[[3~' delete-char

# Up/Down line history arrow up/down
bindkey '^[[B' down-line-or-history
bindkey '^[[A' up-line-or-search

# Beginning of line also ctrl+e/a ctrl+up/down
bindkey "^E" end-of-line
bindkey "^A" beginning-of-line
bindkey "^F" forward-char
bindkey "^B" backward-char
bindkey "^[^?" backward-kill-word

# Ctrl+r history search
bindkey "^R" history-incremental-search-backward

# History search (usually up/down key)
bindkey '^P' up-line-or-search
bindkey '^N' down-line-or-search

bindkey "^[[1;5D" emacs-backward-word
bindkey "^[[1;5C" emacs-forward-word

# Add Home and End key binding
bindkey "${terminfo[khome]}" beginning-of-line
bindkey "${terminfo[kend]}" end-of-line

#------------------------------
# History
#------------------------------
setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt share_history

#------------------------------
# Alias stuff
#------------------------------
alias sqlite='python -c "import apsw;apsw.main()"'
alias ls="ls --color -F"
alias ll="ls --color -lh"
alias grep="grep --color=always"
alias tmux='tmux -2'
alias tmuxw='tmux -2 attach -t Work'
alias tmuxh='tmux -2 attach -t Hash'

# moving in dirs
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."

# Dir colors
eval $(dircolors -b $HOME/.dircolors)

#------------------------------
# Comp stuff
#------------------------------
zmodload zsh/complist 
autoload -Uz compinit
compinit
zstyle :compinstall filename '${HOME}/.zshrc'

zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*'   force-list always

zstyle ':completion:*:*:killall:*' menu yes select
zstyle ':completion:*:killall:*'   force-list always


#------------------------------
# Functions
#------------------------------

sprunge() {
        if [ -z "$1" ]
then
    curl -s -F 'sprunge=<-' http://sprunge.us
else
    if [ -z "$2" ]
    then
        echo -n "$1:"
        cat "$1" | "$0"
    else
        for i in "$@"
        do
            "$0" "$i"
        done
    fi
fi

}

ac() { # compress a file or folder
    case "$1" in
       tar.bz2|.tar.bz2) tar cvjf "${2%%/}.tar.bz2" "${2%%/}/"  ;;
       tbz2|.tbz2)       tar cvjf "${2%%/}.tbz2" "${2%%/}/"     ;;
       tbz|.tbz)         tar cvjf "${2%%/}.tbz" "${2%%/}/"      ;;       
       tar.xz)         tar cvJf "${2%%/}.tar.xz" "${2%%/}/"      ;;       
       tar.gz|.tar.gz)   tar cvzf "${2%%/}.tar.gz" "${2%%/}/"   ;;
       tgz|.tgz)         tar cvjf "${2%%/}.tgz" "${2%%/}/"      ;;
       tar|.tar)         tar cvf  "${2%%/}.tar" "${2%%/}/"        ;;
       rar|.rar)         rar a "${2}.rar" "$2"            ;;
       zip|.zip)         zip -9 "${2}.zip" "$2"            ;;
       7z|.7z)         7z a "${2}.7z" "$2"            ;;
       lzo|.lzo)         lzop -v "$2"                ;;   
       gz|.gz)         gzip -v "$2"                ;;
       bz2|.bz2)         bzip2 -v "$2"                ;;
       xz|.xz)         xz -v "$2"                    ;; 
       lzma|.lzma)         lzma -v "$2"                ;;  
           *)           echo "ac(): compress a file or directory."
            echo "Usage:   ac <archive type> <filename>"
            echo "Example: ac tar.bz2 PKGBUILD"
            echo "Please specify archive type and source."
            echo "Valid archive types are:"
            echo "tar.bz2, tar.gz, tar.gz, tar, bz2, gz, tbz2, tbz,"
            echo "tgz, lzo, rar, zip, 7z, xz and lzma." ;;
    esac
}
ad() { # decompress archive (to directory $2 if wished for and possible)
   if [ -f "$1" ] ; then
       case "$1" in
           *.tar.bz2|*.tgz|*.tbz2|*.tbz) mkdir -v "$2" 2>/dev/null ; tar xvjf "$1" -C "$2" ;;
       *.tar.gz)             mkdir -v "$2" 2>/dev/null ; tar xvzf "$1" -C "$2" ;;
       *.tar.xz)             mkdir -v "$2" 2>/dev/null ; tar xvJf "$1" ;;
       *.tar)             mkdir -v "$2" 2>/dev/null ; tar xvf "$1"  -C "$2" ;;
       *.rar)             mkdir -v "$2" 2>/dev/null ; 7z x   "$1"     "$2" ;;
       *.zip)             mkdir -v "$2" 2>/dev/null ; unzip   "$1"  -d "$2" ;;
       *.7z)             mkdir -v "$2" 2>/dev/null ; 7z x    "$1"   -o"$2" ;;
       *.lzo)             mkdir -v "$2" 2>/dev/null ; lzop -d "$1"   -p"$2" ;;  
       *.gz)             gunzip "$1"                       ;;
       *.bz2)             bunzip2 "$1"                       ;;
       *.Z)                 uncompress "$1"                       ;;
       *.xz|*.txz|*.lzma|*.tlz)     xz -d "$1"                           ;; 
       *)               
       esac
   else
                      echo "Sorry, '$2' could not be decompressed."
              echo "Usage: ad <archive> <destination>"
              echo "Example: ad PKGBUILD.tar.bz2 ."
              echo "Valid archive types are:"
              echo "tar.bz2, tar.gz, tar.xz, tar, bz2,"
              echo "gz, tbz2, tbz, tgz, lzo,"
              echo "rar, zip, 7z, xz and lzma"
   fi
}
al() { # list content of archive but don't unpack
    if [ -f "$1" ]; then
         case "$1" in
       *.tar.bz2|*.tbz2|*.tbz) tar -jtf "$1"     ;;
       *.tar.gz)                     tar -ztf "$1"     ;;
       *.tar|*.tgz|*.tar.xz)                 tar -tf "$1"     ;;
       *.gz)                 gzip -l "$1"     ;;    
       *.rar)                 rar vb "$1"     ;;
       *.zip)                 unzip -l "$1"     ;;
       *.7z)                 7z l "$1"     ;;
       *.lzo)                 lzop -l "$1"     ;;  
       *.xz|*.txz|*.lzma|*.tlz)      xz -l "$1"     ;;
         esac
    else
         echo "Sorry, '$1' is not a valid archive."
     echo "Valid archive types are:"
     echo "tar.bz2, tar.gz, tar.xz, tar, gz,"
     echo "tbz2, tbz, tgz, lzo, rar"
     echo "zip, 7z, xz and lzma"
    fi
}

# Show some status info
status() {
    print
    print "Date..: "$(date "+%Y-%m-%d %H:%M:%S")
    print "Shell.: Zsh $ZSH_VERSION (PID = $$, $SHLVL nests)"
    print "Term..: $TTY ($TERM), ${BAUD:+$BAUD bauds, }$COLUMNS x $LINES chars"
    print "Login.: $LOGNAME (UID = $EUID) on $HOST"
    print "System: $(cat /etc/[A-Za-z]*[_-][rv]e[lr]*)"
    print "Uptime:$(uptime)"
    print
}

# svn diff
svndiff() {
  svn diff "${@}" | colordiff | less -R
}

hist_dedup() {
  sort ~/.histfile > ~/.histfile.old
  uniq ~/.histfile.old > ~/.histfile
}

# histfile deduplicate

#------------------------------
# Window title
#------------------------------
case $TERM in
    *xterm*|rxvt|rxvt-unicode|rxvt-256color|(dt|k|E)term)
                precmd () { print -Pn "\e]0;$TERM - (%L) [%n@%M]%# [%~]\a" } 
		preexec () { print -Pn "\e]0;$TERM - (%L) [%n@%M]%# [%~] ($1)\a" }
        ;;
    screen)
        precmd () { 
		[[ $a = zsh ]] && print -Pn "\ek$2\e\\" # show the path if no program is running
                [[ $a != zsh ]] && print -Pn "\ek$a\e\\" # if a program is running show that

                # Terminal title
                if [[ -n $STY ]] ; then
                        [[ $a = zsh ]] && print -Pn "\e]2;$SHORTHOST:S\[$WINDOW\]:$2\a"
                        [[ $a != zsh ]] && print -Pn "\e]2;$SHORTHOST:S\[$WINDOW\]:${a//\%/\%\%}\a"
                elif [[ -n $TMUX ]] ; then
                        # We're running in tmux, not screen
                        [[ $a = zsh ]] && print -Pn "\e]2;$SHORTHOST:$2\a"
                        [[ $a != zsh ]] && print -Pn "\e]2;$SHORTHOST:${a//\%/\%\%}\a"
                fi
                }
                preexec () { 
                       # print -Pn "\e]83;title \"$1\"\a" 
                       # print -Pn "\e]0;$TERM - (%L) [%n@%M]%# [%~] ($1)\a" 
                }
        ;; 
esac

#------------------------------
# Prompt
#------------------------------
setprompt () {
        # load some modules
        autoload -U zsh/terminfo # Used in the colour alias below
        # Use colorized output, necessary for prompts and completions.
        autoload -U colors && colors
        setopt prompt_subst

        # make some aliases for the colours: (coud use normal escap.seq's too)
        for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE; do
                eval PR_$color='%{$fg[${(L)color}]%}'
        done
        PR_NO_COLOR="%{$terminfo[sgr0]%}"

        # Check the UID
        if [[ $UID -ge 1000 ]]; then # normal user
                eval PR_USER='${PR_GREEN}%n${PR_NO_COLOR}'
                eval PR_USER_OP='${PR_GREEN}%#${PR_NO_COLOR}'
        elif [[ $UID -eq 0 ]]; then # root
                eval PR_USER='${PR_RED}%n${PR_NO_COLOR}'
                eval PR_USER_OP='${PR_RED}%#${PR_NO_COLOR}'
        fi      

        # Check if we are on SSH or not  --{FIXME}--  always goes to |no SSH|
        if [[ -z "$SSH_CLIENT"  ||  -z "$SSH2_CLIENT" ]]; then 
                eval PR_HOST='${PR_GREEN}%M${PR_NO_COLOR}' # no SSH
        else 
                eval PR_HOST='${PR_YELLOW}%M${PR_NO_COLOR}' #SSH
        fi
        # set the prompt
        PS1=$'${PR_CYAN}[${PR_USER}${PR_CYAN}@${PR_HOST}${PR_CYAN}][${PR_BLUE}%~${PR_CYAN}]${PR_USER_OP}'
        PS2=$'%_>'
}
setprompt

