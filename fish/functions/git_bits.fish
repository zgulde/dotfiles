function git_bits
    set -l bits

    if git status | grep modified >/dev/null
        set bits "!$bits"
    end

    if git status | grep 'Untracked file' >/dev/null
        set bits "?$bits"
    end

    if git status | grep 'to be committed' >/dev/null
        set bits "+$bits"
    end

    if git status | grep deleted >/dev/null
        set bits "x$bits"
    end

    if git status | grep ahead >/dev/null
        set bits "*$bits"
    end

    echo $bits
end
