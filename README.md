# Overview

A vim plugin with simple Markdown utilities. A lot of this plugin was inspired
by the [vimwiki](https://github.com/vimwiki/vimwiki) plugin. It's a great
plugin, but I realized I used a tiny portion of the plugin and was bothered by
the forced default mappings.

# Installation

Using [vim-plug](https://github.com/junegunn/vim-plug),
```vim
Plug 'glapa-grossklag/vim-md-md'
```

# Usage

All of the features of this plugin are made available through `<Plug>` mappings.
As an example, to toggle a markdown checkbox using the `<Enter>` key:
```vim
map <Enter> <Plug>MDCheckboxToggle
```

# Features

Unless specified otherwise, everything below will work with and without a
range.

| Key                      | Effect                                   |
| ------------------------ | ---------------------------------------- |
| `<Plug>MDCheckboxToggle` | Toggle the checkbox on the current line  |
| `<Plug>MDCheckboxFill`   | Fill the checkbox on the current line    |
| `<Plug>MDCheckboxEmpty`  | Empty the checkbox on the current line   |
| `<Plug>MDCheckboxMake`   | Change the current line to be a checkbox |
| `<Plug>MDNextLink`       | Jump to the next link                    |
| `<Plug>MDPrevLink`       | Jump to the previous link                |
