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

set -x LESS_TERMCAP_mb (tput bold; tput setaf 2)
set -x LESS_TERMCAP_md (tput bold; tput setaf 6)
set -x LESS_TERMCAP_me (tput sgr0)
set -x LESS_TERMCAP_so (tput bold; tput setaf 3; tput setab 4)
set -x LESS_TERMCAP_se (tput rmso; tput sgr0)
set -x LESS_TERMCAP_us (tput smul; tput bold; tput setaf 7)
set -x LESS_TERMCAP_ue (tput rmul; tput sgr0)
set -x LESS_TERMCAP_mr (tput rev)
set -x LESS_TERMCAP_mh (tput dim)
set -x LESS_TERMCAP_ZN (tput ssubm)
set -x LESS_TERMCAP_ZV (tput rsubm)
set -x LESS_TERMCAP_ZO (tput ssupm)
set -x LESS_TERMCAP_ZW (tput rsupm)
set -x GROFF_NO_SGR 1
