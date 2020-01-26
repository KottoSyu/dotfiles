# googleの拡張機能
- Vimium
  - vimのキーバインドでgoogleを操作
- ~~Easy Auto Refresh~~
  - 情報漏えいの可能性が
  - browser-syncを使おう

# deoplete.vimには、python3のneovimパッケージが必要。

- (pip3を使うを入れられる) ※brewで簡単にいけるかもしれない。
    >pip3があったので、そのままneovimを入れた。

# indentLineの動きがおかしい。

- Terminalでの動きがどうなのか確かめたい。
    >原因はgko/vim-coloresqueにあった。ap/vim-css-colorに変えた。

# lexima.vim(自動括弧閉じ)もおかしい。

- 前の括弧を消しても、後ろの括弧が消えない。。。
- BSのみ有効みたい。。ctrl-hでは出来ない。　オプションで適用できる。

# mysqlはpagerをlessにすると、見やすい。

- オプション一覧
- -S   画面幅より長い行を折り返さない
- -n   行番号を表示しない（レスポンスが良くなる）
- -i   検索時に大文字/小文字を区別しない
- -F   1画面でファイル全体が表示できる場合はlessを自動終了
- -X   端末にtermcap初期化文字、非初期化文字を送らない

# browser-sync
- browser-sync start --server(-s) --file(-f)" " --startPath" "

# vim
- so $MYVIMRC
- bufdo e(!)
