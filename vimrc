" Allow saving of files as sudo when I forgot to start vim using sudo.
" cmap w!! w !sudo tee > /dev/null %

" .vimlocal override
" silent! so .vimlocal

" set fileformat=unix
" set ffs=unix
" set encoding=utf-8
" set fileencoding=utf-8
" set list listchars=eol:↲,tab:➤\ ,nbsp:␣,trail:◌,extends:▶,precedes:◀
" set showbreak=↪\ 

" NonText ->  "eol", "extends" and "precedes".
""" hi NonText ctermfg=28 guifg=#008700
"(eol)
"extends)..................................................................................................................................................................

" SpecialKey -> "nbsp", "tab" and "trail"."
""" hi SpecialKey ctermfg=28 guifg=#008700
"(nbsp)      (tab)	 	 	 	  (trail)     

" ➤ ⬚   
" ↲¬
" set list listchars=tab:▶‒,nbsp:∙,trail:∙,extends:▶,precedes:◀
" ⤐
" ⇦ ⇨  ⇒⇒⇐ ⇉ ⬅  ⮕  ⬌  ⤇    →  ← ⇀ 
" ·⇨↣↣⇢⇸⟹o↦
" ⟹   ¨

" let mapleader = ","


" call plug#begin('~/.vim/plugged')

"  ""  Plug 'Quramy/tsuquyomi', { 'do': 'yarn global add typescript' }
"    Plug 'Shougo/vimproc.vim', { 'do': 'make' } "async execution
"    Plug 'https://github.com/romainl/Apprentice.git'
"    " Plug 'neoclide/coc.nvim', {'branch': 'release'}
"    Plug 'neoclide/coc.nvim', { 'branch': 'master', 'do': 'yarn install --frozen-lockfile' }
"    "Plug 'HerringtonDarkholme/yats' "Typescript syntax file
"    "Plug 'jparise/vim-graphql'
"    "Plug 'lervag/vimtex'
"    "Plug '~/sandpit/vim-latex-live-preview'
"  
"    " Rust setup
"    "Plug 'dense-analysis/ale'
"    Plug 'rust-lang/rust.vim'
"    "Plug 'vim-syntastic/syntastic'
"  "  Plug 'Valloric/YouCompleteMe', { 'do': './install.py --rust-completer' }
"  
"    Plug 'itchyny/lightline.vim' "h g:lightline.colorscheme
"    Plug 'machakann/vim-highlightedyank'
"    "Plug 'andymass/vim-matchup' " Apparently doesn't work for Rust at this time
"  
"    " fzf
"    "Plug 'airblade/vim-rooter'
"    "Plug 'junegunn/fzf.vim' "Very interesting, but I don't have time to learn
"    Plug 'SirVer/ultisnips'
"    Plug 'honza/vim-snippets'
"    "Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
"  ""  Plug 'leafgarland/typescript-vim'
"  
"  " Unmanaged plugin (manually installed and updated)
"  " Plug '~/.vim/bundle/vim.elm'
"    Plug 'tpope/vim-sensible'
"    Plug 'tpope/vim-fugitive'
"    Plug 'othree/html5.vim'
"    Plug 'nicwest/vim-http'
"    Plug 'chrisbra/Colorizer'
"    Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
"    Plug 'prisma/vim-prisma'
"    Plug 'github/copilot.vim'
"    Plug 'preservim/nerdtree'
"    Plug 'preservim/tagbar'
"    Plug 'ludovicchabant/vim-gutentags'
"    Plug 'nvim-lua/plenary.nvim'
"    Plug 'nvim-telescope/telescope.nvim', { 'branch': '0.1.x' }
"    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
"    Plug 'nvim-tree/nvim-web-devicons'
"    " Plug 'shellRaining/hlchunk.nvim'
" call plug#end()

" hi link FloatBorder NonText
" syntax on
" set termguicolors

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
" set updatetime=10000

" Don't pass messages to |ins-completion-menu|.
" set shortmess+=c

" Always show the signcolumn
" set signcolumn=yes

" let ayucolor="dark"
" colorscheme ayu  " Good color scheme. Nice dark background.
" colorscheme cyanic " My old color scheme. Problem with error highlights
" colorscheme afterglow " Good solid color scheme. Just a touch glaring
" colorscheme alduin " Nice background grey, good contrast without glaring, downside: text changes bg
" colorscheme anderson " Contrast between bg and fg is a little washed out
" colorscheme angr  " Good background. Slight glare. Diff background on line numbers
" colorscheme deus  " TMUX bottom field is bright lime green. Otherwise good.
" colorscheme dracula " Background just needs to be a little darker (handled)

