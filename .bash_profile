export LC_ALL=ru_RU.UTF-8
export LANG=ru_RU.UTF-8

export PATH=/usr/local/bin:/usr/local/sbin:$PATH

if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

export TERM=xterm-color

# virtualenv should use Distribute instead of legacy setuptools
export VIRTUALENV_DISTRIBUTE=true
# Centralized location for new virtual environments
export PIP_VIRTUALENV_BASE=$HOME/.virtualenvs
# cache pip-installed packages to avoid re-downloading
export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache

export WORKON_HOME=$HOME/.virtualenvs

export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python
export VIRTUALENVWRAPPER_VIRTUALENV=/usr/local/bin/virtualenv
source /usr/local/bin/virtualenvwrapper.sh

export EDITOR='nano'

# Docker conf
export DOCKER_HOST=tcp://$(boot2docker ip 2>/dev/null):2376
export DOCKER_CERT_PATH=~/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1

export GREP_OPTIONS="--color=auto"

alias ls="ls -G"
alias ssh-forward='ssh -f -N'
complete -o default -o nospace -F _ssh ssh-forward

# Functions
pypath() {
    CURDIR=$(pwd)
    if [ -d "$CURDIR" ] && [[ ":$PYTHONPATH:" != *":$CURDIR:"* ]]; then
        PYTHONPATH="$CURDIR:$PYTHONPATH"
    fi
    export PYTHONPATH
}
