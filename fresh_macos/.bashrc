# .bashrc
alias ll='ls -l'
alias rm='rm -i'
source ~/.bash_profile

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi


#aliases
alias jipmi='/usr/java/jdk1.8.0_111/bin/javaws'
alias gc='git commit'
alias ga='git add'
alias gs='git status'
alias gl='git log'

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
#PS1='\[\e[0;95m\]\u@\h\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[1;32m\]$\[\e[m\]'


# disable homebrew auto updated
export HOMEBREW_NO_AUTO_UPDATE=1

# make history more verbose
export HISTSIZE=10000
export HISTTIMEFORMAT="%h %d %H:%M:%S "
# PROMPT_COMMAND='history -a'
export HISTIGNORE="ls:ll:history:w:htop:pwd"

# k8s
alias k=kubectl
complete -F __start_kubectl k
# kube alias
alias kgp='kubectl get pod'
alias kgpw='kubectl get pod -o wide'
alias kgpl='kubectl get po --show-labels'
alias kgd='kubectl get deployments.apps'
alias kgs='kubectl get service'
alias kgr='kubectl get replicasets.apps'
alias kgsf='kubectl get statefulset.apps'
alias kgns='kubectl get ns'
alias kgn='kubectl get no'
alias kgnw='kubectl get no -o wide'
alias kgnl='kubectl get no --show-labels'
alias kga='kubectl get all'
alias kgcm='kubectl get cm'


# make shell info more verbose and pretty
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


GIT_PROMPT_ONLY_IN_REPO=1

# dis gitpromt and bash completion here
#source ~/.bash-git-prompt/gitprompt.sh
# Bash autocomlitong
#[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
# [[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] && . "/opt/homebrew/etc/profile.d/bash_completion.sh"


# dis old go entity
#export GOPATH=$HOME/go_space # don't forget to change your path correctly!
#export GOROOT=/usr/local/opt/go/libexec
#export PATH=$PATH:$GOPATH/bin
#export PATH=$PATH:$GOROOT/bin


export PATH=$PATH:/usr/local/go/bin:/Users/vdulenov/go/bin:/opt/homebrew/opt/libpq/bin
export ANSIBLE_FORCE_COLOR=true

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
#export PATH="$PATH:$HOME/.rvm/bin"


if [ -f "/opt/homebrew/opt/bash-git-prompt/share/gitprompt.sh" ]; then
	__GIT_PROMPT_DIR="/opt/homebrew/opt/bash-git-prompt/share"
	source "/opt/homebrew/opt/bash-git-prompt/share/gitprompt.sh"
fi

# set default k8s cluster config
export KUBECONFIG=~/test_ckuster_config.yml

#ANSIBLE_CONFIG=~/.ansible/ansible.cfg
#export ANSIBLE_CONFIG
#source <(kubectl completion bash)
