"" plugins

call plug#begin()
Plug 'ziglang/zig.vim'
Plug 'scrooloose/nerdtree'
Plug 'elixir-editors/vim-elixir'
call plug#end()

let mapleader = "ç"
nnoremap <leader>h :set hlsearch!<CR>
imap <C-e> <Esc>

"" nerdtree
nnoremap <C-n> :NERDTreeToggle<CR>

"" switch between windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

""nnoremap <C-[> :w<CR>
""nnoremap <C-]> :q<CR>

"" change lines on
""nnoremap <Up> ddkP
""nnoremap <Down> ddp

nnoremap <Down> :m +1<CR>
nnoremap <Up> :m -2<CR>

"" Hibrid line number
:set nu
:set rnu

syntax on
"" colorscheme carbonized-dark
""colorscheme koehler
colorscheme desert
:set title titlestring=%t%(\ %M%)%(\ (%{expand(\"%:~:.:h\")})%)%(\ %a%)

"" highlightning column
:set textwidth=80
:set cc=+1 " highlight after textwidth
:hi ColorColumn ctermbg=238

:highlight ExtraWhitespace ctermbg=red guibg=red
:match ExtraWhitespace /\s\+$/

autocmd FileType python   	setlocal shiftwidth=4 softtabstop=4 expandtab
autocmd FileType c        	setlocal shiftwidth=4 softtabstop=4 "expandtab
autocmd FileType cpp        	setlocal shiftwidth=4 softtabstop=4 "expandtab
autocmd FileType makefile 	setlocal shiftwidth=4 softtabstop=4 "expandtab
autocmd FileType Makefile 	setlocal shiftwidth=4 softtabstop=4 "expandtab
autocmd FileType rust 	 	setlocal shiftwidth=4 softtabstop=4 expandtab
autocmd FileType html 	  	setlocal shiftwidth=2 softtabstop=2 expandtab
autocmd FileType xml 	  	setlocal shiftwidth=2 softtabstop=2 expandtab
autocmd FileType javascript	setlocal shiftwidth=4 softtabstop=4 expandtab
autocmd FileType asm		setlocal shiftwidth=4 softtabstop=4 "expandtab
autocmd FileType java		setlocal shiftwidth=4 softtabstop=4 expandtab
autocmd FileType exs		setlocal shiftwidth=4 softtabstop=4 expandtab

"" %t%(\ %M%)%(\ (%{expand(\"%:~:.:h\")})%)%(\ %a%)

"" :set smartindent
"" python import sys; sys.path.append("/home/hiram/.local/lib/python3.8/site-packages")

"" :nohlsearch

"" Macros
let @d = "i#ifdef DEBUG\nprintf(\"%s\\n\", stuff);\n#endif\n"

