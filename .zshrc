#==============================================================================
# 1. Profiling & Performance OptimIZATIONS
#==============================================================================

# Measure time taken by each component
# zmodload zsh/zprof

# Performance optimizations, see https://scottspence.com/posts/speeding-up-my-zsh-shell
# Disable slow startup features
export DISABLE_AUTO_UPDATE="true"
export DISABLE_MAGIC_FUNCTIONS="true"
export DISABLE_COMPFIX="true"

# Fast compinit with cache
zstyle ':completion:*' rehash true
zstyle ':completion:*' cache-path "$ZSH_CACHE_DIR/.zcompdump"
zstyle ':completion:*' use-cache on

# From https://github.com/Aloxaf/fzf-tab?tab=readme-ov-file#configure
# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
# set descriptions format to enable group support
# NOTE: don't use escape sequences (like '%F{red}%d%f') here, fzf-tab will ignore them
zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# force zsh not to show completion menu, which allows fzf-tab to capture the unambiguous prefix
zstyle ':completion:*' menu no
# NOTE: fzf-tab does not follow FZF_DEFAULT_OPTS by default
# To make fzf-tab follow FZF_DEFAULT_OPTS.
# NOTE: This may lead to unexpected behavior since some flags break this plugin. See Aloxaf/fzf-tab#455.
# zstyle ':fzf-tab:*' use-fzf-default-opts yes
# switch group using `<` and `>`
zstyle ':fzf-tab:*' switch-group '<' '>'
# custom fzf flags
zstyle ':fzf-tab:*' fzf-flags --color=fg:1,fg+:2 --bind=tab:accept
# Use tmux popup
zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup
# https://github.com/Aloxaf/fzf-tab/wiki/Configuration#popup-min-size
zstyle ':fzf-tab:*' popup-min-size 60 8
# preview directory's content with eza when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always --icons --all $realpath'
zstyle ':fzf-tab:complete:ls:*' fzf-preview 'eza -1 --color=always --icons --all $realpath'
zstyle ':fzf-tab:complete:cd:*' popup-min-size 80 12
# zstyle ':fzf-tab:complete:cd:*' popup-pad 30 0

# Defer plugin loads
zstyle ':omz:plugins:nvm' lazy yes
zstyle ':omz:plugins:nvm' lazy-cmd pnpm eslint prettier typescript nvim nv node copilot

autoload -Uz compinit
if [ "$(date +'%j')" != "$(stat -f '%Sm' -t '%j' "$ZSH_CACHE_DIR/.zcompdump" 2>/dev/null)" ]; then
  compinit
else
  compinit -C
fi

# Parallel auto-update workers
export ZSH_CUSTOM_AUTOUPDATE_NUM_WORKERS=8

# Autosuggest config
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE="20"
ZSH_AUTOSUGGEST_USE_ASYNC=1

#==============================================================================
# 2. Environment & PATH
#==============================================================================

# Path to Oh My Zsh installation
export ZSH="$HOME/.oh-my-zsh"

