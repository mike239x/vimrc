This is a repo for my own .vim file.

[on Linux] to swap control and caplock keys follow this guideline:

Open the following for editing:
$ sudo vim /etc/default/keyboard
And edit XKBOPTIONS="ctrl:swapcaps"
Then, reconfigure:
$ sudo dpkg-reconfigure keyboard-configuration
or
$ /usr/bin/setxkbmap -option "ctrl:swapcaps"

