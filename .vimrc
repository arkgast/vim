set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'
Plugin 'kien/ctrlp.vim'
Plugin 'mhinz/vim-signify'
Plugin 'tpope/vim-fugitive'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'majutsushi/tagbar'
Plugin 'mileszs/ack.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'mattn/emmet-vim'
Plugin 'Raimondi/delimitMate'
Plugin 'morhetz/gruvbox'

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
colorscheme gruvbox
set background=dark
set backspace=2
set cursorline
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

"highlight ColorColumn ctermbg=magenta

call matchadd('ColorColumn', '\%81v', 100)

nmap <C-n> :NERDTreeToggle <CR>
nmap <leader>p :NERDTreeFind <CR> 

inoremap jk <ESC>
inoremap <C-t> <Esc>:tabnew<CR>

nnoremap <C-t>     :tabnew<CR>
nnoremap <silent> n n:call HLNext(0.2)<cr>
nnoremap <silent> N N:call HLNext(0.2)<cr>
nnoremap <F5> :buffers<CR>:buffer<Space>
nnoremap <CR> :noh<CR><CR>
noremap ;l :

vnoremap > >gv
vnoremap < <gv

let NERDTreeIgnore=["\.pyc$", "\.out$"]
let NERDTreeMouseMode=2

let g:jedi#auto_initialization=1
let g:jedi#auto_vim_configuration=1
let g:jedi#popup_on_dot=0
let g:jedi#show_call_signatures = 1

" Airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
"let g:airline_theme="hybrid"
let g:airline_theme="badwolf"

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
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Tagbar
nmap <F8> :TagbarToggle<CR>
let g:tagbar_autofocus=1

" Ack
"let g:ack_default_options = " -i --color --column --nofollow"

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
