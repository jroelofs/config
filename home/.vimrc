command Wq wqa
command W w
command Q qa

execute pathogen#infect()

"Turn off word wrap
set nowrap

"Allow mouse interaction
set mouse=a

set autochdir

"Turn off bell sounds
set noerrorbells
set novisualbell
set t_vb=
autocmd! GUIEnter * set vb t_vb=

"Set the encoding to utf-8
set encoding=utf-8

"Remember lots of history!
set history=10000

"Set the spell checking language
set spell spelllang=en

"Set the custom word list
set spellfile=~/.vim/custom.utf-8.add

"All swap files should go in ~/.vim/swap
set directory=~/.vim/swap,.

"Disable spell checking
set nospell

"Set the colorscheme
"colorscheme elflord
colorscheme desert
set background=dark

"Tabs are shown as 4 spaces
set expandtab
set tabstop=2
set shiftwidth=2

" Optional
" C/C++ programming helpers
augroup csrc
  au!
  autocmd FileType *      set nocindent smartindent
  autocmd FileType c,cpp  set cindent
augroup END

" Set a few indentation parameters. See the VIM help for cinoptions-values for
" details.  These aren't absolute rules; they're just an approximation of
" common style in LLVM source.
set cinoptions=:0,g0,(0,Ws,l1

" Add and delete spaces in increments of `shiftwidth' for tabs
set smarttab

" Highlight syntax in programming languages
syntax on


"Set starting width of line number columns
set numberwidth=2

"Set text width to unlimited (no automatic new lines!)
set textwidth=0
let leave_my_textwidth_alone=1

"Use »··· instead of ^I for tabs when set list is on
set listchars+=tab:»·,trail:⊗,nbsp:·,eol:$

"Show line numbers
set number

"Display non-printing characters
set list

"Turn syntax highlighting on
syntax on
hi Comment ctermfg=28

"No visual bell
set novisualbell

"Smart tabbing
set smarttab

"C-style tabbing where tabs are 4 spaces
"set expandtab
"set shiftwidth=4

"Status line always on
set laststatus=2

"Auto-indent
set ai

"C Indenting
set cindent

"Highlight search
set hlsearch

"Incremental search
set incsearch

"Wild mode like it should be!
set wildmode=longest,list

"Map Ctrl-{K,J} to Up/Down in command mode
cmap <C-K> <UP>
cmap <C-J> <DOWN>

"Command for the difference between the current buffer and the original
command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
        \ | wincmd p | diffthis

let cscflag = ""
set statusline=%<%F+0x%O\ %(%h%m%r%)%{cscflag}%=0x%B\ %l,%c%V\ %P

"Highlight trailing whitespace
"highlight OverLength ctermbg=red ctermfg=white guibg=red guifg=white
"match OverLength '\%82v.*'

"flag problematic whitespace (trailing and spaces before tabs)
"Note you get the same by doing let c_space_errors=1 but
"this rule really applys to everything.
"highlight RedundantSpaces term=standout ctermbg=red guibg=red
"match RedundantSpaces /\s\+$\| \+\ze\t/
let c_space_errors=1

"---------- Python Tabstops -----------------
augroup filetype
  au! BufRead,BufNewFile *.py    set tabstop=4 shiftwidth=4
augroup END


"---------- Tablegen file highlighting -----------------
augroup filetype
  au! BufRead,BufNewFile *.td    set filetype=tablegen
augroup END

"---------- LLVM file highlighting ---------------------
augroup filetype
  au! BufRead,BufNewFile *.ll    set filetype=llvm
augroup END

"---------- Makefile highlighing -----------------------
augroup filetype
  au! BufRead,BufNewFile *Makefile*  set filetype=make
augroup END
" Don't expand tabs in Makefiles
autocmd Filetype make set noexpandtab

"---------- GCC md file highlighting -------------------
au BufRead,BufNewFile *.md set filetype=lisp
au! Syntax lisp setf lisp

"---------- AlphaZ Syntax Highlighting -----------------
au BufRead,BufNewFile *.ab set filetype=alphabets
au BufRead,BufNewFile *.alphabets set filetype=alphabets
au! Syntax alphabets source ${HOME}/.vim/alphabets.vim

"---------- ISPC Syntax Highlighting -------------------
au BufRead,BufNewFile *.ispc set filetype=ispc

"---------- Racket/Scheme Syntax Highlighting ----------
au BufRead,BufNewFile *.rkt set filetype=lisp
"au! Syntax lisp source ${HOME}/.vim/lisp.vim

"---------- CMake Syntax Highlighting ----------
au BufRead,BufNewFile *.cmake,CMakeLists.txt setf cmake

"---------- Key Mappings ----------
map <silent> <C-k> :sh<cr>
"----------------------------------

"---------- Function Key Mappings ----------
" F1: Free
" F2: Free
" F3: Free
" F4: Toggle spaces/tabs
" F5: Find/Replace all bad whitespace
" F6: Move to next bad whitespace
" F7: Toggle showing non-printing characters
" F8: Toggle taglist
" F9: Replay last macro
" F10: Toggle spell checking
" F11: Toggle paste mode
" F12: Free

"Toggle expand tabs with F4
function! TabToggle()
	if &expandtab
		set noexpandtab
		set shiftwidth=3
	else
		set expandtab
		set shiftwidth=4
	endif
endfunction

map <silent> <F4> mz:call TabToggle()<CR>'z
imap <silent> <F4> <ESC>mz:call TabToggle()<CR>'zi

"Use F5 to search/remove all bad whitespace
"Use F6 to move to next bad whitespace
map <silent> <F5> :%s/\s\+$\\| \+\ze\t//gc<CR>
map <silent> <F6> /\s\+$\\| \+\ze\t/<CR>

"Toggle listchars and numbers
map <silent> <F7> :set invlist<CR>:set invnumber<CR>
imap <silent> <F7> <ESC>mz:set invlist<CR>:set invnumber<CR>'zi

"Taglist!
map <silent> <F8> :TlistToggle<CR>

"Replay last macro
map <silent> <F9> @@

"Toggle spell checking with F10
map <silent> <F10> :set invspell<CR>
imap <silent> <F10> <ESC>mz:set invspell<CR>'zi

"An alternative way to toggle spelling
"inoremap <silent> <F10> <c -O>:call SpellToggle()<cr>
"map <silent> <F10> :call SpellToggle()<cr>
"function SpellToggle()
"    if &spell == 1
"        set nospell
"    else
"        set spell
"    endif
"endfunction

"Toggle paste mode with F11
set pastetoggle=<F11>
"-------------------------------------------


map <C-K> :pyf /Users/jroelofs/workdir/svn/clang/tools/clang-format/clang-format.py<cr>
imap <C-K> <C-o>:pyf /Users/jroelofs/workdir/svn/clang/tools/clang-format/clang-format.py<cr>
