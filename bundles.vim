call plug#begin('~/.config/nvim/plugged')

"language server
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'

" alignment
Plug 'junegunn/vim-easy-align'
" snippets
" Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
" color themes
Plug 'jwhitley/vim-colors-solarized'
" nerdtree
Plug 'scrooloose/nerdtree'

"supertab
" Plug 'ervandew/supertab'

Plug 'w0rp/ale'

Plug 'mxw/vim-jsx'

Plug 'tpope/vim-surround'

Plug 'tpope/vim-repeat'

Plug 'ntpeters/vim-better-whitespace'

Plug 'tpope/vim-abolish'

Plug 'mhinz/vim-grepper'

Plug 'vim-airline/vim-airline'

Plug 'vim-airline/vim-airline-themes'

Plug 'nathanaelkane/vim-indent-guides'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'majutsushi/tagbar'

Plug '~/wavedrom'

Plug 'simnalamburt/vim-mundo'

Plug 'machakann/vim-highlightedyank'

Plug 'markonm/traces.vim'

Plug 'vhda/verilog_systemverilog.vim'

Plug 'tpope/vim-fugitive'

Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }

Plug 'ambv/black'

Plug 'airblade/vim-gitgutter'

call plug#end()