#!/bin/bash

sudo apt-get install \
  nano htop di dlocate ppa-purge unar unicode info bash-doc tmux ack-grep \
  openssh-server autossh curl w3m html-xml-utils xml2 \
  git tig git-gui gitg mercurial bzr subversion meld colordiff \
  idle{,3} ipython{,3}-notebook ipython{,3}-qtconsole python-virtualenv python{,3}-pip \
  gtk-redshift nautilus-open-terminal \
  read-edid mtr \
  ruby-full rubygems rake pandoc retext libjs-mathjax

function has-ppa () {  # has-ppa foo/bar  # don't prepend ppa:
  apt-get update --print-uris  | grep -q "$1"
}

function add-ppa () {
  if ! has-ppa "$1"; then
    sudo apt-add-repository "ppa:$1"
    update=1
  fi
}

add-ppa fish-shell/release-2

add-ppa cassou/emacs

if ! has-ppa fmarier/git-annex; then
  # http://git-annex.branchable.com/install/Ubuntu/
  # deb form to force precise version (no raring build in his PPA yet).
  sudo /usr/bin/add-apt-repository -y 'deb http://ppa.launchpad.net/fmarier/git-annex/ubuntu precise main'
  sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 90F7E9EB
  update=1
fi

add-ppa chris-lea/node.js

if ! has-ppa docker.io; then
  sudo /usr/bin/add-apt-repository -y 'deb http://get.docker.io/ubuntu docker main'
  sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9
  update=1
fi

# http://askubuntu.com/questions/362259/how-to-watch-videos-in-amazon-prime-instant-video
# Only adding PPA here, not installing hal by default.
add-ppa mjblenner/ppa-hal

# Add SAGE repo but don't install by default - it's over 500MB!
add-ppa aims/sagemath

[ "$update" == 1 ] && sudo apt-get update

sudo apt-get install fish emacs-snapshot-gtk git-annex nodejs nodejs-legacy npm phantomjs lxc-docker

# TODO: set DEFAULT_FORWARD_POLICY="ACCEPT" in /etc/default/ufw for Docker
#       http://docs.docker.io/en/latest/installation/ubuntulinux/#ufw

if ! which rhc; then
  sudo gem install rhc
else
  sudo gem update rhc
fi
