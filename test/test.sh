#! /usr/bin/env bash

function assert {
  if [ $1 -ne $2 ]
  then
    echo "assertion failed: $1 == $2"
    exit 1
  fi
}

function test {
  echo "testing: $1"
  docker run --rm -v $(pwd):/mnt arthurchaloin/atom-validator /mnt/$1
  assert $? $2
}

test test/valid.atom 0
test test/invalid.atom 1
test test/tooshort.atom 1
