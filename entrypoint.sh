#!/bin/bash
set -e

# set some needed variables
# Wait till cassandra is available on network
# Wait another extra 10 seconds for cassandra to accept client connections
# do a git clone from a git repo (with a db folder with a file called cassandra_fixtures.sql in it)
# Do the command to execute cqlsh with the cassandra_fixtures.sql script against the cassandra container

repo="https://github.com/cihatgenc/cassandra_fixtures.git"
localroot="/usr/local/bin"
reponame="${repo##*/}"

echo $reponame

name=$(echo $reponame | cut -f 1 -d '.')

echo $name

git clone "$repo" "$localroot/$name"

exec cqlsh --file="$localroot/$name/db/cassandra_fixtures.sql"

$0