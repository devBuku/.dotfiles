" ====================================================================
" 1. ESSENTIAL QUALITY OF LIFE SETTINGS
" ====================================================================
syntax on                   " Enable syntax highlighting
set number                  " Show line numbers
set relativenumber          " Relative numbers speed up code navigation
set mouse=a                 " Allow clicking and scrolling with mouse
set clipboard=unnamedplus   " Sync Vim clipboard with system clipboard
set encoding=utf-8          " Set default file encoding

" Indentation rules for clean formatting
set autoindent              " Copy indent from current line on new line
set smartindent             " Insert indents automatically where appropriate
set tabstop=4               " Number of visual spaces per TAB
set softtabstop=4           " Number of spaces a TAB counts for while editing
set shiftwidth=4            " Number of spaces to use for autoindent
set expandtab               " Convert TABs to spaces

" Search settings
set hlsearch                " Highlight all match search patterns
set incsearch               " Highlight search matches as you type

" ====================================================================
" 2. AUTOMATIC PAIR COMPLETION (Brackets & Quotes)
" ====================================================================
"inoremap ( ()<Left>
"inoremap [ []<Left>
"inoremap { {}<Left>
"inoremap " ""<Left>
"inoremap ' ''<Left>
"For opening a block on a new line with proper indentation
inoremap {<CR> {<CR>}<Esc>O

" ====================================================================
" 3. COMPILATION AND EXECUTION SHORTCUTS (F5 to Run)
" ====================================================================
" Compile and run C++ files with C++17 optimization flags
autocmd FileType cpp nnoremap <F5> :w <bar> !g++ -std=c++17 -O2 -Wall % -o %:r && ./%:r <CR>

" Run Python files directly
autocmd FileType python nnoremap <F5> :w <bar> !python3 % <CR>

" ====================================================================
" 4. AUTOMATIC BOILERPLATE TEMPLATE INJECTION
" ====================================================================
" Automatically loads your template whenever you create a new .cpp file
autocmd BufNewFile *.cpp 0r ~/.config/vim/template.cpp

