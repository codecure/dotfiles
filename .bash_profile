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

export DOCKER_HOST=tcp://$(boot2docker ip 2>/dev/null):2375

export GREP_OPTIONS="--color=auto"

alias pp="export PYTHONPATH=$(pwd):$PYTHONPATH"
alias ls="ls -G"
