# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi


#aliases
alias jipmi='/usr/java/jdk1.8.0_111/bin/javaws'

# Docker
alias de='docker exec'
alias dclean='docker ps -a -q -f status=exited | xargs -t docker rm'
alias diclean='docker images -q -f dangling=true | xargs -t docker rmi'
alias dvclean='docker volume ls -q -f dangling=true | xargs -t docker volume rm'
alias dgc='dclean && diclean && dvclean'
alias dps='docker ps'
alias dstop='docker stop `docker ps -q`'

# Docker Compose
alias dc='docker-compose'
alias dcu='docker-compose up'
alias dcr='docker-compose run --rm'

# kubernetes
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
alias kgnl='kubectl get po --show-labels'
alias kga='kubectl get all'

# terraform
alias tf='terraform'
alias tfp='terraform plan'
alias tfsh='terraform show'
alias tfst='terraform state'
alias tfstl='terraform state list'
alias tfstsh='terraform state show'
alias tfst-mv='terraform state mv'
alias tfst-rm='terraform state rm'


# az cli
alias asa="az account set --subscription"
alias asl="az account list"
alias ash="az account show"
alias anrl="az network route-table list"
alias anp="az network public-ip list"
alias aagw="az network application-gateway list"
alias acal="az containerapp list"
alias azcalogsh='az containerapp logs show'

alias aznsg='az network nsg'
alias aznsgl='az network nsg list'
alias aznsgr='az network nsg rule'
alias aznsgrl='az network nsg rule list'

alias azvgw='az network vnet-gateway'
alias azvgwsh='az network vnet-gateway show'
alias azvgwl='az network vnet-gateway list'

alias aznet='az network vnet'
alias aznets='az network vnet show'
alias aznetl='az network vnet list'
alias aznetsub='az network vnet subnet'
alias aznetsubsh='az network vnet subnet show'
alias aznetsubl='az network vnet subnet list'

alias azag='az network application-gateway'
alias azagsh='az network application-gateway show'
alias azagl='az network application-gateway list'
alias azag-start='az network application-gateway start'
alias azag-stop='az network application-gateway stop'

alias azsa='az storage account'
alias azsash='az storage account show'
alias azsal='az storage account list'
alias azsa-keys='az storage account keys list'
alias azsacntr='az storage container list'


alias amonmtal='az monitor metrics alert list'
alias amonacl='az monitor activity-log alert list'
alias amonsql='az monitor scheduled-query list'

# for macos brew
export HOMEBREW_NO_AUTO_UPDATE=1
# bash completion enable
if [ -f /usr/local/share/bash-completion/bash_completion ]; then
  . /usr/local/share/bash-completion/bash_completion
fi

# make history more verbose
export HISTSIZE=10000
export HISTTIMEFORMAT="%h %d %H:%M:%S "
# PROMPT_COMMAND='history -a'
export HISTIGNORE="ls:ll:history:w:htop:pwd"

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


GIT_PROMPT_ONLY_IN_REPO=1

if [ -f "$HOME/.bash-git-prompt/gitprompt.sh" ]; then
    source $HOME/.bash-git-prompt/gitprompt.sh
fi

export PYTHONSTARTUP=~/.pythonrc
ANSIBLE_CONFIG=~/.ansible/ansible.cfg
export ANSIBLE_CONFIG
export ANSIBLE_FORCE_COLOR=true

# az cli completion
if [ -f "/etc/bash_completion.d/azure-cli" ]; then
    source /etc/bash_completion.d/azure-cli
fi

