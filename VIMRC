""""""""""""""""""""""""""""""""""
""" GENERAL
""""""""""""""""""""""""""""""""""
" Force vim features rather than vi. Must be set first.
set nocompatible

" Turn on syntax highlighting
syntax enable
filetype plugin indent on

" Set UTF-8 as standard encoding
set encoding=utf8

" Turn file backups off
set nobackup
set nowritebackup
set noswapfile

compiler cargo

" Start scrolling screen when X lines away from top/bottom of screen
set scrolloff=7

" Start scrolling screen when X columns away from left/right of screen
set sidescroll=7

" Turn off displaying text wrapping
set nowrap

" Don't redraw while executing macros (increases performance)
set lazyredraw

" Vertical splits put new window on right and horizontal splits put new window on the
" bottom
set splitbelow
set splitright

" Disable sound and visual bells on errors
set noerrorbells
set novisualbell
set t_vb=

" Time in ms to wait for a key code sequence to complete
set timeoutlen=500

" Keep X lines of command history
set history=500

" Show last command entered
set showcmd

" Indicate a fast terminal connection to redraw screen faster
set ttyfast

" Show line numbers
set number

" Enable highlighted cursor line
set cursorline
set cursorcolumn

" Show spaces instead of tabs
set expandtab

" Enable function folding by syntax with everything unfolded by default
set foldmethod=syntax
set foldlevel=99

" Do not show these file types in the tab completion list
set wildignore=*.o,*.~,*.git,*.xsdf,*.la,*.lo,*.gdb

" Set tab completion mode to show full list and autocomplete first match
set wildmode=list:full

" Keep buffers open when closing windows. Allows jumping to files without
" saving
set hidden

" Use existing buffers when opening a file that is already open
set switchbuf=useopen

" Always show bottom status line
set laststatus=2

" Always show tab line at top
set showtabline=2

" Make quick fix window always span across the bottom
autocmd FileType qf wincmd J

" Set tabs and trailing white space to show as special characters when 'list'
" is enabled
set listchars=tab:>.,trail:#

" Prevent (when possible) the cursor moving to start of line when paging
set nostartofline

" Statusline parameters
set statusline=%-40f\                           " Path
set statusline+=[%{strlen(&fenc)?&fenc:'none'}, " File encoding
set statusline+=%{&ff}]                         " File format
set statusline+=%h                              " Help file flag
set statusline+=%m                              " Modified flag
set statusline+=%r                              " Read only flag
set statusline+=%y                              " Filetype
set statusline+=%=                              " Left/right separator
set statusline+=Col:%c                          " Cursor column
set statusline+=\ Line:%l/%L                    " Cursor line/total lines
set statusline+=\ %P                            " Percent through file

inoremap kj <Esc>

" Define vim :make function to call
" let &makeprg="make -j8" " SA
" let &makeprg="make -j4"                  " SG

""""""""""""""""""""""""""""""""""
""" EDITING
""""""""""""""""""""""""""""""""""
" Unix as the standard file type and allow DOS type. Setting both prevents all line
" endings getting changed when editing a file
set fileformats=unix,dos

" Set number of spaces to use for each auto indent and number of spaces a Tab
" counts as. These should match.
set shiftwidth=3
set tabstop=3

" Insert spaces instead of tabs
set smarttab

" Number of spaces to insert for a tab when editing
set softtabstop=3

" Allow backspacing over everything in insert mode
set backspace=indent,eol,start

" When pasting or deleting text, do NOT overwrite the default register
" This prevents losing copied text when deleting/pasting. Use x in visual mode to cut
vnoremap p "_dp
vnoremap P "_dP
vnoremap d "_d
nnoremap x "_x
nnoremap d "_d

" Enable language specific indenting. If not available use autoindent and
" smartindent
filetype plugin indent on

augroup vimGeneral
   au!
   " Turn on spell checking for commit messages
   autocmd FileType gitcommit setlocal spell

   " Wrap text files
   autocmd FileType text setlocal textwidth=80

   " When editing a file, always jump to the last known cursor position.
   " Don't do it when the position is invalid or when inside an event handler
   " (happens when dropping a file on gvim).
   autocmd BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \   exe "normal g`\"" |
            \ endif
augroup END

""""""""""""""""""""""""""""""""""
""" SEARCHING
""""""""""""""""""""""""""""""""""
" Ignore case when searching...
set ignorecase

" ...until upper case is used
set smartcase

" Allow regular expressions usage
set magic

" Show matching brackets when cursor is over one
set showmatch

" Highlight search pattern matches
set hlsearch

" Search pattern while typing
set incsearch

" When doing search/replace, replace all matches by default
set gdefault

" Enable :find to recursively search for files from current directory
set path=.,,**

" Filename list for tag files
set tags=tags


""""""""""""""""""""""""""""""""""
""" COLORS 
""""""""""""""""""""""""""""""""""
set background=dark
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_vert_split = 'bg1'
colorscheme gruvbox 

