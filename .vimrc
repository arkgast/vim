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

Plugin 'godlygeek/tabular'
Plugin 'terryma/vim-multiple-cursors'

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
autocmd FileType html,css setlocal nofoldenable
autocmd FileType html,css EmmetInstall
autocmd FileType c setlocal nosmartindent cindent

syntax on
colorscheme gruvbox
set background=dark
set backspace=2
set foldtext=CustomFoldText()
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
set nowrap
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
highlight Normal ctermbg=none

call matchadd('ColorColumn', '\%81v', 100)

nmap <leader>n :NERDTreeToggle <CR>
nmap <leader>p :NERDTreeFind <CR> 

inoremap jk <ESC>
inoremap <C-t> <Esc>:tabnew<CR>

nnoremap <CR> :noh<CR><CR>
nnoremap <silent> n n:call HLNext(0.2)<cr>
nnoremap <silent> N N:call HLNext(0.2)<cr>
nnoremap <C-t> :tabnew<CR>
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
nnoremap <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <A-Right> :execute 'silent! tabmove ' . tabpagenr()<CR>
nnoremap <F5> :buffers<CR>:buffer<Space>

noremap ;l :
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

" Move lines, right or left
vnoremap > >gv
vnoremap < <gv

" Move lines, up or down
nnoremap <C-Down> :m .+1<CR>==
nnoremap <C-Up> :m .-2<CR>==
inoremap <C-Down> <Esc>:m .+1<CR>==gi
inoremap <C-Up> <Esc>:m .-2<CR>==gi
vnoremap <C-Down> :m '>+1<CR>gv=gv
vnoremap <C-Up> :m '<-2<CR>gv=gv

let NERDTreeIgnore=["\.pyc$", "\.out$"]
let NERDTreeMouseMode=2

"let g:jedi#auto_initialization=1
"let g:jedi#auto_vim_configuration=1
"let g:jedi#popup_on_dot=0
"let g:jedi#show_call_signatures = 1

" Airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme="badwolf"
let g:airline#extensions#tabline#fnamemod = ':t:r'
"let g:airline_theme="hybrid"
"let g:airline_theme="monochrome"
"let g:airline_theme="murmur"
"let g:airline_theme="raven"
"let g:airline_theme="silver"

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
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_enable_highlighting=0
let g:syntastic_auto_loc_list=1
"let g:syntastic_c_checkers = ['cppchecker']
"let g:syntastic_cpp_checkers = ['cppchecker']
"let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_python_checkers=['flake8']
let g:syntastic_python_flake8_args='--ignore=E202,E231,E225'

" Ultisnips
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsEditSplit="vertical"

" Tagbar
nmap <F8> :TagbarToggle<CR>
let g:tagbar_autofocus=1

" Ack
"let g:ack_default_options = " -i --color --column --nofollow"

" YCM
"let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_allow_changing_updatetime = 0
let g:ycm_complete_in_comments = 1
au BufWritePost *.c,*.cpp,*.h YcmForceCompileAndDiagnostics
nnoremap <F6> :YcmForceCompileAndDiagnostics<CR>

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

fu! CustomFoldText()
	let fs = v:foldstart
	while getline(fs) =~ '^\s*$' | let fs = nextnonblank(fs + 1)
	endwhile
	if fs > v:foldend
		let line = getline(v:foldstart)
	else
		let line = substitute(getline(fs), '\t', repeat(' ', &tabstop), 'g')
	endif

	let w = winwidth(0) - &foldcolumn - (&number ? 8 : 0)
	let foldSize = 1 + v:foldend - v:foldstart
	let foldSizeStr = "+ | " . foldSize . " lines | "
	let foldLevelStr = repeat("+--", v:foldlevel)
	let lineCount = line("$")
	let expansionString = repeat("-", w - strwidth(foldSizeStr.line.foldLevelStr))
	return line . expansionString . foldSizeStr . foldLevelStr
endf
