
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" deinの設定
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" deinがインストールされるディレクトリの指定
let s:dein_dir = expand('~/.vimplug/dein') "<- dein によってプラグインがインストールされるディレクトリ
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" deinがインストールされているかをチェック インストールされていなかったらdeinをダウンロードしてくる
if &runtimepath !~# '/dein.vim'
 if !isdirectory(s:dein_repo_dir)
 execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
 endif
 execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" deinの起動
if dein#load_state(s:dein_dir)
 call dein#begin(s:dein_dir)

 " tomlファイル（使用するプラグインのリストが記述されているファイル）の場所を指定
 let g:rc_dir = expand('~/.vim/dein') "<- dein.toml dein_lazy.toml を読み込むディレクトリ
 let s:toml = g:rc_dir . '/dein.toml'
 let s:lazy_toml = g:rc_dir . '/dein_lazy.toml' "<- dein_lazy.toml を使う場合はコメント解除

 " tomlファイルを読み込む
 call dein#load_toml(s:toml, {'lazy': 0})
 call dein#load_toml(s:lazy_toml, {'lazy': 1}) "<- dein_lazy.toml を使う場合はコメント解除

 " 設定の終了
 call dein#end()
 call dein#save_state()
endif

" プラグインのインストールをチェック 未インストールのプラグインがあればインストールする
if dein#check_install()
 call dein#install()
endif

" tomlファイルからプラグインが削除されたら、プラグインの本体も削除
let s:removed_plugins = dein#check_clean()
if len(s:removed_plugins) > 0
  call map(s:removed_plugins, "delete(v:val, 'rf')")
  call dein#recache_runtimepath()
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" 文字コードの指定
set encoding=utf-8
set fileencodings=utf-8
" ファイルを開く文字コードの指定
" set encodingで指定した文字コードは一番最後に記述する(後ろの指定は無視されるため)
" set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8
set fileformats=unix,dos,mac

" コメント文字の設定
" autocmd BufNewFile,BufRead *.vimrc setlocal commentstring=\"\ %s
" autocmd FileType html setlocal commentstring=<!--\ %s\ -->

" 色設定
syntax enable
set background=dark
" vimの背景色をなしにする
autocmd ColorScheme * highlight Normal ctermbg=none
autocmd ColorScheme * highlight LineNr ctermbg=none ctermfg=darkgray
" カーソルラインの色
autocmd ColorScheme * highlight cursorLine ctermbg=233
" visualモード選択の色
autocmd ColorScheme * highlight Visual ctermbg=239
" カラースキーム
colorscheme hybrid
" visualbellを無効化
set visualbell t_vb=

" 検索設定
" ハイライトの有効化
set hlsearch
" インクリメント検索の有効化
set incsearch

" タブ入力をインデントにする
set expandtab
" 基本インデントを2にする
set tabstop=2
set shiftwidth=2
" オートインデント
set autoindent
set smartindent

" filetypeの設定 ＊大事
filetype plugin on " 重要（コメント文字も出来るようになった）
filetype indent on

" fileTypeによってインデントを変える
augroup fileTypeIndent
    autocmd!
    " autocmd BufNewFile,BufRead *.php setlocal tabstop=4 shiftwidth=4
    " autocmd BufNewFile,BufRead *.blade.php setlocal tabstop=2 shiftwidth=2
augroup END

" コメント行にいる時に、自動でコメント文字挿入をなしにする
augroup auto_comment_off
	autocmd!
	autocmd BufEnter * setlocal formatoptions-=r
	autocmd BufEnter * setlocal formatoptions-=o
augroup END

" 行番号の表示
set number
" 対応括弧ハイライト
set showmatch
" バックスペースキーで削除できるものを指定
set backspace=indent,eol,start
" カーソルラインを有効
set cursorline
" buffer切り替え時の未保存警告を無効
set hidden
" 更新間隔を2秒に設定
set updatetime=200
" ESCからnormalモードに戻るタイムラグをなくす
set ttimeoutlen=50
" swapファイルを作らない
set noswapfile
" scrollの行数指定
au BufEnter * set scroll=5
" scrollの開始位置
set scrolloff=5
" コマンドラインでの補完設定
set wildmenu wildmode=list:longest,full
" コマンドの履歴を1000件保存する
set history=1000
" 検索する時に大文字、小文字を区別しない
set ignorecase
" 大文字を入力した時は、区別する
set smartcase

" タグなどの対応ジャンプ
packadd! matchit

" 挿入モード時に非点滅の縦棒タイプのカーソル
let &t_SI .= "\e[6 q"
" ノーマルモード時に非点滅のブロックタイプのカーソル
let &t_EI .= "\e[2 q"
" 置換モード時に非点滅の下線タイプのカーソル
let &t_SR .= "\e[4 q"


""""""""""""""""""""""""""""""""
"" MAPPING
""""""""""""""""""""""""""""""""

" nmap
""""""""""""""""
" baffer移動系
nnoremap <silent> <C-p> :bp<CR>
nnoremap <silent> <C-n> :bn<CR>
nnoremap <silent> <space>q :bd<CR>
" 保存コマンド
nnoremap <silent> <space>w :w<CR>
nnoremap <silent> <space>W :wa<CR>
" 空行の挿入
" append関数を使うやり方(line('.')で現在行を取得出来る)
" 自動コメント文字挿入onでも挿入を防げる
nnoremap <silent> <space>o :call append(line('.'), '')<CR>
nnoremap <silent> <space>O :call append(line('.')-1, '')<CR>
" ハイライトを消す
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>
" 単語ハイライト
nnoremap <silent> <space><space> "zyiw:let @/ = '\<' . @z . '\>'<CR>:set hlsearch<CR>
" 単語一括置換（ハイライト）
nmap <space>s <space><space>:%s/<C-r>///g<Left><Left>
" ノーマルモードでの改行
nnoremap <space><CR> mza<CR><ESC>`z
" ノーマルモードでの空白挿入
nnoremap <TAB> i<space><ESC>
" x,sでのレジスタ指定
" nnoremap x "_x
" nnoremap s "_s


" imap
"""""""""""""
" jjでinsert modeを抜ける時、カーソルを右（元の位置）に戻す
imap jj <Esc>
" imap っｊ <Esc>
" 常に画面の真ん中で入力
inoremap j<CR> <C-g>u<Esc>zzo


" vmap
"""""""""""""
" visualmodeからのハイライト、置換
xnoremap <silent> <space><space> mz:call <SID>set_vsearch()<CR>:set hlsearch<CR>`z
xmap <space>s <space><space>:%s/<C-r>///g<Left><Left>
" 検索関数の定義
function! s:set_vsearch()
  silent normal gv"zy
  let @/ = '\V' . substitute(escape(@z, '/\'), '\n', '\\n', 'g')
endfunction
" 行を移動
" vnoremap <C-p> "zx<Up>"zP`[V`]
vnoremap <silent> <C-p> :m.-2<CR>`[V`]
vnoremap <C-n> "zx"zp`[V`]
" vnoremap <silent> <C-n> :m.+1<CR>`[V`]
" 行を複製
vnoremap <space>p "zy"zP
vnoremap <space>n "zy`]"zp


" cmap
""""""""""""
" コマンドラインで過去のコマンドを探す時、フィルタリング出来るようにする。
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
" %%でアクテイブバッファのフルパスを出す(from 実践vim)
" %:p でフルパスを出せる
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:p:h').'/' : '%%'

