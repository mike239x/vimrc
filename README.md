# Introduction

This is a repo for my own `.vim` folder.  In no way I recommend anybody to
copy what I got here (especially because I am noob myself), but you are
welcome. I do however recommend you to start with something else, be it
my repo on vim-notes (link will be added later) or some proper guides from other people.

# Notes

1. This entire guide is for Linux.

2. The usage should be the following:
    1. Create a `.vim` folder in your home (`~`) directory.
    2. Go into that folder and copy this git repo inside of the folder:
    ```bash
    git clone http://mike239x/vimrc
    ```
    
    Alternatively, don't do that. Just create you own `vimrc` file in there and
    initialize your own git in there.
    3. TODO: Do some magic with git submodules maybe.
    4. Add a link file so that vim can load your configuration:
    ```bash
    ln -s ~/.vim/vimrc ~/.vimrc
    ```

2. First things first, one should check what one has:

  ```bash 
  vim --version 
  ``` 
  
  is your friend.

3. I use pathogen as the packages manager. It looks super easy and
   doesn't require any configuring. I like easy things.

4. To get CtrlP package up and running one needs `+ruby` flag in the vim
   version and ruby itself. To get it one can write
   
   ```bash
   sudo apt install ruby ruby-dev vim-nox;
   ```

5. To get registers `"+` and `"*` one needs `+xterm_clipboard` flag in the vim version.
   This can be installed via

   ```bash
   sudo apt install vim-gtk
   ```

6. To swap control and caps lock keys:
    1. Run
    ```bash
    sudo vim /etc/default/keyboard
    ```
    and edit `XKBOPTIONS="ctrl:swapcaps"`.
    2. Then, run
    ```bash
    /usr/bin/setxkbmap -option "ctrl:swapcaps"
    ```
    3. Reboot.


# Packages

Here is the list of packages I am using. To read more about them 
visit https://vimawesome.com/. 

* lightline
* NERDcommenter
* NERDtree
* surrond
* CtrlP by ctrlp.vim
* window-swap
* targets
* vim-markdown by Gabriele Lana
* YouCompleteMe (mostly used as the continuation of SuperTab, I guess)
