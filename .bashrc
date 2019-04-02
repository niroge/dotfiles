#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias tree='tree -AC'
alias @tree='tree'

export LANG='it_IT.UTF-8'
export PS1="\n[\[\e[1;33m\]\u@\h\[\e[0m\]]<->[\[\e[1;32m\]\t\[\e[0m\]]\n\[\e[1;31m\]\w $\[\e[0m\] "

alias gdb='gdb -q'

# Keyboard bindings for Konsole
bind -x '"\C-p":"konsoleprofile ScrollBarPosition=0"'       # C-p : scrollbar on left
bind -x '"\C-h":"konsoleprofile ScrollBarPosition=2"'

# Configure the GO system
export GOPATH=/usr/share/golang/
export GOBIN=/usr/share/golang/sysbin/
export PATH=/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/usr/share/golang/sysbin/
