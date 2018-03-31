# at login
if status is-login >/dev/null; and test -z "$TMUX"

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
        if not contains $i $PATH
            if test -d $i
                set -x PATH $i $PATH
            end
        end
    end

    # Set the default Less options.
    # Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
    # Remove -X and -F (exit if the content fits on one screen) to enable it.
    set -x LESS '-F -g -i -M -R -S -w -X -z-4'

    # Set the Less input preprocessor
    if type -q src-hilite-lesspipe.sh
        set -x LESSOPEN '| src-hilite-lesspipe.sh %s'
    else if type -q lesspipe.sh
        set -x LESSOPEN '| lesspipe.sh %s'
    end

    #
    # Temporary Files
    #
    if not test -d "$TMPDIR"
        set -x TMPDIR "/tmp/$LOGNAME"
        mkdir -p -m 700 "$TMPDIR"
    end

    #
    # Homebrew
    #
    if test -f $HOME/.secret/homebrew-conf.fish
        source $HOME/.secret/homebrew-conf.fish
    end

end
