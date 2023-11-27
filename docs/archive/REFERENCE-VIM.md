# Vim

This is just a reference of all my tips and tricks for using Vim (as a noob).

- The run command (rc) file that customizes and configures Vim is located at `~/.vimrc`
  - This has re-mapped the leader key from the default `\` to `,`         
  - `<leader>+t` toggles `NERDTree` (A tree explorer plugin for Vim)
  - For other configurations, look into this file.
- `ctrlp` (A Full path fuzzy file, buffer, mru, tag) finder plugin for Vim has been installed and can be
  brought up using `<ctrl>+p`               
- To undo in vim, use `u` (See [reference][1]) 
- To redo in vim, use `<ctrl>+r` (See [reference][1]) 
- To select text, use `v` and then move cursor using `j`, `k`, `l` or `h`
- To select line, use `<shift>+v` 
- To copy text, use `y`
- To cut text, use `x`
- To paste text, use `p` (after) or `P` (before)
- To move between vim windows, use `<ctrl>+w w`, `<ctrl>+w h`,`<ctrl>+w j`,`<ctrl>+w k` or `<ctrl>+w l`
- To create a split, type in `:sp` (horizontal) or `:vsp` (vertical |)   
- To resize split, use `<ctrl>+w +`, `<ctrl>+w -`,`<ctrl>+w <` or `<ctrl>+w >`
- To tab/untab, use `< <` or `> >` (This means press the character twice)
- To move faster between words, use `b` and `e` 
- To move to start of line, use `0`
- To move to end of line, use `$`
- To turn off line wrap, use command: `:set nowrap`
- To turn on line wrap, use command: `:set wrap!`                                                                             
- To search and replace all, use command: `:%s/foo/bar/g`. Alternatively, use custom shortcut on selected word by using `<leader>+*`
- To run shell commands within vim, use the command `:!<command>`
  - For example, creating a new file, use the command `:!touch newfile.txt`  
- To open any file in vim, use the command `:e <path_to_file>` 

[1]: http://vim.wikia.com/wiki/Undo_and_Redo
[2]: https://robots.thoughtbot.com/vim-splits-move-faster-and-more-naturally
[3]: http://vim.wikia.com/wiki/Resize_splits_more_quickly
[4]: https://stackoverflow.com/questions/1656591/how-to-jump-back-to-nerdtree-from-file-in-tab
[5]: https://stackoverflow.com/questions/248102/is-there-any-command-to-toggle-enable-auto-text-wrapping
[6]: http://vim.wikia.com/wiki/Search_and_replace
[7]: https://stackoverflow.com/questions/1459750/vim-and-nerd-tree-extension-adding-a-file
