vim_setup
=========

Scripts to set up my vim environment on any machine. Right now it installs the following scripts and plugins:

* [Most Recently Used](https://github.com/yegappan/mru)
* [taglist.vim](https://github.com/vim-scripts/taglist.vim)
* [pathogen.vim](https://github.com/tpope/vim-pathogen)
* [SnipMate](https://github.com/garbas/vim-snipmate) along with some custom snippets

The vimrc will change the leader key to `<Space>`. The following custom mappings are defined:

* `<Space>s` Save session (to ~/.vim/session)
* `<Space>l` Restore session
* `<Space>mf` Add `:Mru ` in command line which allows you to specify a filter before hitting enter
* `<Space>mr` Directly open most recently used files list
* `<Space>t` Open new tab
* `<Space>g` Toggle taglist

**Attention: This will overwrite your .vimrc without asking! You have been warned.**

`git clone https://github.com/moee/vim_setup.git ~/vim_setup && cd ~/vim_setup && ./setup.sh && cd .. && rm vim_setup -rf`
