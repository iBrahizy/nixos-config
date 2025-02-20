{ pkgs, ... }:

{
	environment.systemPackages = with pkgs; [
		ruby
		bundler
		solargraph
		nodejs_20
		zlib
		yarn
		libpqxx
		# rubyPackages.pg
	];

	# This technically isn't "ruby" but I only need it for rails
	services.postgresql.enable = true;
}