# Homebrew on Linux
export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
export MANPATH="/home/linuxbrew/.linuxbrew/share/man:$MANPATH"
export INFOPATH="/home/linuxbrew/.linuxbrew/share/info:$INFOPATH"

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('$HOME/apps/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$HOME/apps/miniconda3/etc/profile.d/conda.sh" ]; then
        . "$HOME/apps/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="$HOME/apps/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


#==============================================================================
# 3. Prompt & Theme
#==============================================================================

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Choose your Oh My Zsh theme
ZSH_THEME="powerlevel10k/powerlevel10k"

# Load custom Powerlevel10k config if it exists
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh


#==============================================================================
# 4. Start oh-my-zsh with plugins
#==============================================================================

plugins=(
  git
  you-should-use
  ls
  autoupdate
  fzf-tab
  nvm
  zsh-autosuggestions
  fast-syntax-highlighting
)

source "$ZSH/oh-my-zsh.sh"

# Ignore . and .. in autocompletions
zstyle ':completion:*' special-dirs false
_comp_options+=(globdots)


#==============================================================================
# 5. Editor & Pager
#==============================================================================

# Choose editor (vim on SSH, nvim locally)
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Vi-mode zsh
bindkey -v

alias bat='bat --color=always --paging=never'
alias less='/home/linuxbrew/.linuxbrew/bin/bat --color=always --paging=always'

# Bat & less integration
export PAGER='less -RFX'
export BAT_PAGER="$PAGER"
export MANPAGER="sh -c 'awk '\''{ gsub(/\x1B\\[[0-9;]*m/, \"\", \$0); gsub(/.\\x08/, \"\", \$0); print }'\'' | bat -p -lman'"


#==============================================================================
# 6. Aliases
#==============================================================================

# Directory shortcuts
alias rep="cd $HOME/Repositories"
alias 4sem="cd $HOME/TuBs/4.Semester"
alias 5sem="cd $HOME/TuBs/5.Semester"

# Safer remove
alias rma="rm"
alias rm="trash"

# Python helpers
alias py='ptpython'
alias python='python3'

# Neovim
alias nv='nvim'

# ld — lists only directories (no files)
# lf — lists only files (no directories)
# lh — lists only hidden files (no directories)
# ll — lists everything with directories first
# ls — lists only files sorted by size
# lt — lists everything sorted by time updated

# eza / tree
alias ld='eza -lD --icons'
alias lf='eza -lF --color=always | grep -v /'
alias lh='eza -d .* --icons'
alias lhh='eza -dl .* --icons --group-directories-first'
alias lS='eza -1 --icons'

function ezatree() {
  eza --tree --level=$1 --icons
}
for i in {1..10}; do
  alias "l${i}"="ezatree $i"
done

# fd tree
alias at='tree --fromfile '

# Copy path to clipboard
alias cpp='pwd | xclip -selection clipboard'


#==============================================================================
# 7. Custom Functions
#==============================================================================

# yazi https://yazi-rs.github.io/docs/quick-start#shell-wrapper (auto `cd` to directory, where you quit)
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}


#==============================================================================
# 8. FZF Integration
#==============================================================================

# Load key-bindings + fuzzy completion
source <(fzf --zsh)

# -- Use fd instead of fzf --

export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

# Use fd (https://github.com/sharkdp/fd) for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}


# Preview logic
show_file_or_dir_preview="
if [ -d {} ]; then
  eza --tree --color=always {} | head -200
else
  bat -n --color=always --line-range :500 {};
fi
"

export FZF_DEFAULT_OPTS="--preview 'bat --color=always --style=full --line-range=:500 {}' --preview-window '<70(up)' --tmux=80%"
export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

# Custom completions with previews
_fzf_comprun() {
  local cmd=$1; shift
  case "$cmd" in
    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo \${}'"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview "$show_file_or_dir_preview" "$@" ;;
  esac
}

# ripgrep->fzf->nvim [QUERY]
# see https://junegunn.github.io/fzf/tips/ripgrep-integration/
rf() (
  RELOAD='reload:rg --column --color=always --smart-case {q} || :'
  OPENER='if [[ $FZF_SELECT_COUNT -eq 0 ]]; then
            nvim {1} +{2}     # No selection. Open the current line in nvim.
          else
            nvim +cw -q {+f}  # Build quickfix list for the selected items.
          fi'
  fzf --disabled --ansi --multi \
      --bind "start:$RELOAD" --bind "change:$RELOAD" \
      --bind "enter:become:$OPENER" \
      --bind "ctrl-o:execute:$OPENER" \
      --bind 'alt-a:select-all,alt-d:deselect-all,ctrl-/:toggle-preview' \
      --delimiter : \
      --preview 'bat --style=full --color=always --highlight-line {2} {1}' \
      --preview-window '~4,+{2}+4/3,<80(up)' \
      --query "$*"
)

# Autocompletions for fzf
compdef _gnu_generic fzf

# Git objects
source "$HOME/.local/bin/fzf-git.sh"


#==============================================================================
# 9. Secrets & Misc
#==============================================================================

# If you have a secrets file, source it
[ -f ~/.zsh_secrets ] && source ~/.zsh_secrets

# Init zoxide
eval "$(zoxide init zsh --cmd cd)"

# Set higher key timeout for fzf-git
export KEYTIMEOUT=100 # in milliseconds

# Display profile summary
# zprof

# Measure the time taken by each component
# zmodload zsh/zprof
