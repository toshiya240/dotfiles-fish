# at login
if status is-login >/dev/null; and test -z "$TMUX"

    set -x XDG_CONFIG_HOME $HOME/.config
    set -x XDG_CACHE_HOME  $HOME/.cache
    set -x XDG_DATA_HOME   $HOME/.local/share

    #
    # Editors
    #
    set -x EDITOR 'vim'
    set -x VISUAL 'vim'
    set -x PAGER 'less'

    #
    # Language
    #
    if test -z "$LANG"
        set -x LANG 'ja_JP.UTF-8'
    end

    #
    # Paths
    #
    for i in \
            /usr/local/{bin,sbin} \
            /usr/local/share/npm/bin \
            $HOME/.cargo/bin \
            $HOME/bin
        __add_path $i
    end

    #
    # Temporary Files
    #
    if not test -d "$TMPDIR"
        set -x TMPDIR "/tmp/$LOGNAME"
        mkdir -p -m 700 "$TMPDIR"
    end

    #
    # source profile.d
    #
    for f in $XDG_CONFIG_HOME/fish/profile.d/*.fish
        source $f
    end
end
