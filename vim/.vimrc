set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle.vim
call vundle#begin()
Plugin 'gmarik/vundle.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'greyblake/vim-preview'
Plugin 'vim-scripts/VimClojure'
Plugin 'saltstack/salt-vim'
Plugin 'fatih/vim-go'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-surround'
Plugin 'derekwyatt/vim-scala'
Plugin 'jimenezrick/vimerl'
Plugin 'elixir-lang/vim-elixir'
Plugin 'ledger/vim-ledger'
Plugin 'scrooloose/syntastic'
call vundle#end()
filetype plugin on
if &term=~'xterm'
set t_Co=256
endif
set autoread
set wildmenu
set wildignore=*.o,*~,*.pyc,*.pdf,*.class
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set expandtab
set number
set relativenumber
syntax enable
color zenburn
set wrap
set textwidth=75
set colorcolumn=76
set encoding=utf-8
set hidden
set backspace=indent,eol,start
set list
set listchars=tab:→·,trail:·
set cursorline
set laststatus=2
set noerrorbells
set novisualbell
set vb t_vb=
set diffopt=filler,context:3,vertical
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
au Syntax html,xml RainbowParenthesesLoadChevrons
let mapleader = ","
let g:gitgutter_enabled = 0
noremap <leader>r :RainbowParenthesesToggle<CR>
noremap <leader>s :set spell!<CR>
noremap <leader>h :%!xxd<CR>
noremap <leader>d :%!xxd -r<CR>
noremap <leader>g :GitGutterToggle<CR>
noremap <leader>c :SyntasticToggleMode<CR>
set directory=~/.vim/temp/
set backupdir=~/.vim/backup/
function! FileSize()
    let bytes = getfsize(expand("%:p"))
    if bytes <= 0
        return ""
    endif
    if bytes < 1024
        return "[" . bytes . "]"
    elseif bytes < 1024 * 1024
        return "[" . (bytes / 1024) . "k]"
    else
        return "[" . (bytes / (1024 * 1024)) . "M]"
    endif
endfunction
set statusline=
set statusline+=[%02n]
set statusline+=%t
set statusline+=%m
set statusline+=%r
set statusline+=%{FileSize()}
set statusline+=%{fugitive#statusline()}
set statusline+=%=
set statusline+=[%{&fenc}]
set statusline+=%y
set statusline+=%3.3p%%
set statusline+=%04.4l:%03c
