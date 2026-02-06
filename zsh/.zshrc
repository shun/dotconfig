#
# 対話シェル用のユーザー設定
#

# -----------------
# Zsh 設定
# -----------------

# 履歴に同一コマンドがある場合は古い方を削除する
setopt HIST_IGNORE_ALL_DUPS

# キーバインドを emacs に設定する（-e / -v で切り替え）
bindkey -e

# WORDCHARS からパス区切り文字を除外する
WORDCHARS=${WORDCHARS//[\/]}

# -----------------
# エイリアスと環境変数
# -----------------

alias vi=nvim
alias ll="eza --group-directories-first -la"
alias l="eza --group-directories-first -a"

# EZA の配色
export EZA_COLORS="uu=0:gu=0:da=37:sn=0:sb=0:di=34:ln=36:ex=32:*.md=0:.git=37:ur=37:uw=37:ux=37:ue=37:gr=37:gw=37:gx=37:tr=37:tw=37:tx=37"

# 追加の実行パス
export PATH="$HOME/.local/bin:$PATH"

# 既定のエディタ
export EDITOR=nvim

# -----------------
# 補完
# -----------------

autoload -Uz compinit
compinit

# 補完候補のハイライト
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors "${(s.:.)EZA_COLORS}"

# スマートケース補完
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Za-z}'

# -----------------
# プロンプト
# -----------------

# Starship
if command -v starship >/dev/null 2>&1; then
  eval "$(starship init zsh)"
fi

# -----------------
# 外部ツール / SDK
# -----------------

# Deno
if [[ ":$FPATH:" != *":/Users/skudo/.zsh/completions:"* ]]; then
  export FPATH="/Users/skudo/.zsh/completions:$FPATH"
fi
[ -f "/Users/skudo/.deno/env" ] && . "/Users/skudo/.deno/env"

# Google Cloud SDK
if [ -f '/Users/skudo/.local/share/google-cloud-sdk/path.zsh.inc' ]; then
  . '/Users/skudo/.local/share/google-cloud-sdk/path.zsh.inc'
fi
if [ -f '/Users/skudo/.local/share/google-cloud-sdk/completion.zsh.inc' ]; then
  . '/Users/skudo/.local/share/google-cloud-sdk/completion.zsh.inc'
fi

# Bun
[ -s "/Users/skudo/.bun/_bun" ] && source "/Users/skudo/.bun/_bun"
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Gemini CLI
export GOOGLE_CLOUD_PROJECT=prd-genai-geminienterprise

# Amazon Bedrock
export CLAUDE_CODE_USE_BEDROCK=1
export AWS_REGION="ap-northeast-1"
export ANTHROPIC_MODEL='apac.anthropic.claude-sonnet-4-20250514-v1:0'
export AWS_BEARER_TOKEN_BEDROCK=

# Kiro
[[ "$TERM_PROGRAM" == "kiro" ]] && . "$(kiro --locate-shell-integration-path zsh)"

# Antigravity
export PATH="/Users/skudo/.antigravity/antigravity/bin:$PATH"

# GAM
alias gam="/Users/skudo/bin/gam7/gam"

# -----------------
# カスタム関数
# -----------------

fzf-select-google-cloud() {
  local conf
  # 1. 構成を fzf で選択する（プレビュー付き）
  conf=$(gcloud config configurations list --format="value(name)" | \
    fzf --height 40% --reverse --header="--- Switch GCP Config & ADC ---" \
        --preview "gcloud config configurations describe {}")

  if [ -n "$conf" ]; then
    # 2. 構成をアクティベートする
    gcloud config configurations activate "$conf"

    # 3. プロジェクト ID を取得して環境変数に設定する
    local project_id
    project_id=$(gcloud config get-value project 2>/dev/null)
    export GOOGLE_CLOUD_PROJECT="$project_id"
    export CLOUDSDK_CORE_PROJECT="$project_id"

    echo "✅ Switched to config: [$conf] (Project: $project_id)"
    echo "💡 Setting ADC (Application Default Credentials)..."

    # 4. ADC（プログラム用認証）を更新する
    # ※ブラウザが立ち上がる。不要な場合はこの行をコメントアウトする。
    gcloud auth application-default login --quiet --no-launch-browser || gcloud auth application-default login
  fi
}
alias gl=fzf-select-google-cloud

fzf-select-ghq() {
  local repo
  repo=$(ghq list | fzf)
  if [ -n "$repo" ]; then
    cd "$(ghq root)/$repo"
    zle reset-prompt
  fi
}
zle -N fzf-select-ghq
bindkey '^g' fzf-select-ghq

# --- History enhancements ---
HISTFILE=~/.zsh_history
HISTSIZE=200000
SAVEHIST=200000

setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_REDUCE_BLANKS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt EXTENDED_HISTORY

autoload -U up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '^[[A' up-line-or-beginning-search
bindkey '^[[B' down-line-or-beginning-search

if command -v fzf >/dev/null 2>&1; then
  source <(fzf --zsh)
fi

zshaddhistory() {
  [[ "$1" == *"AWS_BEARER_TOKEN"* ]] && return 1
  [[ "$1" == *"password"* ]] && return 1
  return 0
}
# --- End history enhancements ---

# zsh-autosuggestions
if command -v brew >/dev/null 2>&1; then
  _zas_path="$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
  [ -f "$_zas_path" ] && source "$_zas_path"
  unset _zas_path
fi
