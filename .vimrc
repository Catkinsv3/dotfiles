call plug#begin()
Plug 'epope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'wellle/context.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'vim-airline/vim-airline'
Plug 'doums/darcula'
Plug 'preservim/nerdtree'
Plug 'leafgarland/typescript-vim'
Plug 'zivyangll/git-blame.vim'
Plug 'vim-scripts/indentpython.vim'
Plug 'kien/ctrlp.vim'
Plug 'easymotion/vim-easymotion'
call plug#end()

nnoremap <space> <nop>
let mapleader = ' '
"map <space> <leader>
"map <space><space> <leader><leader>
"map <Leader> <Plug>(easymotion-prefix)

set termguicolors

" https://github.com/kovidgoyal/kitty/issues/108
" vim hardcodes background color erase even if the terminfo file does
" not contain bce (not to mention that libvte based terminals
" incorrectly contain bce in their terminfo files). This causes
" incorrect background rendering when using a color theme with a
" background color.
let &t_ut=''

" House keeping
set tabstop=4 shiftwidth=4 softtabstop=4 expandtab smartindent
set nu rnu
set background=dark
set showcmd
colorscheme darcula
syntax on
 
" Relative line number toggling between files
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
:augroup END
 
" NERDTree
nnoremap C-t :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
"" Start NERDTree and put the cursor back in the other window.
" autocmd VimEnter * NERDTree | wincmd p
"" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
nnoremap <leader>n :NERDTreeFocus<CR>
 
" Window resizing
nnoremap <C-j> <C-w>+
nnoremap <C-k> <C-w>-
nnoremap <C-h> <C-w><
nnoremap <C-l> <C-w>>
nnoremap = <C-w>=
 
" Git blame
nnoremap <Leader>s :<C-u>call gitblame#echo()<CR>
