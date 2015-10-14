#!/bin/bash

cp -f ./git-prompt.sh ~/.git-prompt.sh
cp -f ./bash_customize ~/.bash_customize
cp -f ./vimrc ~/.vimrc

if ! grep -q 'source ~/.bash_customize' ~/.bashrc; then
	echo "source ~/.bash_customize" >> ~/.bashrc
fi

