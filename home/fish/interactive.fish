starship init fish | source
zoxide init fish | source

set lastd $HOME/.lastd
source $lastd

set -g fish_key_bindings fish_vi_key_bindings
set -U fish_greeting

bind -M insert \v accept-autosuggestion

function n
	set file $HOME/.config/nnn/.lastd 
	echo "cd '$(pwd)'" > $file 
	set --export NNN_TMPFILE $file
	nnn
	source $file
end

function cd
	touch $lastd
	builtin cd $argv
	echo "builtin cd '$(pwd)'" > $lastd 
end

function y
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	yazi $argv --cwd-file="$tmp"
	if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
		builtin cd -- "$cwd"
	end
	rm -f -- "$tmp"
end

function once
	nix-shell -p $argv[1] --run "$argv"
end
