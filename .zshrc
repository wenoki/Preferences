# Set up the prompt
autoload -Uz promptinit
promptinit
prompt adam1

setopt histignorealldups sharehistory

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Alias
alias cp="cp -i"
alias mv="mv -i"
alias rr="rm -r"
alias la="ls -la"
alias be="bundle exec"
alias bi="bundle install --path=vendor/bundle"

alias crontab="crontab -i"
alias myip="curl ifconfig.me"

# Key Binding
bindkey "\e[Z" reverse-menu-complete

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %B%d%b'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# OSX or Linux
case ${OSTYPE} in
  darwin*)
    export PATH="$(brew --prefix coreutils)/libexec/gnubin:/usr/local/bin:/usr/sbin:/sbin:/usr/X11/bin:$PATH"
    eval $(gdircolors ~/Preferences/dircolors.ansi-dark)
    alias subl="/Applications/Sublime\ Text\ 2.app/Contents/SharedSupport/bin/subl"

    export JAVA_HOME=`/usr/libexec/java_home`
    export JAVA=$JAVA_HOME/bin
  ;;
  linux*)
    eval "$(dircolors ~/Preferences/dircolors.ansi-universal -b)"
    export LC_CTYPE="ja_JP.UTF-8"
  ;;
esac
