# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

source <(fzf --zsh)

eval "$(lua $(brew --prefix z.lua)/share/z.lua/z.lua --init zsh)"

source /opt/homebrew/share/zsh-you-should-use/you-should-use.plugin.zsh

source $(brew --prefix)/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh
  # source $(brew --prefix)/share/zsh-history-substring-search/zsh-history-substring-search.zsh
  
  # 绑定键位
  # bindkey '^[[A' history-substring-search-up
  # bindkey '^[[B' history-substring-search-down
# bindkey -M vicmd 'k' history-substring-search-up
# bindkey -M vicmd 'j' history-substring-search-down
# 绑定到不同的键
  # bindkey '^P' history-substring-search-up
  # bindkey '^N' history-substring-search-down


# fix zsh-vi-mode 覆盖 zsh history substring的问题
# 定义初始化完成后的回调函数
function zvm_after_init() {
  # 加载 history-substring-search

  source $(brew --prefix)/share/zsh-history-substring-search/zsh-history-substring-search.zsh
    bindkey '^[[A' history-substring-search-up
  bindkey '^[[B' history-substring-search-down

  # 当使用 substring search 时，临时禁用 autosuggestions
  function _disable_autosuggest_during_search() {
    _zsh_autosuggest_disable
  }
  
  function _enable_autosuggest_after_search() {
    _zsh_autosuggest_enable
  }



}


source /Users/haha/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# source $(brew --prefix)/share/zsh-history-substring-search/zsh-history-substring-search.zsh
#
# bindkey '^[[A' history-substring-search-up
# bindkey '^[[B' history-substring-search-down


# git alias
alias gp="git push"
alias ga="git add"
alias ga.="git add ."
alias gm="git commit"
alias gs="git status"
alias gck="git checkout"

#ls 
alias ls="lsd"
alias lt="ls --tree"



extract() {  
    if [ -f "$1" ]; then  
        case "$1" in  
            *.tar.bz2)  tar xvjf "$1"    ;;  
            *.tar.gz)   tar xvzf "$1"    ;;  
            *.bz2)      bunzip2 "$1"     ;;  
            *.rar)      unrar x "$1"     ;;  
            *.gz)       gunzip "$1"      ;;  
            *.tar)      tar xvf "$1"     ;;  
            *.zip)      unzip "$1"       ;;  
            *.7z)       7z x "$1"        ;;  
            *)          echo "不支持的文件格式" ;;  
        esac  
    else  
        echo "文件不存在: $1"  
    fi  
}  

export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.ustc.edu.cn/brew.git"
export HOMEBREW_API_DOMAIN="https://mirrors.ustc.edu.cn/homebrew-bottles/api"
export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.ustc.edu.cn/homebrew-bottles/bottles"

source $(brew --prefix)/share/zsh-history-substring-search/zsh-history-substring-search.zsh

####### brew安装镜像加速
# 配置 Homebrew 的 Git 远程仓库加速地址，替换为国内的镜像源
export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.ustc.edu.cn/brew.git"
export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.ustc.edu.cn/homebrew-core.git"

# 配置 Bottle（二进制包）加速地址
export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.ustc.edu.cn/homebrew-bottles"

# 配置 Homebrew API 的加速地址
export HOMEBREW_API_DOMAIN="https://mirrors.ustc.edu.cn/homebrew-bottles/api"

# 隐藏环境变量提示
export HOMEBREW_NO_ENV_HINTS="1"

export ANTHROPIC_BASE_URL="https://claude-proxy.shiroha.tech/api"
export ANTHROPIC_AUTH_TOKEN="cr_a0c6116e694b60292619360cf30b94f2d4d7f53d963560bd4907fc8844bf58de"

# Load Angular CLI autocompletion.
# source <(ng completion script)
