# -*- shell-script -*-
export ZSH=$HOME/.oh-my-zsh

if [ -z $STY ]
then
    ZSH_THEME="edvardm"
    # echo "OUTSIDE SCREEN"
else
    ZSH_THEME="superjarin"
    # echo "INSIDE SCREEN"
fi

export UPDATE_ZSH_DAYS=7
export PATH=$HOME/bin:$PATH
export LANG=en_US.UTF-8

DISABLE_AUTO_TITLE="true"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_STAMPS="dd.mm.yyyy"
plugins=(colored-man colorize docker git git-extras git-flow github gitignore history-substring-search history rsync sudo themes thor urltools setopt zsh_reload zsh-syntax-highlighting zaw)

source $ZSH/oh-my-zsh.sh

# User configuration

[ $TERM = "dumb" ] && unsetopt zle && PS1='$ '

alias df="df -haT --type=fuseblk --type=cifs --type=exfat --type=ext4 --type=ext3 --type=ext2 --type=fuse.encfs --type=xfs --type=nfs4 --type=nfs --type=iso9660 --type=fuse"
alias du="du -hs"
alias ls="ls -gh --group-directories-first -p -X --color"
alias grep="grep --color=auto --exclude-dir=.cvs --exclude-dir=.git --exclude-dir=.hg --exclude-dir=.svn"
alias myip="dig +short myip.opendns.com @resolver1.opendns.com"
alias docker-ps='docker ps --format "table {{.Names}}\t{{.RunningFor}}\t{{.Image}}"'
alias docker-stats='docker ps --format "{{ .Names }}" | xargs docker stats'


# Ugly fix for https://github.com/robbyrussell/oh-my-zsh/pull/3341
unset GREP_OPTIONS

setopt share_history
setopt hash_list_all
setopt completeinword
setopt auto_pushd
setopt pushd_ignore_dups
setopt nobeep
setopt noglobdots
setopt emacs

[[ -e ~/.profile ]] && emulate sh -c 'source ~/.profile'
