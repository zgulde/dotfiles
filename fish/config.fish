# sources
source ~/.config/fish/aliases.fish
source ~/.config/fish/env.fish
source ~/.fzf/shell/key-bindings.fish

# env vars
set -x FZF_DEFAULT_OPTS '--reverse'

# PATH
set -x PATH $PATH ~/.fzf/bin/
set -x PATH $PATH ~/bin/

set -x EDITOR vim

# git prompt
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showupstream 'verbose'
set __fish_git_prompt_showcolorhints 'yes'

set __fish_git_prompt_color_stagedstate yellow

set __fish_git_prompt_char_dirtystate '!'
set __fish_git_prompt_char_stagedstate '+'
set __fish_git_prompt_char_untrackedfiles '?'
