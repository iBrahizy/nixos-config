starship init fish | source
zoxide init fish | source

source $HOME/.config/.lastd

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
	set file $HOME/.config/.lastd
	echo "cd $args[0]" > $file 
	cd $args
end
