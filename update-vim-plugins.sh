#!/bin/bash

for d in $(find ./vim/bundle -type d -maxdepth 1); do
	cwd=$PWD
	cd $d
	echo Updating $d
	git pull -q
	cd $cwd
done
