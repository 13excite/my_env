#PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
#export PATH
#ANSIBLE_CONFIG=~/.ansible/ansible.cfg
#export ANSIBLE_CONFIG
export PATH=$PATH:/opt/homebrew/bin:/usr/local/go/bin

# git promt enable
if [ -f "/opt/homebrew/opt/bash-git-prompt/share/gitprompt.sh" ]; then
  __GIT_PROMPT_DIR="/opt/homebrew/opt/bash-git-prompt/share"
  source "/opt/homebrew/opt/bash-git-prompt/share/gitprompt.sh"
fi


#export BASH_COMPLETION_COMPAT_DIR="/opt/homebrew/etc/bash_completion.d"


# old entities. Maybe need ????
#export PYENV_ROOT="$HOME/.pyenv"
#export PATH="$PYENV_ROOT/bin:$PATH"
#export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk-15.0.2.jdk/Contents/Home

# Setting PATH for Python 3.9
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.9/bin:${PATH}"
export PATH


# bash completion
[[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] && . "/opt/homebrew/etc/profile.d/bash_completion.sh"

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

if [ -f /usr/local/share/bash-completion/bash_completion ]; then
  . /usr/local/share/bash-completion/bash_completion
fi

# kube autocompletion
source ~/.kube/kubectl_autocompletion
