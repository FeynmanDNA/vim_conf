# vimconfs and setups

1. git clone the repo and choose the flavor --> `cp vim_conf/<version>/.vimrc ~/` and `cp -r vim_conf/<version>/.vim/ ~/`

2. rely on Vundle to install the magic (https://github.com/VundleVim/Vundle.vim)

3. Set up Vundle: `git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim` --> this will set up Vundle in the home's `.vim/` folder

4. Install the plugins, install from command line: `vim +PluginInstall +qall`

## tanuki version Aug2018 Screenshot:
![Sample PNG](/vimrc_v3.png "Screenshot")

## tanuki version Jul2018 Screenshot:
![Sample PNG](/vimrc_v2.png "Screenshot")

## linode version Jul2018 Screenshot:
![Sample PNG](/vimrc_linodeJul2018.png "Screenshot")
*issue: the top banner line does not indicate changed file*

## past version Screenshot:
![Sample PNG](/vimrc_olaf2017.png "Screenshot")

## Common issues

### Plugin 'Shougo/neocomplete.vim' "Shougo's Tab-autocomplete
**neocomplete requires Vim 7.3.885 or later with Lua support ("+lua")**:

If `:echo has("lua")` returns `1`, then you're done; otherwise, see below

Debian (or Ubuntu)

Make sure you have any of these packages:

    vim-nox
    vim-gtk3

Or building Vim on Linux is not difficult. Remember to specify `--with-lua`

### Bundle 'Xuyuanp/nerdtree-git-plugin'
**[nerdtree-git-status] option 'g:NERDTreeIndicatorMapCustom' is deprecated, please use 'g:NERDTreeGitStatusIndicatorMapCustom'**:

