" vim-plug plugins
" ----------------
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'Chiel92/vim-autoformat'           " code auto-formatter
Plug 'ctrlpvim/ctrlp.vim'               " quick file look-up and switching
Plug 'fatih/vim-go'                     " golang integration
Plug 'lifepillar/vim-solarized8'        " solarized colourschemes
Plug 'mattn/emmet-vim'                  " zencoding (html shorthand expander)
Plug 'mhinz/vim-signify'                " vcs gutter
Plug 'moll/vim-bbye'                    " buffer deletion
Plug 'plasticboy/vim-markdown'          " better markdown support
Plug 'scrooloose/nerdtree'              " file explorer
Plug 'tpope/vim-surround'               " motions to change bracketed text
Plug 'vim-airline/vim-airline'          " airline toolbar
Plug 'vim-airline/vim-airline-themes'   " airline themes
Plug 'w0rp/ale'                         " asynchronous lint engine
call plug#end()


" plugin configurations
" --------------
" airline
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_theme = "sol"
let g:airline_powerline_fonts = 1
let g:airline_skip_empty_sections = 1

" vim-autoformat
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 1
let g:formatdef_custom_tidy_html = '"tidy -q --show-errors 0 --show-warnings 0 --force-output --indent auto --indent-spaces ".shiftwidth()." --tidy-mark no -wrap ".&textwidth'
let g:formatters_html = ['custom_tidy_html']

" golang
let g:go_fmt_command = "goimports"

" markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_no_default_keymappings = 1
let g:vim_markdown_emphasis_multiline = 0
let g:vim_markdown_new_list_item_indent = 2

" ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = {
\   'dir': 'node_modules\|DS_STORE\|git',
\   'file': '\v\.(a|so|o|dll|tar|gz)$',
\}

" emmet
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

" signify
let g:signify_vcs_list = [ 'git' ] ", 'hg', 'bzr' ]

" key mappings and mouse behavior
" -------------------------------
set mouse=a
map <C-n> :NERDTreeToggle<CR>
map <C-d> :Bdelete<CR>
map <C-a> :Autoformat<CR>
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
map <C-h> :vertical resize -1<CR>
map <C-l> :vertical resize +1<CR>
map <C-j> :resize +1<CR>
map <C-k> :resize -1<CR>


" colourscheme
" ------------
if has("termguicolors")
    set termguicolors
    colorscheme solarized8_light_flat
endif

" syntax highlighting
filetype plugin on
syntax on
set hlsearch

" match parens
hi MatchParen cterm=none ctermbg=darkgrey ctermfg=lightmagenta
hi Search cterm=underline ctermbg=darkgrey ctermfg=lightblue

" highlight trailing whitespace
hi ExtraWhiteSpace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+$/
au BufEnter * match ExtraWhitespace /\s\+$/
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhitespace /\s\+$/
au BufLeave * call clearmatches()

" misc configurations
" --------------------
" always use directory containing file as working directory
au BufEnter * silent! lcd %:p:h

" better buffer management
set hidden

" relative line numbering while editing (for effective macro usage)
set number
set relativenumber
au InsertEnter * set norelativenumber
au InsertLeave * set relativenumber

" convert tabs to 4 spaces
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set smartindent

" code folding
set foldmethod=indent
set foldlevel=20

" faster grep
set grepprg=grep\ -nH\ $*
if executable('ag') " when we have ag, use it.
    set grepprg=ag\ --nogroup\ --nocolor\ -S\ --ignore\ node_modules\ --ignore\ .git\ --ignore\ tags
end

" file type specific settings
" ---------------------------
au FileType c           set cc=78 tw=78
au FileType cpp         set cc=78 tw=78
au BufWrite *.c         :Autoformat
au BufWrite *.h         :Autoformat
au BufRead  Makefile    set tabstop=8 softtabstop=8 shiftwidth=8 noexpandtab
au FileType rust        set cc=80 tw=80
au FileType go			set cc=80 tw=80 noexpandtab
au FileType javascript  set cc=80 tw=80
au BufWrite *.js        :Autoformat
au FileType html        set tabstop=2 softtabstop=2 shiftwidth=2
au FileType xml         set tabstop=2 softtabstop=2 shiftwidth=2
au FileType java        set cc=120 tw=120
au BufRead  *.x68       set noexpandtab filetype=asm68k
au BufRead  *.tex       set cc=80 tw=80 spell
au FileType yaml        set cc=80 tabstop=2 softtabstop=2 shiftwidth=2
au FileType css         set cc=80 tabstop=2 softtabstop=2 shiftwidth=2
au BufRead  *.md        set cc=72 tw=72 filetype=markdown
au BufRead  README      set cc=72 tw=72 filetype=markdown
au BufRead  TODO        set cc=72 tw=72 filetype=markdown
" git tmpsg line width truncation
au BufRead tmpmsg.*     set tw=72 cc=72
