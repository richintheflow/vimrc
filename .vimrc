"  _____    _          _       _           _     _               __   _                    
" |  __ \  (_)        | |     (_)         | |   | |             / _| | |                   
" | |__) |  _    ___  | |__    _   _ __   | |_  | |__     ___  | |_  | |   ___   __      __
" |  _  /  | |  / __| | '_ \  | | | '_ \  | __| | '_ \   / _ \ |  _| | |  / _ \  \ \ /\ / /
" | | \ \  | | | (__  | | | | | | | | | | | |_  | | | | |  __/ | |   | | | (_) |  \ V  V / 
" |_|  \_\ |_|(_)___| |_| |_| |_| |_| |_|  \__| |_| |_|  \___| |_|   |_|  \___/    \_/\_/  
"     __   __  _   _ __ ___    _ __    ___                                                 
"     \ \ / / | | | '_ ` _ \  | '__|  / __|                                                
"  _   \ V /  | | | | | | | | | |    | (__                                                 
" (_)   \_/   |_| |_| |_| |_| |_|     \___|                                                


""""""""""""""""""""""""""""""""""""""""""""""""
"                basics vim conf               "
""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
set t_Co=256
syntax on
set mouse=a
set background=dark
set number
set tabstop=2
set shiftwidth=2
set smartindent
set autoindent
set expandtab
set linebreak
set history=1000
" Enable auto completion menu after pressing TAB.
set wildmenu
" Make wildmenu behave like similar to Bash completion.
set wildmode=list:longest
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx
filetype on
filetype plugin on
" set omnifunc=syntaxcomplete#Complete
colorscheme torte

" STATUSLINE CONF
set laststatus=2
set statusline=%F%m%r%h%w%=\ [%Y]\ [%{&ff}]\ [%04l,%04v]\ [%p%%]\ [%L]


"""""""""""""""""""""""""""""""""""""""""""""""
"                personal conf                "
"                & keybindings                "
"""""""""""""""""""""""""""""""""""""""""""""""                      
" Highlight cursor line underneath the cursor vertically.
map <F8> :set cursorcolumn!<Bar>set cursorline!<CR>
hi CursorLine   cterm=NONE ctermbg=darkgray ctermfg=NONE "guibg=lightgrey guifg=white
hi CursorColumn cterm=NONE ctermbg=darkgray ctermfg=NONE "guibg=lightgrey guifg=white
" Open and close NERDTree (toggle NERDTree view) using single keystroke
nmap <F6> :NERDTreeToggle<CR>
" Automated file templates (skeletons))
autocmd BufNewFile *.html 0r ~/.vim_skeleton/html.html
nnoremap ,html :-1read ~/.vim_skeleton/html.html<CR>

autocmd BufNewFile *.md 0r ~/.vim_skeleton/md.md
nnoremap ,md :-1read ~/.vim_skeleton/md.md<CR>

" indentLine conf
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_color_term = 239

" Remap the emmet-vim plugin with C-z 
" better than C-y
let g:user_emmet_leader_key='<C-z>'

" markdown's polyglot compatibility disabled
" let g:polyglot_disabled = ['markdown']
let g:user_emmet_mode='a'    "enable all function in all mode.

" Folding markdown
let g:markdown_folding = 1
" activate auto folding syntax
map <F5> :setlocal foldmethod=syntax<CR>


""""""""""""""""""""""""""""""""""""""""""""""
"           WORDPROCESSOR FUNCTIONS          "
""""""""""""""""""""""""""""""""""""""""""""""
" WPEN = Wordprocessor with english dictionnary
func! WordProcessorEN()
  setlocal spell spelllang=en_us
  set thesaurus+=/home/richi/.vim/spell/mthesaur.txt
  " complete+=s makes autocompletion search the thesaurus
  set complete+=s
endfu
com! WPEN call WordProcessorEN()

" WPFR = Wordprocessor with french dictionnary
func! WordProcessorFR()
  setlocal spell spelllang=fr
  set thesaurus+=/home/richi/.vim/spell/mthesaur.txt
  " complete+=s makes autocompletion search the thesaurus
  set complete+=s
endfu
com! WPFR call WordProcessorFR()

" WPES = Wordprocessor with spanish dictionnary
func! WordProcessorES()
  setlocal spell spelllang=es
  set thesaurus+=/home/richi/.vim/spell/mthesaur.txt
  " complete+=s makes autocompletion search the thesaurus
  set complete+=s
endfu
com! WPES call WordProcessorES()


""""""""""""""""""""""""""""""""""""""""
"              VIM-PLUGS               "
""""""""""""""""""""""""""""""""""""""""                 
call plug#begin()
" tree explorer
Plug 'preservim/NERDTree'
" display the spaces indentation
Plug 'Yggdroot/indentLine'
" autocomplete html
Plug 'mattn/emmet-vim'
" autoparis brackets
Plug 'jiangmiao/auto-pairs'
" easy comments by pressing 'gc'
Plug 'tpope/vim-commentary'
" live-server
Plug 'turbio/bracey.vim', {'do': 'npm install --prefix server'}
" beautiful code highlights
Plug 'sheerun/vim-polyglot'
" vim autocompletion and analysis
Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()
