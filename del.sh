#!/bin/bash

path=$1
file=$2
echo $1

rm -rf "$path$file"
echo "file/s being removed from $path$file"
