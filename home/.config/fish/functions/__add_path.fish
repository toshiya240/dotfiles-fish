function __add_path
    if not contains $argv $PATH; and test -d $argv
        set -x PATH $argv $PATH
    end
end
