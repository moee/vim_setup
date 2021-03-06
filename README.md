# vim_setup

Scripts to set up my vim environment on any machine. Right now it installs the following scripts and plugins:

* [Most Recently Used](https://github.com/yegappan/mru)
* [taglist.vim](https://github.com/vim-scripts/taglist.vim)
* [pathogen.vim](https://github.com/tpope/vim-pathogen)
* [SnipMate](https://github.com/garbas/vim-snipmate) - along with some [pre-defined](https://github.com/honza/vim-snippets/tree/master/snippets) and [custom](bundle/mysnippets/snippets) snippets

The vimrc will change the leader key to `<Space>`. The following custom mappings are defined:

* `<Space>mf` Add `:Mru ` in command line which allows you to specify a filter before hitting enter
* `<Space>mr` Directly open most recently used files list
* `<Space>t` Open new tab and explore the current file's directory
* `<Space>g` Toggle taglist
* `<Space><NUM>` Go to tab <NUM> (works with numbers from 1 to 7)
* `<Space>q` Quit
* `<Space>e` Explore Directory

## Installation

**Attention: This will overwrite your .vimrc without asking! You have been warned.**

`bash <(curl -LsS https://raw.github.com/moee/vim_setup/master/install)`
