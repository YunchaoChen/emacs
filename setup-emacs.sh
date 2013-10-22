#!/bin/bash

if [ ! -e ~/.emacs ]; then
	ln -s /opt/emacs/emacs ~/.emacs
fi

if [ ! -e ~/.emacs.d ]; then
	ln -s /opt/emacs/emacs.d ~/.emacs.d
fi

if [ ! -e /opt/emacs_bak ]; then
	mkdir /opt/emacs_bak
fi

if [ ! -e ~/.stardict/dic ]; then
	ln -s /opt/emacs/emacs.d/sdcv/dict ~/.stardict/dic
fi
