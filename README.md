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
    $ git clone http://mike239x/vimrc
    $ git submodule update --init --recursive
    ```
    
   Alternatively, don't do that. Just create you own `vimrc` file in there and
   initialize your own git in there.

2. Add a link file so that vim can load your configuration:
    ```bash
    $ ln -s ~/.vim/vimrc ~/.vimrc
    ```

3. First things first, one should check what one has:

  ```bash 
  $ vim --version 
  ``` 
  
  is your friend.

4. I use pathogen as the packages manager. It looks super easy and
   doesn't require any configuring. I like easy things.

5. YouCompleteMe plugin should be compiled, read the manual on how to do that.

6. To get registers `"+` and `"*` one needs `+xterm_clipboard` flag in the vim version.
   This can be installed via
   ```bash
   $ sudo apt install vim-gtk
   ```

7. To swap control and caps lock keys:

    1. Run
    ```bash
    $ sudo vim /etc/default/keyboard
    ```
    and edit `XKBOPTIONS="ctrl:swapcaps"`.

    2. Then, run
    ```bash
    $ /usr/bin/setxkbmap -option "ctrl:swapcaps"
    ```

    3. Reboot.


# Packages

Here is the list of packages I am using. To read more about them 
visit https://vimawesome.com/. 

* lightline
* NERDcommenter
* NERDtree
* vim-surround
* CtrlP by ctrlp.vim
* vim-windowswap
* targets
* vim-markdown by Gabriele Lana
* YouCompleteMe (mostly used as the continuation of SuperTab, I guess)

# Colorshemes

Some of them are in `bundle` folder (as git submodules), and some are just 
`.vim` files in `colors` folder.

* jellybeans
* gruvbox
* dracula
* molokai