""""""""""""""""""""""""""""""""""
""" KEY MAPPINGS
""""""""""""""""""""""""""""""""""
" Map leader key
let mapleader = ","

" Use ; for commands
nnoremap ; :

" Shortcut for vertical and horizontal split
nnoremap <leader>v :vsplit .<CR>
nnoremap <leader>s :split .<CR>

" Shortcut for save file
nnoremap <leader>w :w<CR>

" Shortcut for close file
nnoremap <leader>q :q<CR>

" Shortcut to call make (specified in makeprg). ! prevents opening window
" to first error
nnoremap <leader>m :make!<CR>

" Quick open quick fix
nnoremap <leader>c :copen<CR><C-k>

" Opens a new window with the current window's path
nnoremap <leader>e :vsplit<CR>:Explore<CR>

" Shortcut to toggle spell checking
nnoremap <leader>d :setlocal spell!<CR>

" Shortcut to toggle showing tabs/spaces as special characters
nnoremap <leader>x :setlocal list!<CR>

" Use Leader-g to issue git grep command on text under cursor in C/C++/FORTRAN files
nnoremap <Leader>g :Gitgrep '\<<C-R><C-W>\>'<CR>

" Use Leader-r to issue git grep command on text under cursor in all version
" controlled files
nnoremap <Leader>r :Gitallgrep '\<<C-R><C-W>\>'<CR>

" Use Leader-f to page forward in search results stack and Leader-b to page
" backwards
nnoremap <Leader>f :cnewer<CR>
nnoremap <Leader>b :colder<CR>

" Un-highlight highlighted text
nnoremap <silent> <Leader>n :nohls<CR>

" Jump to matching pairs more easily with tab
nnoremap <Tab> %
vnoremap <Tab> %

" Move a line of text using <leader>-[jk]
nmap <leader>j mz:m+<CR>`z
nmap <leader>k mz:m-2<CR>`z
vmap <leader>j :m'>+<CR>`<my`>mzgv`yo`z
vmap <leader>k :m'<-2<CR>`>my`<mzgv`yo`z

" Tab command mappings
nnoremap ti :tabnew .<CR>
nnoremap te :tabclose<CR>
nnoremap tm :tabmove<CR>
nnoremap tp :tabprevious<CR>
nnoremap tn :tabnext<CR>

" Map space to / search and CTRL-space to ? backwards search
nnoremap <space> /
nnoremap <c-space> ?

" Switch between split windows with CTRL-[jkhl]
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l

" Remove the Windows ^M from file
nnoremap <F6> mmHmt:%s/<C-V><CR>//ge<CR>'tzt'm

" Shortcut to rebuild ctags file
nnoremap <F9> :silent !printf '\nGenerating tags...\n'<CR>:silent !ctags -R --languages=C,C++,Fortran,Python --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q *<CR>:redraw!<CR>

" Delete trailing whitespaces in open window
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" Search and replace text under cursor
nnoremap gs :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>:%s//

" Swap ' and ` for jumping to marks
nnoremap ' `
nnoremap ` '

""""""""""""""""""""""""""""""""""
""" FUNCTIONS (MAPPED ABOVE)
""""""""""""""""""""""""""""""""""
" Git grep function to search for term in all C/C++/FORTRAN related version controlled files
function! F_GitGrep(arg1, ...)
   :cgete system("git grep -n -I " . a:arg1 . " " . join(a:000) . " -- '*.c' '*.C' '*.cpp' '*.CPP' '*.h' '*.H' '*.hpp' '*.HPP' '*.for' '*.FOR' '*.dsf' '*.DSF'")
   :copen
endfunction
command! -nargs=+ Gitgrep :call F_GitGrep(<f-args>)

" Git all grep function to search for term in all version controlled files
function! F_AllGitGrep(arg1, ...)
   :cgete system("git grep -n -i -I " . a:arg1 . " " . join(a:000))
   :copen
endfunction
command! -nargs=+ Gitallgrep :call F_AllGitGrep(<f-args>)

" Highlight given column in CSV file
function! CSVH(colnr)
   if a:colnr > 1
      let n = a:colnr - 1
      execute 'match Keyword /^\([^,]*,\)\{'.n.'}\zs[^,]*/'
      execute 'normal! 0'.n.'f,'
   elseif a:colnr == 1
      match Keyword /^[^,]*/
      normal! 0
   else
      match
   endif
endfunction
command! -nargs=1 Csv :call CSVH(<args>)

" :W will save files as sudo without reopening
command! W w !sudo tee % > /dev/null

