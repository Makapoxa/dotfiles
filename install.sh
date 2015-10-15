#!/bin/bash

cp -f ./files/git-prompt.sh ~/.git-prompt.sh
cp -f ./files/bash_customize ~/.bash_customize
cp -f ./files/vimrc ~/.vimrc
mkdir -p ~/.vim/bundle
cp -rf ./Vundle.vim ~/.vim/bundle/Vundle.vim

if ! grep -q 'source ~/.bash_customize' ~/.bashrc; then
	echo "source ~/.bash_customize" >> ~/.bashrc
fi

