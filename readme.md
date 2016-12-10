# ctrlp-notes
Bridge between ctrlpvim/ctrlp.vim and xolox/vim-notes.

* Based on sample.vim from kien/ctrlp.vim
* Opens files using the Note: command

## Usage
Only tested with Pathogen. Clone this repository into your ~/.vim/bundles directory. Pathogen should pick it up the next time you run vim.

To load this extension into ctrlp, add this to your vimrc:

     let g:ctrlp_extensions = ['notes']


* This plugin assumes you have vim-notes installed and configured.
* Run `:CtrlPNotes` to invoke Ctrl-P with a list of your notes.
* All CtrlP shortcuts/commands should apply.
* You might want to create a shortcut in your .vimrc like so:

    nnoremap <C-N> :CtrlPNotes<CR>



