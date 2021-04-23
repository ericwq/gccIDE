nmap <F4> :FZF<CR>
nmap <F5> :NERDTreeToggle<CR>
nmap <F6> :nohlsearch<CR>
nmap <F8> :TagbarToggle<CR>
nmap <F9> :NERDTreeFind <CR>

" Spell Check in Nvim
set spelllang=en,cjk
nnoremap <silent> <F10> :set spell!<cr>
" [s: go to previous spell error
" ]s: go to next spell error
" To correct an error, use z=
" If you think a word is not a spell error, you can use zg to add the word to your spell list.

" How can I close vim if the only window left open is a NERDTree?
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" open nerdtree automacticlly
autocmd vimenter * NERDTree |  wincmd p

" opoen tagbar automaticlly
"autocmd FileType go TagbarOpen

" Position the (global) quickfix window at the very bottom of the window
" (useful for making sure that it appears underneath splits)
"
" NOTE: Using a check here to make sure that window-specific location-lists
" aren't effected, as they use the same `FileType` as quickfix-lists.
autocmd FileType qf if (getwininfo(win_getid())[0].loclist != 1) | wincmd J | endif

" let NERDTreeMinimalUI = 1
" let NERDTreeDirArrows = 1

" Check if NERDTree is open or active
function! IsNERDTreeOpen()        
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction

" Highlight currently open buffer in NERDTree
"autocmd BufEnter * call SyncTree()

" delve windows configuration
"let g:go_debug_windows = {
"      \ 'vars':       'rightbelow 60vnew',
"      \ 'stack':      'rightbelow 10new',
"\ }

" fzf configuration
nnoremap <silent> <Leader><Space> :Rg<CR>

let $FZF_DEFAULT_COMMAND = 'rg --files'

" c++ syntax highlighting
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1

" Linting for Plug 'vim-syntastic/syntastic'
let g:syntastic_cpp_checkers = ['cpplint']
let g:syntastic_c_checkers = ['cpplint']
let g:syntastic_cpp_cpplint_exec = 'cpplint'
" The following two lines are optional. Configure it to your liking!
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" https://github.com/tpope/vim-markdown
let g:markdown_fenced_languages = ['javascript', 'html', 'bash=sh']
let g:markdown_minlines = 100

" To get correct comment highlighting,
" https://github.com/neoclide/coc.nvim/wiki/Using-the-configuration-file#default-coc-preferences
"
autocmd FileType json syntax match Comment +\/\/.\+$+