" Trigger configuration. You need to change this to something other than <tab> if you use one of the following:
" - https://github.com/Valloric/YouCompleteMe
" - https://github.com/nvim-lua/completion-nvim
" " let g:UltiSnipsExpandTrigger="<c-l>"
" " let g:UltiSnipsJumpForwardTrigger="<c-l>"
" " let g:UltiSnipsJumpBackwardTrigger="<c-h>"
"let g:ycm_auto_trigger = 0

" If you want :UltiSnipsEdit to split your window.
"let g:UltiSnipsEditSplit="vertical"

" --------------------------------------------
" Various settings
" --------------------------------------------
" Changing specific colors in colorschemes
"    function! s:MyHighlights() abort
"        hi! Normal guibg=#000000
"        hi! LineNr guibg=#000000
"        hi! Pmenu guibg=#000000
"        "hi! Pmenu guibg=#f0fff0
"        hi! Normal ctermbg=NONE guibg=NONE
"        hi! NonText ctermbg=NONE guibg=NONE
"    
"        hi! NormalFloat guibg=#1f2335
"        hi! FloatBorder guifg=white guibg=#1f2335]]
"    "CocFloating default highlight group of floating windows/popups.↲
"    "Default link to NormalFloat on neovim and`Pmenu on vim.↲
"    "CocErrorFloat for errors in floating windows/popups.↲
"    "CocWarningFloat for warnings in floating windows/popups.↲
"    "CocInfoFloat for infos in floating windows/popups.↲
"    "CocHintFloat for hints in floating windows/popups.↲
"    "hi CocErrorSign guibg=#990000
"    endfunction
"    augroup MyColors
"        autocmd!
"        autocmd ColorScheme * call s:MyHighlights()
"    augroup END

" colorscheme apprentice


" set showmatch
" set ignorecase
" set showmode
" set nowrap
" set hlsearch
" set nu

" Settings for using only tabs, not spaces, for indent
" set tabstop=2
" set shiftwidth=2
" set expandtab

" --------------------------------------------
" My mappings
" --------------------------------------------
" nmap <leader>rc ciw<C-r>0<Esc>
" "ino ,<CR> <CR>,<Tab><Esc><lA
" ino {,<CR> {<CR><CR>}<Esc>>ki<Tab><Tab><Tab>
" ino {<CR> {<CR><CR>}<Esc>ki<Tab>
" ino {<Space> {  }<Left><Left>
" ino (<Space> (  )<Left><Left>
" ino [<Space> [  ]<Left><Left>

" --------------------------------------------
" Convenience mappings
" --------------------------------------------
" nmap <C-N> :noh <CR>
" Use jj to get out of insert mode
" imap jj <Esc>
" Remap Ctrl + Z to save, in all modes
" noremap <silent> <C-Z>      :update<CR>
" vnoremap <silent> <C-Z>     :<C-C>:update<CR>
" inoremap <silent> <C-Z>     <C-[>:update<CR>
" --------------------------------------------

" --------------------------------------------
" Speed up navigation 4x by holding Ctrl key
" --------------------------------------------
"nmap <c-j> 4j
"nmap <c-k> 4k
"nmap <c-h> 4h
"nmap <c-l> 4l
" --------------------------------------------

" filetype plugin indent on
" autocmd BufNewFile,BufRead *.rs set filetype=rust
" autocmd BufNewFile,BufRead *.nix set filetype=nix
" autocmd BufNewFile,BufRead *.sol set filetype=solidity
" autocmd BufNewFile,BufRead *.prisma set filetype=prisma
" --------------------------------------------
" vim-latex-live setup
" --------------------------------------------
"let g:livepreview_previewer = 'evince'
" let g:livepreview_use_biber = 0
"let g:livepreview_engine = 'pdflatex'
" --------------------------------------------
" Autocomplete setup
" --------------------------------------------
"set completeopt=menu,menuone,preview,noselect,noinsert

" --------------------------------------------
" Compiler callbacks (:checkhealth)
" --------------------------------------------
" let g:vimtex_compiler_progname = 'nvr'
" let g:python3_host_prog = '/usr/bin/python3'

" --------------------------------------------
" ALE setup
" --------------------------------------------
"let g:ale_linters = {
"\  'rust': ['analyzer'],
"\}

"let g:ale_fixers = { 'rust': ['rustfmt', 'trim_whitespace', 'remove_trailing_lines'] }

" Optional, configure as-you-type completions
"set completeopt=menu,menuone,preview,noselect,noinsert
"let g:ale_completion_autoimport = 1
"let g:ale_completion_enabled = 1
"let g:ale_disable_lsp = 1
"let g:ale_set_loclist = 1
"let g:ale_set_quickfix = 0
"let g:ale_floating_preview = 1
"let g:ale_cursor_detail = 1

"let g:ale_hover_to_preview = 1
"let g:ale_hover_to_floating_preview = 1
"let g:ale_detail_to_floating_preview = 1
"let g:ale_floating_window_border = ['│', '─', '╭', '╮', '╯', '╰']

"nmap <silent> <C-k> <Plug>(ale_previous_wrap)
"nmap <silent> <C-j> <Plug>(ale_next_wrap)

" --------------------------------------------
" Syntastic setup
" --------------------------------------------
""set statusline+=%#warningmsg#
""set statusline+=%{SyntasticStatuslineFlag()}
""set statusline+=%*

"let g:typescript_indent_disable = 1
""let g:syntastic_always_populate_loc_list = 1
""let g:syntastic_auto_loc_list = 1
""let g:syntastic_check_on_open = 1
""let g:syntastic_check_on_wq = 0
""let g:tsuquyomi_disable_quickfix = 1
""let g:syntastic_typescript_checkers = ['tsuquyomi']
""let g:syntastic_javascript_checkers = ['eslint']
""let g:syntastic_javascript_eslint_exe = 'npm run lint --'
""let g:syntastic_json_checkers=['jsonlint']

" --------------------------------------------
" nCoC setup
" --------------------------------------------
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <tab> pumvisible() ? "\<C-n>" : "\<tab>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-s> to trigger completion.
inoremap <silent><expr> <c-s> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" https://github.com/neoclide/coc.nvim#example-vim-configuration
"inoremap <silent><expr> <c-space> coc#refresh()
" Close preview window after completion is done
"autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif


" use <c-space>for trigger completion
"inoremap <silent><expr> <NUL> coc#refresh()
" Use <Tab> for confirm completion.
" Coc only does snippet and additional edit on confirm.
"inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<Plug>(ale_next_wrap)"
"inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<Plug>(ale_previous_wrap)"

" gd - go to definition of word under cursor
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)

" gi - go to implementation
nmap <silent> gi <Plug>(coc-implementation)

" gr - find references
nmap <silent> gr <Plug>(coc-references)

" gh - get hint on whatever's under the cursor
nnoremap <silent> gh :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

nnoremap <silent> <leader>co  :<C-u>CocList outline<cr>
nnoremap <silent> <leader>cs  :<C-u>CocList -I symbols<cr>

nnoremap <silent> <leader>cd  :<C-u>CocDiagnostics<cr>
nnoremap <silent> <leader>cn  :call CocAction('diagnosticNext')<CR>
nnoremap <silent> <leader>cp  :call CocAction('diagnosticPrevious')<CR>

" List errors
" nnoremap <silent> <leader>cl  :<C-u>CocList locationlist<cr>
nnoremap <silent> <leader>cl  :<C-u>CocCommand eslint.executeAutofix<cr>

" list commands available in tsserver (and others)
nnoremap <silent> <leader>cc  :<C-u>CocList commands<cr>

" restart when tsserver gets wonky
nnoremap <silent> <leader>cR  :<C-u>CocRestart<CR>

" manage extensions
nnoremap <silent> <leader>cx  :<C-u>CocList extensions<cr>

" rename the current word in the cursor
nmap <leader>cr  <Plug>(coc-rename)
nnoremap <silent> <leader>cf  :<C-u>CocCommand editor.action.formatDocument<cr>

" run code actions
vmap <leader>ca  <Plug>(coc-codeaction-selected)
nmap <leader>ca  <Plug>(coc-codeaction-selected)

" open NERD explorer
nnoremap <silent> <leader>nt :<C-u>NERDTreeToggle<cr>

funct! DiffTwoTexts(text1, text2)
  new
  put =a:text1
  normal ggdd
  diffthis
  new
  put =a:text2
  normal ggdd
  diffthis
endfunct

funct! DiffTwoLines(line1, line2)
  let text1 = getline(a:line1)
  let text2 = getline(a:line2)
  call DiffTwoTexts(text1, text2)
endfunct

funct! GallFunction(re)
  cexpr []
  execute 'silent! noautocmd bufdo vimgrepadd /' . a:re . '/j %'
  cw
endfunct

command! -nargs=1 Gall call GallFunction(<q-args>)

lua require('mymodule')
" lua vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border, })
