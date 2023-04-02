nmap j gj
nmap k gk

:filetype indent on
:set filetype=html           
:set smartindent            

" " Coc completion fix ---------
" inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" inoremap <silent><expr> <C-x><C-z> coc#pum#visible() ? coc#pum#stop() : "\<C-x>\<C-z>"
" " remap for complete to use tab and <cr>
" inoremap <silent><expr> <TAB>
" \ coc#pum#visible() ? coc#pum#next(1):
" \ <SID>check_back_space() ? "\<Tab>" :
" \ coc#refresh()
" inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
" inoremap <silent><expr> <c-space> coc#refresh()
" " Coc completion fix ---------

" spell autocomplete
inoremap <expr> <c-x><c-k> SpellCheck("\<c-x>\<c-k>")
nnoremap z= :<c-u>call SpellCheck()<cr>z=
function! SpellCheck(...)
  let s:spell_restore = &spell
  set spell
  augroup restore_spell_option
    autocmd!
    autocmd CursorMoved,CompleteDone <buffer> let &spell = s:spell_restore | autocmd! restore_spell_option
  augroup END
  return a:0 ? a:1 : ''
endfunction
"
" Enable Omnicomplete features
set omnifunc=syntaxcomplete#Complete

:set relativenumber
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a
:set number
:set clipboard=unnamedplus
" :set spell
filetype plugin on
syntax enable

call plug#begin()

Plug 'https://github.com/kassio/neoterm' "Integrated Terminal 
Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw)
Plug 'https://github.com/preservim/nerdtree' " NerdTree
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'https://github.com/terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation
Plug 'https://github.com/neoclide/coc.nvim'  " Auto Completion
Plug 'https://github.com/jiangmiao/auto-pairs' "Close brackets
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'jesseleite/vim-noh'
Plug 'https://github.com/preservim/nerdcommenter'
Plug 'lervag/vimtex'
Plug 'davidhalter/jedi-vim'
Plug 'hashrocket/vim-macdown'


call plug#end()

" autocmd BufWritePost *.md exec :MacDownPreview

set encoding=UTF-8
nnoremap <C-f> :FZF<CR>

let g:jedi#show_call_signatures = "0"

" map ,h :noh<CR>
" autocmd VimEnter * :TSToggle highlight " cpp syntax highlighting

nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>

nnoremap <C-l> gt
nnoremap <C-h> gT

let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"
let NERDTreeMapOpenInTab='<ENTER>'

let g:tex_flavor = 'latex'
let g:vimtex_quickfix_enabled = 0
let g:vimtex_view_method = 'skim'
nnoremap <C-_> :VimtexErrors<CR>

set clipboard=unnamed

nmap <C-k> :TagbarToggle <CR>

:set completeopt-=preview " For No Previews

:colorscheme deus

" hi Normal guibg=NONE ctermbg=NONE "set transparent

" air-line
let g:airline_powerline_fonts = 1
" let g:airline#extensions#tabline#enabled = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

set t_Co=256

  " unicode symbols
  let g:airline_left_sep = '»'
  let g:airline_left_sep = '▶'
  let g:airline_right_sep = '«'
  let g:airline_right_sep = '◀'
  let g:airline_symbols.colnr = ' ㏇:'
  let g:airline_symbols.colnr = ' ℅:'
  let g:airline_symbols.crypt = '🔒'
  let g:airline_symbols.linenr = '☰'
  let g:airline_symbols.linenr = ' ␊:'
  let g:airline_symbols.linenr = ' ␤:'
  let g:airline_symbols.linenr = '¶'
  let g:airline_symbols.maxlinenr = ''
  let g:airline_symbols.maxlinenr = '㏑'
  let g:airline_symbols.branch = '⎇'
  let g:airline_symbols.paste = 'ρ'
  let g:airline_symbols.paste = 'Þ'
  let g:airline_symbols.paste = '∥'
  let g:airline_symbols.spell = 'Ꞩ'
  let g:airline_symbols.notexists = 'Ɇ'
  let g:airline_symbols.whitespace = 'Ξ'

" powerline symbols
  " let g:airline_left_sep = ''
  " let g:airline_left_alt_sep = ''
  " let g:airline_right_sep = ''
  " let g:airline_right_alt_sep = ''
  " let g:airline_symbols.branch = ''
  " let g:airline_symbols.colnr = ' ℅:'
  " let g:airline_symbols.readonly = ''
  " let g:airline_symbols.linenr = ' :'
  " let g:airline_symbols.maxlinenr = '☰ '
  " let g:airline_symbols.dirty='⚡'

" inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"
" g:coc_disable_startup_warning = 0
" let g:coc_force_debug = 1

let g:neoterm_default_mod='belowright' " open terminal in bottom split
let g:neoterm_size=16 " terminal split size
let g:neoterm_autoscroll=1 " scroll to the bottom when running a command
nnoremap <leader><cr> :TREPLSendLine<cr>j " send current line and move down
vnoremap <leader><cr> :TREPLSendSelection<cr> " send current selection

nnoremap <F9> :Ttoggle zsh<CR>

autocmd FileType python map <buffer> <C-c> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <C-c> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>

lua << EOF

require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "c", "lua", "rust", "python", "cpp", "javascript"},

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  auto_install = true,

  -- List of parsers to ignore installing (for "all")
  --ignore_install = { "javascript" },

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled

    disable = { "c", "rust", "latex"},

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
EOF
