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
	echo "builtin cd $(pwd)" > $lastd 
end

function z
	touch $lastd
	__zoxide_z $argv
	echo "builtin cd $(pwd)" > $lastd 
end
