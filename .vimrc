set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'kien/ctrlp.vim'
Plugin 'mhinz/vim-signify'
Plugin 'plasticboy/vim-markdown'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'benjaminWhite/Benokai'
Plugin 'godlygeek/tabular' 

call vundle#end()

filetype plugin indent on


" autocmd vimenter * NERDTree " Open NERDTree when vim start
" Open NERDTree automatically, when no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Close VIM if the only window left open is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" Disable jedi python dic
autocmd FileType python setlocal completeopt-=preview expandtab
autocmd FileType html,css EmmetInstall
autocmd FileType c setlocal nosmartindent cindent

syntax on
colorscheme Benokai
set background=dark
set backspace=2
set encoding=utf8
set foldmethod=syntax
set foldnestmax=4
set hlsearch
set incsearch
exec "set listchars=tab:\uBB\uBB,nbsp:_,trail:\uB7"
set laststatus=2
set mouse=a
set nobackup
set noshowmode
set noswapfile
set nowritebackup
set number
set ruler
set shiftwidth=4
set showcmd
set showtabline=2
set smartindent
set softtabstop=4
"set spell
set tabstop=4
set wildmenu
set wildignore+=*.pyc,*.out

highlight ColorColumn ctermbg=magenta

call matchadd('ColorColumn', '\%81v', 100)

nmap <C-n> :NERDTreeToggle <CR>
nmap <C-m> :NERDTreeFind <CR> 

inoremap jk <ESC>
inoremap <C-t>     <Esc>:tabnew<CR>
inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>

nnoremap <C-t>     :tabnew<CR>
nnoremap <silent> n n:call HLNext(0.2)<cr>
nnoremap <silent> N N:call HLNext(0.2)<cr>
noremap ;l :

vnoremap > >gv
vnoremap < <gv

let NERDTreeIgnore=["\.pyc$", "\.out$"]
let NERDTreeMouseMode=2

let g:jedi#auto_initialization=1
let g:jedi#auto_vim_configuration=1
let g:jedi#popup_on_dot=0
let g:jedi#show_call_signatures = 0

" Airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 0
let g:ariline_theme="badwolf"

"Emmet
let g:user_emmet_install_global = 0
let g:user_emmet_leader_key='<c-y>'

"CtrlP Conf
let g:ctrlp_map = '<c-p>'

"Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_open=0
let g:syntastic_check_on_wq=0
let g:syntastic_php_checkers = ['php']
let g:syntastic_python_checkers=['flake8']
let g:syntastic_python_flake8_args='--ignore=E202,E231,E225'

" Ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

function! HLNext (blinktime)
	highlight WhiteOnRed ctermfg=white ctermbg=red
	let [bufnum, lnum, col, off] = getpos('.')
	let matchlen = strlen(matchstr(strpart(getline('.'),col-1),@/))
	let target_pat = '\c\%#'.@/
	let blinks = 2
	for n in range(1,blinks)
		let red = matchadd('WhiteOnRed', target_pat, 101)
		redraw
		exec 'sleep ' . float2nr(a:blinktime / (2*blinks) * 1000) . 'm'
		call matchdelete(red)
		redraw
		exec 'sleep ' . float2nr(a:blinktime / (2*blinks) * 1000) . 'm'
	endfor
endfunction
