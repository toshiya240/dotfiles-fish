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
