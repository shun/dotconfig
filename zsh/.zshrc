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
  fi
}
zle -N fzf-select-ghq
bindkey '^g' fzf-select-ghq

