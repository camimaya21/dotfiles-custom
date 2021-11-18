# load our own completion functions
fpath=(~/.zsh/completion $fpath)

# completion
# autoload -U compinit
# compinit
autoload -Uz compinit promptinit;
compinit
promptinit
prompt pure

for function in ~/.zsh/functions/*; do
  source $function
done

# automatically enter directories without cd
setopt auto_cd

# use vim as the visual editor
export VISUAL=vim
export EDITOR=vim

# aliases
if [ -e "$HOME/.aliases" ]; then
  source "$HOME/.aliases"
fi

# use incremental search
bindkey "^R" history-incremental-search-backward

# add some readline keys back
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line

# expand functions in the prompt
setopt prompt_subst

# ignore duplicate history entries
setopt histignoredups

# keep TONS of history
export HISTSIZE=4096

# automatically pushd
setopt auto_pushd
export dirstacksize=5

# awesome cd movements from zshkit
setopt AUTOCD
setopt AUTOPUSHD PUSHDMINUS PUSHDSILENT PUSHDTOHOME
setopt cdablevars

# Try to correct command line spelling
setopt CORRECT CORRECT_ALL

# Enable extended globbing
setopt EXTENDED_GLOB 

export PATH="$HOME/.yarn/bin:$PATH"

#@link: http://github.com/zsh-users/zsh-syntax-highlighting
source ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
ZSH_HIGHLIGHT_PATTERNS=('rm -rf *' 'fg=white,bold,bg=red') # To have commands starting with `rm -rf` in red:

eval "$(rbenv init -)"
. ~/.zsh/plugins/z/z.sh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/camimaya/Dev/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/camimaya/Dev/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/camimaya/Dev/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/camimaya/Dev/google-cloud-sdk/completion.zsh.inc'; fi
alias lzd='lazydocker'

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
