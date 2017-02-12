# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi


#aliases
alias jipmi='/usr/java/jdk1.8.0_111/bin/javaws'
alias curl_zb='/usr/sbin/.curl --data "@test.json" https://127.0.0.1:3105'

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
#PS1='\[\e[0;95m\]\u@\h\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[1;32m\]$\[\e[m\]'
export PYTHONSTARTUP=~/.pythonrc


CHECK_SHELL=`echo $SHELL | sed 's/^.*\///'`
if [ x"$CHECK_SHELL" = xbash ]; then
        export Hostname=`hostname -f 2>/dev/null || hostname`
        if [ ${EUID} == 0 ] ; then
                # prompt formattings
                PS1='\[\033[0;33m\]\t\

\[\033[01;31m\]\u@$Hostname\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\033[01;34m\] \$\[\033[00m\] '
        else
                # prompt formattings
                PS1='\[\033[0;33m\]\t\

\[\033[01;32m\]\u@$Hostname\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\033[01;34m\] \$\[\033[00m\] '
        fi
fi
case $TERM in
        screen*)
                PROMPT_COMMAND='echo -ne "\033k$HOSTNAME `whoami`\033\\"'
                ;;
        *)
                PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
esac

