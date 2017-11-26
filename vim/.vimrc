" Plug - Packet Manager ----------------->
call plug#begin('~/.vim/plugged')

" language checker
Plug 'w0rp/ale'

" swiftlang
Plug 'Shougo/deoplete.nvim'
Plug 'landaire/deoplete-swift'
Plug 'mitsuse/autocomplete-swift'
Plug 'keith/swift.vim'
Plug 'aciidb0mb3r/SwiftDoc.vim'
Plug 'kballard/vim-swift'

Plug 'SirVer/ultisnips'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'kien/ctrlp.vim'

" colorscheme
Plug 'chriskempson/base16-vim'
Plug 'morhetz/gruvbox'
Plug 'ryanoasis/vim-devicons'

" quickrun
Plug 'thinca/vim-quickrun'

call plug#end()
" Plug - Packet Manager ----------------->

" Vim Settings :
set number
set linespace=2
set softtabstop=4
set shiftwidth=4

:set cursorline

:au FocusLost * :set number
:au FocusGained * :set relativenumber

autocmd InsertEnter * :set number
autocmd Insertleave * :set relativenumber

" colorscheme --------------------------------- {{{
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

set background=dark
if has("gui_vimr")
  colorscheme base16-default-dark
else
  "colorscheme Tomorrow-Night
  colorscheme gruvbox
endif
" }}}

" ctags for swift ---------------------------- {{{
let g:tagbar_type_swift = {
  \ 'ctagstype': 'swift',
  \ 'kinds': [
    \ 'e:Enums',
    \ 't:Typealiases',
    \ 'p:Protocols',
    \ 's:Structs',
    \ 'c:Classes',
    \ 'f:Functions',
    \ 'v:Variables',
    \ 'E:Extensions',
    \ 'l:Constants',
  \ ],
  \ 'sort' : 0
  \ }
" }}}

" swiftformat -------------------------------- {{{
nnoremap <leaderF :!swiftformat %<cr>
" }}}

" swift command ------------------------------ {{{
au FileType swift nmap <leader>r :QuickRun swiftrun<cr>
au FileType swift nmap <leader>t :QuickRun swifttest<cr>
" }}}

" autocomplete for swift --------------------- {{{
autocmd FileType swift imap <buffer> <C-k> <Plug>(autocomplete_swift_jump_to_placeholder)
" }}}

" CLighter Xcode ----------------------------- {{{
" Config for CLighter
if has('nvim')
    let g:clamp_autostart = 1
    let g:clamp_libclang_file ='/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/libclang.dylib'
else
    let g:clighter8_autostart = 1
    let g:clighter8_libclang_file = '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/libclang.dylib'
  endif
" }}}

" swift source_kitten ------------------------ {{{
let g:deoplete#sources#swift#source_kitten_binary = 'usr/local/bin/sourcekitten'
let g:deoplete#sources#swift#deamon_autostart = 1
" }}}

" statusline --------------------------------- {{{
function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

set statusline=
set statusline+=%#PmenuSel#
set statusline+=%{StatuslineGit()}
set statusline+=%#LineNr#
set statusline+=\ %f
set statusline+=%m\
set statusline+=%=
set statusline+=%#CursorColumn#
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c
set statusline+=\ 
" }}}
