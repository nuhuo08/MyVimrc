
" Fast saving " :W sudo saves the file
nmap <leader>w :w!<cr>
command W w !sudo tee % > /dev/null
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm
" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Use the the_silver_searcher if possible (much faster than Ack)
if executable('ag')
  let g:ackprg = 'ag --vimgrep --smart-case'
endif
" Open Ack and put the cursor in the right position
map <leader>g :Ack 
" When you press gv you Ack after the selected text
vnoremap <silent> gv :call VisualSelection('gv', '')<CR>
" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace', '')<CR>
" Visual mode pressing * or # searches for the current selection
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>
" Do :help cope if you are unsure what cope is. It's super useful!
" When you search with Ack, display your results in cope by doing: "   <leader>cc
" To go to the next search result do: "   <leader>n
" To go to the previous search results do: "   <leader>p
map <leader>cc :botright cope<cr>
map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
map <leader>n :cn<cr>
map <leader>p :cp<cr>

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction
function! CmdLine(str)
    call feedkeys(":" . a:str)
endfunction

" Delete trailing white space on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

if has("autocmd")
    autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee,*.h,*.hpp,*.c,*.cpp,*.cc,*.m :call CleanExtraSpaces()
    autocmd BufRead,BufNewFile *.launch setfiletype roslaunch
 
    " Kill the capslock when leaving insert mode.
    autocmd InsertLeave * set iminsert=0

    " push quickfix window always to the bottom
    autocmd FileType qf wincmd J
endif

" Remap VIM 0 to first non-blank character
map 0 ^
" search for words but stays in the origin position
" nnoremap * *``
nnoremap * :keepjumps normal! mi*`i<CR>
nnoremap # :keepjumps normal! mi#`i<CR>
" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

iab xdate <c-r>=strftime("%Y/%m/%d %H:%M:%S")<cr>

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Always show the status line
set laststatus=2
" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

" Turn persistent undo on, means that you can undo even when you close a buffer/VIM
try
    set undodir=~/.vim_mengqi/temp_dirs/undodir
    set undofile
catch
endtry

" Fast editing and reloading of vimrc configs
map <leader>e :e! ~/.vimrc<cr>
map <leader>eb :e! ~/.vim_mengqi/vimrcs/basic.vim<cr>
map <leader>ee :e! ~/.vim_mengqi/vimrcs/extended.vim<cr>
map <leader>ep :e! ~/.vim_mengqi/vimrcs/plugins_config.vim<cr>
" autocmd! bufwritepost ~/.vimrc source ~/.vimrc

" Remove all trailing whitespace by pressing F5
" nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>


