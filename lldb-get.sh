#!/bin/sh
VER="v1.7.0"
PWD=`pwd`
DIR="$PWD/codelldb/$VER"
mkdir -p $DIR
curl -L "https://github.com/vadimcn/vscode-lldb/releases/download/v1.7.0/codelldb-x86_64-linux.vsix" -o $DIR/codelldb-x86_64-linux.vsix
unzip $DIR/codelldb-x86_64-linux.vsix -d $DIR

unlink $PWD/codelldb/latest || true
ln -s $PWD/codelldb/v1.7.0 $PWD/codelldb/latest
