if [[ -n $TMUX ]] ; then
    [[ -f $HOME/.bashrc ]] && source $HOME/.bashrc
else
    export PATH=/usr/local/anaconda3/bin:$PATH
fi

# opam configuration
# test -r /Users/zach/.opam/opam-init/init.sh && . /Users/zach/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true
