# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=200000
setopt beep
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/hiram/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

autoload -Uz promptinit
promptinit

# Config do hiram.

ENABLE_CORRECTION="true"
zstyle ':completion:*' menu select #Completing with menu.

PROMPT='%F{green}%n%f@%F{cyan}%m%f %F{blue}%B%~%b%f %# ' #Prompt customization.
RPROMPT='[%F{yellow}%?%f] %F{yellow}%t%f'

#Setting path.
path=(/usr/local/sbin /usr/local/bin /usr/bin /usr/bin/site_perl /usr/bin/vendor_perl /usr/bin/core_perl /home/hiram/bin /home/hiram/.scripts /var/lib/snapd/snap/bin /home/hiram/.local/bin)

export PATH

# create a zkbd compatible hash;
# to add other keys to this hash, see: man 5 terminfo
typeset -g -A key

key[Home]="${terminfo[khome]}"
key[End]="${terminfo[kend]}"
key[Insert]="${terminfo[kich1]}"
key[Backspace]="${terminfo[kbs]}"
key[Delete]="${terminfo[kdch1]}"
key[Up]="${terminfo[kcuu1]}"
key[Down]="${terminfo[kcud1]}"
key[Left]="${terminfo[kcub1]}"
key[Right]="${terminfo[kcuf1]}"
key[PageUp]="${terminfo[kpp]}"
key[PageDown]="${terminfo[knp]}"
key[Shift-Tab]="${terminfo[kcbt]}"

# setup key accordingly
[[ -n "${key[Home]}"       ]] && bindkey -- "${key[Home]}"      beginning-of-line
[[ -n "${key[End]}"        ]] && bindkey -- "${key[End]}"       end-of-line
[[ -n "${key[Insert]}"     ]] && bindkey -- "${key[Insert]}"    overwrite-mode
[[ -n "${key[Backspace]}"  ]] && bindkey -- "${key[Backspace]}" backward-delete-char
[[ -n "${key[Delete]}"     ]] && bindkey -- "${key[Delete]}"    delete-char
[[ -n "${key[Up]}"         ]] && bindkey -- "${key[Up]}"        up-line-or-history
[[ -n "${key[Down]}"       ]] && bindkey -- "${key[Down]}"      down-line-or-history
[[ -n "${key[Left]}"       ]] && bindkey -- "${key[Left]}"      backward-char
[[ -n "${key[Right]}"      ]] && bindkey -- "${key[Right]}"     forward-char
[[ -n "${key[PageUp]}"     ]] && bindkey -- "${key[PageUp]}"    beginning-of-buffer-or-history
[[ -n "${key[PageDown]}"   ]] && bindkey -- "${key[PageDown]}"  end-of-buffer-or-history
[[ -n "${key[Shift-Tab]}"  ]] && bindkey -- "${key[Shift-Tab]}" reverse-menu-complete

# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]}  )); then
  autoload -Uz add-zle-hook-widget
    function zle_application_mode_start { echoti smkx  }
    function zle_application_mode_stop { echoti rmkx  }
    add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
    add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
fi

# History search.

autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

[[ -n "${key[Up]}"    ]] && bindkey -- "${key[Up]}"   up-line-or-beginning-search
[[ -n "${key[Down]}"  ]] && bindkey -- "${key[Down]}" down-line-or-beginning-search

# Aliases

alias link-silver-dev="cd ~/Workspace/insta-deep-links"
alias heatmap-dev="cd ~/Workspace/heatmap"
