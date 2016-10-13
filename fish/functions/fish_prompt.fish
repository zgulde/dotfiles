function fish_prompt --description 'Write out the prompt'
	# Just calculate this once, to save a few cycles when displaying the prompt
	if not set -q __fish_prompt_hostname
		set -g __fish_prompt_hostname (hostname|cut -d . -f 1)
	end

    echo -sne (set_color cyan) "$USER"\
              (set_color normal) ' at '\
              (set_color green) "$__fish_prompt_hostname "\
              (set_color blue) (pwd)\
              (set_color normal) (__fish_git_prompt)\
              (set_color cyan) "\n > "\
              (set_color normal) 

	# echo -n -s "$USER" @ "$__fish_prompt_hostname" ' ' (set_color $color_cwd) (prompt_pwd) (set_color normal) "$suffix "
end

# black
# red
# green
# brown
# yellow
# blue
# magenta
# purple
# cyan
# white
# normal
