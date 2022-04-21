"   _____  _      _     _       _   _           __ _               
"  |  __ \(_)    | |   (_)     | | | |         / _| |              
"  | |__) |_  ___| |__  _ _ __ | |_| |__   ___| |_| | _____      __
"  |  _  /| |/ __| '_ \| | '_ \| __| '_ \ / _ \  _| |/ _ \ \ /\ / /
"  | | \ \| | (__| | | | | | | | |_| | | |  __/ | | | (_) \ V  V / 
"  |_|  \_\_|\___|_| |_|_|_| |_|\__|_| |_|\___|_| |_|\___/ \_/\_/  
"        (_)                                                       
"  __   ___ _ __ ___  _ __ ___                                     
"  \ \ / / | '_ ` _ \| '__/ __|                                    
"   \ V /| | | | | | | | | (__                                     
"  (_)_/ |_|_| |_| |_|_|  \___|                                    


""""""""""""""""""""""""""""""""""""""""""""""""
"                basics vim conf               "
""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
set termguicolors
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
hi statusline guifg=darkcyan guibg=white
" Move between rows in wrapped lines
noremap j gj
noremap k gk


"""""""""""""""""""""""""""""""""""""""""""""""
"                personal conf                "
"                & keybindings                "
"""""""""""""""""""""""""""""""""""""""""""""""                      
" Highlight cursor line underneath the cursor vertically and horizontally.
map <F8> :set cursorcolumn!<Bar>set cursorline!<CR>
hi CursorLine    guibg=darkred guifg=white cterm=NONE
hi CursorColumn  guibg=darkred guifg=white cterm=NONE
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

" Activate LATEX
let g:tex_flavor = "latex"


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

" Autolauch creation PDF by pressing ctrl+T
autocmd FileType tex nmap <buffer> <C-t> :!latexmk -pdf %<CR>


""""""""""""""""""""""""""""""""""""""""
"              VIM-PLUGS               "
""""""""""""""""""""""""""""""""""""""""                 
call plug#begin()
" LATEX for VIM
Plug 'lervag/vimtex'
" Plug 'vim-latex/vim-latex'
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
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" BASE vim-lsp-settings
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
" Autocompletion lSP
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
" Tabular plugin - makes tables :Tabular /|
Plug 'godlygeek/tabular'
call plug#end()


""""""""""""""""""""""""""""""""""""""""
"                HELP                  "
"""""""""""""""""""""""""""""""""""""""" 

""""""""""""""VIM LSP""""""""""""""""
"  While editing a file with a supported filetype:
" :LspInstallServer
" To uninstall server:
" :LspUninstallServer server-name
