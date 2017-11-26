if g:dein#_cache_version != 100 | throw 'Cache loading error' | endif
let [plugins, ftplugin] = dein#load_cache_raw(['/Volumes/Data/.config/nvim/init.vim'])
if empty(plugins) | throw 'Cache loading error' | endif
let g:dein#_plugins = plugins
let g:dein#_ftplugin = ftplugin
let g:dein#_base_path = '/Volumes/Data/.vim/bundles'
let g:dein#_runtime_path = '/Volumes/Data/.vim/bundles/.cache/init.vim/.dein'
let g:dein#_cache_path = '/Volumes/Data/.vim/bundles/.cache/init.vim'
let &runtimepath = '/Volumes/Data/.config/nvim,/etc/xdg/nvim,/Volumes/Data/.local/share/nvim/site,/usr/local/share/nvim/site,/Volumes/Data/.vim/bundles/repos/github.com/Shougo/dein.vim,/Volumes/Data/.vim/bundles/.cache/init.vim/.dein,/usr/share/nvim/site,/usr/local/Cellar/neovim/0.2.2/share/nvim/runtime,/Volumes/Data/.vim/bundles/.cache/init.vim/.dein/after,/usr/share/nvim/site/after,/usr/local/share/nvim/site/after,/Volumes/Data/.local/share/nvim/site/after,/etc/xdg/nvim/after,/Volumes/Data/.config/nvim/after'
filetype off
