{ config, pkgs, ... }:

{
	home.username = "josh";
	home.homeDirectory = "/home/josh";
	home.stateVersion = "25.11";
  home.packages = with pkgs; [
    claude-code
    lazygit
  ];

  programs.git = {
    enable = true;
    settings = {
      user.name = "Josh Cowen";
      user.email = "josh.cowen@icloud.com";
      init.defaultBranch = "main";
      pull.rebase = false;
    };
  };
	programs.bash = {
		enable = true;
		shellAliases = {
			btw = "echo I use nixos, btw";
		};
		profileExtra = ''
			if [ -z "$WAYLAND_DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
				exec hyprland
			fi
		'';
	};
  programs.chromium = {
    enable = true;
    package = pkgs.brave;
    extensions = [
      { id = "aeblfdkhhhdcdjpifhhbdiojplfjncoa"; }
      { id = "cjpalhdlnbpafiamejdnhcphjbkeiagm"; }
    ];
  };
}
