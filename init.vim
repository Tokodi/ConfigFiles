"=============================================================================="
"                                  Content                                     "
"=============================================================================="
"       01. Vundle.............................................vim_config_vundle
"       02. Plugin Settings...........................vim_config_plugin_settings
"       03. General...........................................vim_config_general
"       04. Colors.............................................vim_config_colors
"       05. Files/Buffers...............................vim_config_files_buffers
"       06. Tabbing...........................................vim_config_tabbing
"       07. Auto Commands...............................vim_config_auto_commands
"       08. Key Mappings.................................vim_config_key_mappings
"       09. Functions.......................................vim_config_functions
"       10. Notes...............................................vim_config_notes

"=============================================================================="
"                                   Vundle                                     "
"=============================================================================="
"                                                              vim_config_vundle

" Auto install Vundle
if empty(glob('~/.vim/bundle/Vundle.vim'))
    silent !git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    autocmd VimEnter * PluginInstall
endif

" Set runtimepath to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

" Fancy file-tree
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'

" Tagbar
Plugin 'majutsushi/tagbar'

" Fugitive Git plugin
Plugin 'tpope/vim-fugitive'

" Auto completition
Plugin 'ervandew/supertab'

" Wicked fast fuzzy finder
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'

" Smooth scroll
Plugin 'yuttie/comfortable-motion.vim'

" Fancy status line
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Status line for tmux
Plugin 'edkolev/tmuxline.vim'

" Color schemes
Plugin 'w0ng/vim-hybrid'
Plugin 'morhetz/gruvbox'

" Better vimdiff
Plugin 'rickhowe/diffchar.vim'

" C++ highlights
Plugin 'octol/vim-cpp-enhanced-highlight'

" Fun stuff
" Plugin 'johngrib/vim-game-code-break'
" Plugin 'johngrib/vim-game-snake'
" Plugin 'Tokodi/vim-game-bomber'

call vundle#end()

"=============================================================================="
"                                Plugin Settings                               "
"=============================================================================="
"                                                     vim_config_plugin_settings

" The NERD Tree
"---------------
let NERDTreeMapOpenInTab = 't'              " Open file in tab with t key
let g:NERDTreeDirArrowExpandable = '+'      " Sign to show expandable nodes
let g:NERDTreeDirArrowCollapsible = '~'     " Sign to show Collapsible nodes
let NERDTreeNodeDelimiter = "\t"
let NERDTreeMinimalUI = 1                   " Disable 'Press ? for help'

" Tagbar
" ------
let g:tagbar_autoclose = 1              " Close tagbar when tag is selected
let g:tagbar_sort = 0                   " Sort tags by order in file
let g:tagbar_show_linenumbers = 1       " Show relative position of tag
let g:tagbar_iconchars = ['+', '~']     " Icons used to indicate folds
let g:tagbar_autoshowtag = 1            " Unfold to current tag if its inside
                                        " of a closed fold

" Supertab
" --------
let g:SuperTabMappingTabLiteral = '<leader-tab>'    " Space-Tab inserts tab
                                                    " instead of completition

let g:SuperTabCrMapping = 1                         " Finish completition with
                                                    " enter key

" FZF
" ---
let g:fzf_nvim_statusline = 0                       " Disable statusline overwriting

" Comfortable motion
" ------------------
let g:comfortable_motion_no_default_key_mappings = 1    " Disable default maps

" VimAirline
" ----------
let g:airline#extensions#tabline#enable = 1     " TODO: Tabline not working properly, ugly
let g:airline_powerline_fonts = 0

" TmuxLine
" ---------
let g:tmuxline_powerline_separators = 0
let g:tmuxline_preset = {
        \'a'    : '#h',
        \'win'  : '#I',
        \'cwin' : ['#I', '#W'],
        \'z'    : '%R'
        \}

" C++ Highligth
" -------------
let g:cpp_class_scope_highlight = 1         " Class scope highlight
let g:cpp_member_variable_highlight = 1     " Member variables highlight
let g:cpp_concepts_highlight = 1

"=============================================================================="
"                                   General                                    "
"=============================================================================="
"                                                             vim_config_general

filetype on                          " Auto recognize filetype
filetype plugin indent on

let mapleader = ' '         " Set <LEADER> command prefix
let g:mapleader = ' '

set history=9000            " Must be set after nocompatible
set title                   " Terminal window title follows vim title

