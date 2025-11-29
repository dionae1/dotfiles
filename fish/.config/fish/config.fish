set -U fish_greeting
if test -f ~/.cache/wal/sequences
    cat ~/.cache/wal/sequences
end

if status is-interactive
    alias ls='eza --icons --group-directories-first'
    alias ll='eza --icons --group-directories-first -l'
end
