if status is-interactive >/dev/null 2>&1
    for f in $XDG_CONFIG_HOME/fish/rc.d/*.fish
        source $f
    end
end