set autoread                " Update file if its changed from the outside
set modelines=0             " Modelines allow you to set variables specific to
                            " a file.

" set showmode                " Prints --INSERT , --VISUAL.
set showcmd                 " ???

set wildmenu                " Enable autocompletion with <TAB> for commands
set wildignore=*.o,*~,*.pyc " Ignore compiled files

set so=7                    " 7 lines always visible above and below the cursor

set ruler                   " Show current position
set nuw=1

set cmdheight=2             " Command bar height set to 2

set backspace=eol,start,indent      " Configure backspace, so it works as it
                                    " should.

set list                    " Show characters instead of whitespaces
set listchars=tab:\|\ ,space:.,extends:#,nbsp:.

set ignorecase              " Case insensitive searching
set smartcase               " When searching try to be smart about cases

set hlsearch                " Highlight search results
set incsearch               " Increment search

set guitablabel=%t          " Tabs show filename only

set showmatch               " Show matching brackets whn text indicator is
                            " over them.
set mat=2                   " How many tenths of a second to blink when
                            " matching brackets

set diffopt+=vertical       " Fugitive Gdiff uses vertical split

au FileType qf wincmd J     " QuickFix window full width when vertical splits

if executable('ag')                     " If 'ag' is available in PATH
    set grepprg=ag\ --vimgrep\ -r\ $*   " grep is done with it
    set grepformat=%f:%l:%c:%m          " Result format
endif

"=============================================================================="
"                                    Colors                                    "
"=============================================================================="
"                                                              vim_config_colors

syntax enable

set t_Co=256                " Enable 256 color terminal

" colorscheme hybrid         " Set colorscheme, needs to be installed
colorscheme gruvbox         " Set colorscheme, needs to be installed
set background=dark

set colorcolumn=120          " Color the 120th character in every line

"=============================================================================="
"                                Files/Buffers                                 "
"=============================================================================="
"                                                       vim_config_files_buffers

set encoding=utf8           " Set UTF-8 as standard encoding

set nobackup
set nowb
set noswapfile

set hidden      " Hides buffer instead of closing them. (Don't have to save
                " before opening new file)

"=============================================================================="
"                                   Tabbing                                    "
"=============================================================================="
"                                                             vim_config_tabbing

set expandtab               " Use spaces instead of tab
set smarttab                " Tabbing watches for indentation
set shiftwidth=2            " 1 tab == 2 spaces
set tabstop=2               " Spacecount for tab

set tw=500                  " Linebreak on 500 characters

set noautoindent
set smartindent

set nowrap                  " Display a line in one line, even if its too long

"=============================================================================="
"                                 AutoCommands                                 "
"=============================================================================="
"                                                       vim_config_auto_commands

autocmd BufEnter * setlocal number
autocmd BufEnter * setlocal relativenumber

autocmd BufWrite *.* :call DeleteTrailingWS()

" Close Vim if the only window left open is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Highlight all occurance of word under cursor
autocmd CursorMoved * exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))

" FZF file preview window
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, {'options': ['--layout=reverse', '--info=inline', '--preview', 'cat {}']}, <bang>0)

"=============================================================================="
"                                 KeyMappings                                  "
"=============================================================================="
"                                                        vim_config_key_mappings

" Disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>

" Save and exit to normal mode
inoremap <leader>q <Esc>:w<cr>

" Close pane in normal mode
noremap <leader>q <Esc>:q<cr>

