# Environment Variables
export PATH=$PATH:/usr/local/bin
export EDITOR=nano

# Prompt Customization
PS1='\[\e[1;32m\]\u@\h\[\e[0m\]:\[\e[1;34m\]\w\[\e[0m\]\$ '

# Terminal Colors
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
