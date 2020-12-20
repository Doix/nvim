"""""""""""""""" VIM BINDINGS """"""""""""""""
"make Y consistent with C and D
nnoremap Y y$
" Make shift-insert work like in Xterm
map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>

" center display after searching
nnoremap n   nzz
nnoremap N   Nzz
nnoremap *   *zz
nnoremap #   #zz
nnoremap g*  g*zz

" better navigation of wrapped lines
nnoremap j gj
nnoremap k gk
nnoremap g#  g#z

" easy split navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"leader keys
let mapleader = ","
let maplocalleader = "\\"

vnoremap < <gv
vnoremap > >gv

nnoremap <Leader>r :source $MYVIMRC<CR>
nnoremap <Leader>e :vsplit $MYVIMRC<CR>

nnoremap <Leader>w :StripWhitespace<CR>

tnoremap <Esc> <C-\><C-n>

""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""" PLUGINS  """"""""""""""""""
"vim-fugitive
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>gc :Gcommit<CR>


"nerdtree
map <leader>n :NERDTreeToggle<CR>


"fzf
nnoremap <Leader>f :Files<CR>
nnoremap <Leader>a :Ag<CR>
nnoremap <Leader>b :Buffers<CR>

map <leader>F :set foldmethod=indent<CR>

" language server protocol
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>

" ALE
nnoremap <Leader>l :ALENext<CR>

" Register a command, a visual and normal mapping
command! -nargs=* FAL :call FoldAroundLines('command',<f-args>)
vnoremap <silent> F :<C-U>call FoldAroundLines('visual')<CR>
nnoremap <silent> F :set opfunc=FoldAroundLines<CR>g@

function! FoldAroundLines(type,...)
  " Ensure we are in manual fold mode
  set foldmethod=manual
  " Save first and list line of the current buffer
  let l:first_line = 1
  let l:last_line = line("$")

  " Get the lines to fold around
  if a:type == 'command'
    let l:line_before = a:000[0]
    let l:line_after = a:000[1]
  elseif a:type == 'visual'
    let l:line_before = line("'<")
    let l:line_after = line("'>")
  elseif a:type =~ 'line\|char\|block'
    let l:line_before = line("'[")
    let l:line_after = line("']")
  endif

  " Add a 1 padding to be sure to display the limit lines
  if l:line_before - 1 > l:first_line
    let l:line_before -= 1
  endif

  if l:line_after + 1 < l:last_line
    let l:line_after += 1
  endif

  " Check selected lines are in the current buffer
  if (l:line_before < l:first_line || l:line_after > l:last_line)
    echom ("A selected line is not in the buffer")
    return
  endif

  " Remove every fold in the current buffer
  normal! zE

  " Fold first->before and after->last
  execute l:first_line.",".l:line_before."fold"
  execute l:line_after.",".l:last_line."fold"
endfunction

function! s:gsub(str,pat,rep) abort
  return substitute(a:str,'\v\C'.a:pat,a:rep,'g')
endfunction

function! s:linechars(pattern) abort
  let chars = strlen(s:gsub(matchstr(getline('.'), a:pattern), '.', '.'))
  if exists('*synconcealed') && &conceallevel > 1
    for col in range(1, chars)
      let chars -= synconcealed(line('.'), col)[0]
    endfor
  endif
  return chars
endfunction


function! P4_annotate()
   let myline = line('.')
   let mycol  = col('.')
   let myfile = expand('%')
   let mylang = &ft
   vnew
   silent! setlocal previewwindow bufhidden=delete nobackup noswf nobuflisted nowrap buftype=nofile nonumber
   silent! setlocal nowarn " disable warning on closing buffer
   let &ft=mylang
   exe 'normal :r!LANG=C p4 annotate -ucq --tab=1 ' . myfile . "\n"
   "silent! exe "normal! Go\<C-r>\<C-r>=myline\<CR>"
   "silent! exe "normal! Go\<C-r>\<C-r>=mycol\<CR>"
   "silent! exe "normal! Go\<C-r>\<C-r>=mylang\<CR>"
   "TODO now delete line 1 (not sure why it shows up)
   silent! exe "normal! ggdd" 
   setlocal nomodifiable
   setlocal scrollbind "set scrollbind in annotate buffer
   wincmd p "now switch to origitnal file
   setlocal scrollbind "set scrollbind in current file
   wincmd p "switch back to annotate buffer and move cursor
   call cursor(myline, mycol)
   execute "vertical resize ".(s:linechars('\d\+:\s\+\w\+\s\+\d\+\/\d\+\/\d\+')+1)
endfunction

nmap <leader>pb :call P4_annotate()<CR>