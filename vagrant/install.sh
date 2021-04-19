#!/bin/bash -e

sleep 2

cd /vagrant

./linux_install.sh

chown vagrant.vagrant $HOME/db
