" NERD TREE
"autocmd StdinReadPre * let s:std_in="1
"autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
"
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif


""deoplete
"let g:deoplete#enable_at_startup=1
"let g:deoplete#enable_smart_case=1
"call deoplete#custom#source('ultisnips', 'matchers', ['matcher_fuzzy'])
"
"autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
"
"ale
let g:ale_linters = {'javascript': ['eslint']}
let g:ale_fixers = {'javascript': ['eslint']}


" indent-guides
let g:indent_guides_start_level = 2
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_color_change_percent = 5


" powerline
let g:airline_powerline_fonts = 1
let g:airline_theme='solarized'
let g:airline#extensions#tabline#enabled = 1


" language server

" Required for operations modifying multiple buffers like rename.
set hidden

"if executable('pyls')
"    " pip install python-language-server
"    au User lsp_setup call lsp#register_server({
"        \ 'name': 'pyls',
"        \ 'cmd': {server_info->['pyls']},
"        \ 'whitelist': ['python'],
"        \ })
"endif
"
"if executable('javascript-typescript-stdio')
"    au User lsp_setup call lsp#register_server({
"        \ 'name': 'javascript-typescript-stdio',
"        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'javascript-typescript-stdio', '--stdio']},
"        \ 'whitelist': ['javascript', 'javascript.jsx'],
"        \ })
"endif

let g:ale_linter_aliases = {'verilog_systemverilog': 'verilog'}

"let g:LanguageClient_serverCommands = {
"    \ 'python': ['/tmp2/jval/neovim_venv/bin/pyls'],
"    \ 'javascript': ['/tmp2/jval/node_modules/bin/javascript-typescript-stdio'],
"    \ 'javascript.jsx': ['/tmp2/jval/node_modules/bin/javascript-typescript-stdio'],
"    \ }
"
"" Automatically start language servers.
"let g:LanguageClient_autoStart = 1
"
"nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
"nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
"nnoremap <silent> rn :call LanguageClient_textDocument_rename()<CR>
"
"let g:LanguageClient_diagnosticsEnable = 0
"
"
"
"
let g:gitgutter_highlight_lines = 0
let g:gitgutter_realtime = 1
set updatetime=250