" Add closing braces
inoremap { {}<Esc>i
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap " ""<Esc>i
inoremap ' ''<Esc>i

" Jump to closing braces
noremap <leader>e   %

" Yank, Select, Delete till EOL
nnoremap Y y$
nnoremap V v$
nnoremap D d$

" TODO: Not working with ssh?
" Move lines with ALT+[j,k]
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo``>my`<mzgv`yo`z

nnoremap N *

" Pane usage remaps
" -----------------
" Create panes
map <leader>\|  :vsplit<cr>
map <leader>-   :split<cr>

" Move between panes
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-h> <C-w>h
map <C-l> <C-w>l

" Zoom on pane
nnoremap <C-w>z <c-w>_ \| <c-w>\|

" Resize pane
nnoremap <M-w> <C-W>5+
nnoremap <M-s> <C-w>5-
nnoremap <M-a> <C-W>5<
nnoremap <M-d> <C-W>5>

" Tab usage remaps
" ----------------
map <leader>c   :tabnew<cr>
map <leader>xy  :tabclose<cr>
map <leader>n   :tabnext<cr>
map <leader>p   :tabprevious<cr>
map <leader>t   :tabs<cr>
map <leader>T   <c-w>gF<cr>

" Plugin usage remaps
" -------------------
nnoremap <silent> <leader>f      :NERDTreeToggle<cr>
nnoremap <silent> <leader>r      :NERDTreeFind<cr>
nnoremap <silent> <leader>h      :TagbarToggle<cr>

" Smooth scroll
nnoremap <silent> <leader>k     :call comfortable_motion#flick(-100)<CR>
nnoremap <silent> <leader>j     :call comfortable_motion#flick(100)<CR>

" Fugitive
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <silent> <leader>gb :Gblame<CR>
nnoremap <silent> <leader>ge :Gedit<CR>
nnoremap <silent> <leader>gE :Gedit<space>
nnoremap <silent> <leader>gr :Gread<CR>
nnoremap <silent> <leader>gR :Gread<space>
nnoremap <silent> <leader>gw :Gwrite<CR>
nnoremap <silent> <leader>gW :Gwrite!<CR>
nnoremap <silent> <leader>gq :Gwq<CR>
nnoremap <silent> <leader>gQ :Gwq!<CR>

" FzF
nnoremap <silent> <leader>F :Files<CR>
nnoremap <silent> <leader>G :Tags<CR>
nnoremap <silent> <leader>S :call SearchWordWithAg()<CR>

" My function remaps
" ------------------
" Switch between headers and source files (C/C++)
" autocmd FileType c,cpp nnoremap <F1> :call SwitchSourceHeader()<CR>

"=============================================================================="
"                                  Functions                                   "
"=============================================================================="
"                                                           vim_config_functions

"Delete trailing white space
function! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
endfunction

function! SearchWordWithAg()
    execute 'Ag' expand('<cword>')
endfunction

" TODO: Set keyMapping for this and use it
" Search pattern in files in directory of current file
function! GrepInDirectory(pattern, target)
    execute("cexpr []")
    execute("silent grep! ".a:pattern." ".a:target)
    execute("copen")
endfunction
command! -nargs=+ Dg call GrepInDirectory('<args>', '$PWD')
command! -nargs=0 Dgc call GrepInDirectory('<cword>', '$PWD')

" TODO: Set keyMapping for this and use it
" Toggle quickfix window
function! ToggleQuickFixWindow()
    for bnum in range(1, winnr('$'))
        if getwinvar(bnum, '&filetype') == 'qf'
            cclose
            return
        endif
    endfor
    copen
endfunction
command! -nargs=0 Tqfw call ToggleQuickFixWindow()

" TODO: Some of these don't work, some I don't use anymore
" " Returns true if paste mode is enabled
" function! HasPaste()
"     if &paste
"         return 'PASTE MODE  '
"     en
"     return ''
" endfunction
"
" " Localize files by name with different methods (buffers, files)
" function! CheckFile(filename)
"     let l:buf_name = bufname(a:filename)
"     if strlen(l:buf_name) > 0
"         execute("e ".l:buf_name)
"         return 1
"     else
"         let l:result = findfile(a:filename, $PWD."/**", 1)
"         if strlen(l:result) > 0
"             execute("e ".l:result)
"             return 1
"         endif
"     endif
"
"     return 0
" endfunction
"
" " Search current file with different extensions from current working directory and open it
" function! SearchFile(extensions)
"     let l:filename = expand("%:t:r")
"     for ext in a:extensions
"         if CheckFile(l:filename.".".ext) == 1
"             break
"         endif
"     endfor
" endfunction

"=============================================================================="
"                                    Notes                                     "
"=============================================================================="
"                                                               vim_config_notes

" Useful links
" ------------
" http://vimcasts.org/blog/2013/02/habit-breaking-habit-making/
" http://vimgenius.com/
" http://vim-advantures.com/
" https://github.com/zenbro/dotfiles/blob/master/.nvimrc#L151-L187
" https://github.com/junegunn/dotfiles/blob/master/vimrc
" https://www.reddit.com/r/neovim/comments/3oeko4/post_your_fzfvim_configurations/
" https://www.youtube.com/watch?v=XA2WjJbmmoM

" TODO:
" Use Fugitive
" ------------
"  1 :Gstatus
"  2 <c-n> to move between files
"  3 Stage/Unstage file via -
"  4 Start commit via cc
"  5 Create commit message, and close tile
"  6 :Gcommit
