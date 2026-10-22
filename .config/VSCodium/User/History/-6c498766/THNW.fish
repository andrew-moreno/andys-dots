source /usr/share/cachyos-fish-config/cachyos-config.fish

# overwrite greeting
# potentially disabling fastfetch
#function fish_greeting
#    # smth smth
#end

function y
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	command yazi $argv --cwd-file="$tmp"
	if read -z cwd < "$tmp"; and [ "$cwd" != "$PWD" ]; and test -d "$cwd"
		builtin cd -- "$cwd"
	end
	command rm -f -- "$tmp"
end

zoxide init fish | source

# Defines the location of the Zoxide data so that sudo knows where it is
set -gx _ZO_DATA_DIR "$HOME/.local/share/zoxide"

# Aliases
alias ff "clear && fastfetch"
alias m "micro"
alias y "yazi"
alias sy "sudo yazi"

starship init fish | source

# Alias for storing dotfiles (https://www.atlassian.com/git/tutorials/dotfiles)
alias config='/usr/bin/git --git-dir=$HOME/.andys-dots/ --work-tree=$HOME'