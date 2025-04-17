" ~/.config/nvim/rc/ui/terminal.vim

" GUI が実行されていない場合のみ設定を行います。
if !has('gui_running')
    " ターミナルでマウスを無効にします。
    set mouse=
endif

" Neovim ではない場合（Vim の場合）のみ設定を行います。
if !has('nvim')
    " 256 色ターミナルを有効にします。
  set t_Co=256

  " ターミナルエミュレータの種類を設定します
  set term=xterm-256color

    " カーソルの形状を設定します。
  let &t_SI = "\e[6 q" "  挿入モード
  let &t_SR = "\e[4 q" "  置換モード
  let &t_EI = "\e[0 q" "  ノーマルモード
endif
