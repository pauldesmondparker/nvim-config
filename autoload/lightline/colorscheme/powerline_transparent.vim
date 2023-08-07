" =============================================================================
" Filename: autoload/lightline/colorscheme/powerline_transparent.vim
" Author: Paul Desmond Parker
" License: MIT License
" Last Change: Fri Aug  4 09:53:53 AM +08 2023
" =============================================================================

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
let s:p.normal.left = [ ['darkestgreen', 'brightgreen', 'bold'], ['white', 'gray4'], ['darkestgreen', 'brightgreen', 'bold'] ]
let s:p.normal.right = [ ['gray5', 'gray10'], ['gray9', 'gray4'], ['gray8', 'gray2'], ['gray8', 'gray2'] ]
let s:p.inactive.right = [ ['gray1', 'gray5'], ['gray4', 'gray1'], ['gray4', 'gray0'], ['gray4', 'gray0'] ]
let s:p.inactive.left = s:p.inactive.right[1:]
let s:p.insert.left = [ ['darkestcyan', 'white', 'bold'], ['white', 'darkblue'], ['darkestcyan', 'white', 'bold'] ]
let s:p.insert.right = [ [ 'darkestcyan', 'mediumcyan' ], [ 'mediumcyan', 'darkblue' ], [ 'mediumcyan', 'darkestblue' ] ]
let s:p.replace.left = [ ['white', 'brightred', 'bold'], ['white', 'gray4'], ['white', 'brightred', 'bold'] ]
let s:p.visual.left = [ ['darkred', 'brightorange', 'bold'], ['white', 'gray4'], ['darkred', 'brightorange', 'bold'] ]
let s:p.visual.middle = [ [ 'brightorange', 'NONE', 'underline' ] ]
let s:p.normal.middle = [ [ 'brightgreen', 'NONE', 'underline' ] ]
let s:p.insert.middle = [ [ 'darkestcyan', 'NONE', 'underline' ] ]
let s:p.inactive.middle = [ [ 'gray5', 'NONE', 'underline' ] ]
let s:p.replace.middle = [ [ 'brightred', 'NONE', 'underline' ] ]
let s:p.replace.right = s:p.normal.right
let s:p.tabline.left = [ [ 'gray9', 'gray4' ] ]
let s:p.tabline.tabsel = [ [ 'gray9', 'gray1' ] ]
let s:p.tabline.middle = [ [ 'gray4', 'NONE', 'underline' ] ]
let s:p.tabline.right = [ [ 'gray9', 'gray3' ] ]
let s:p.normal.error = [ [ 'gray9', 'brightestred' ] ]
let s:p.normal.warning = [ [ 'gray1', 'yellow' ] ]

let g:lightline#colorscheme#powerline_transparent#palette = lightline#colorscheme#fill(s:p)
