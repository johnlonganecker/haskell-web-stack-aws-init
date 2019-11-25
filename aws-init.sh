#!/bin/bash

set -eu

export PGPASSWORD="postgres"
export PGUSER="postgres"
export PGDB="haskell"

echo $PATH

cp .pgpass ~/.pgpass
chmod 600 ~/.pgpass
cp .bashrc ~/.bashrc

source ~/.bashrc

sudo yum -y update
curl -sSL https://s3.amazonaws.com/download.fpcomplete.com/centos/7/fpco.repo | sudo tee /etc/yum.repos.d/fpco.repo

sudo yum install -y /usr/include/libpq-fe.h
#sudo yum install -y postgresql-devel

#sudo yum install -y gcc-c++ make
sudo yum groupinstall -y 'Development Tools'

wget https://nodejs.org/dist/v12.13.1/node-v12.13.1-linux-x64.tar.xz -O node.tar.xz

tar xvf node.tar.xz
rm -f node.tar.xz

mv node-v12.13.1-linux-x64 ~/node/

wget https://github.com/commercialhaskell/stack/releases/download/v2.1.3/stack-2.1.3-linux-x86_64-static.tar.gz -O stack.tar.gz

tar xvf stack.tar.gz
rm -f stack.tar.gz

mv stack-2.1.3-linux-x86_64-static/ ~/stack/

npm install -g webpack webpack-cli

sudo yum install -y postgresql-server postgresql-contrib
sudo postgresql-setup initdb

sudo cp postgresql.conf /var/lib/pgsql/data/postgresql.conf
sudo cp pg_hba.conf /var/lib/pgsql/data/pg_hba.conf

sudo systemctl enable postgresql
sudo systemctl restart postgresql

# files
cd ~
git clone https://gitlab.com/williamyaoh/haskell-web-stack.git

cp haskell-web-stack-aws-init/server-configuration.cfg haskell-web-stack/server-configuration.cfg
cd haskell-web-stack/

psql -h localhost -U $PGUSER -c 'CREATE DATABASE haskell'
psql -d $PGDB -h localhost -U $PGUSER -c "ALTER USER postgres WITH PASSWORD 'postgres';"
psql -d $PGDB -h localhost -U $PGUSER -W -f tables.sql

make build
make run
