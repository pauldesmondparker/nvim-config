# Neovim Configuration

> **Warning**
> Current issues.

* Prettier extension has issue <BS>https://github.com/itchyny/lightline.vim/issues/657
 - changed ~/.config/coc/extensions/node_modules/coc-prettier/lib/index.js
 - https://github.com/neoclide/coc-prettier/pull/165#issuecomment-1664546644

* auto-pairs not working as expected

## Tooling

### Lazy Plugin Manager

### Colorscheme

> **Note**
> Apprentice. A autocmd on colorscheme matching pattern "apprentice" makes the background transparent.

### Status Line

> **Note**
> Using `Lightline`. Overloading colorscheme with local custom `powerline_transparent`.

> **Warning**
> Lightline is currently patch locally to allow the config to call lua functions.
> https://github.com/itchyny/lightline.vim/issues/657

### LSP

> **Note**
> Using coc.nvim for now. Planning to move to neovim native lsp handling in the future.

### Leap

> **Note**
> leap.vim for quick jumping to anywhere on the visible page.

### Automatic Brackets

> **Note**
> Not happy with jiangmiao/auto-pairs as yet, but it may be that I need to configure it.

### Cursor Highlight

> **Note**
> I've always done this with snippets, but currently using vim-illuminate

### Highlight Yank

> **Note**
> HighlightYank

### Copilot

### Block Highlighting

> **Note**
> hlchunk is nice. Have some custom colors in place to make it unobstrusive.


## Others
- nvim-treesitter
- suda
- vim-numbertoggle
- gitgutter
- gitbranch
