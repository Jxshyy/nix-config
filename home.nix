{ config, pkgs, ... }:

{
	home.username = "josh";
	home.homeDirectory = "/home/josh";
	home.stateVersion = "25.11";
  home.packages = with pkgs; [
    claude-code
    lazygit
    spotify
    starship
  ];

  programs = {
    git = {
      enable = true;
      settings = {
        user.name = "Josh Cowen";
        user.email = "josh.cowen@icloud.com";
        init.defaultBranch = "main";
        pull.rebase = false;
      };
    };

    bash = {
      enable = true;
      shellAliases = {
        btw = "echo I use nixos, btw";
        reload = "sudo nixos-rebuild switch --flake /home/josh/nixos-config/";
      };
      profileExtra = ''
        if [ -z "$WAYLAND_DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
          exec hyprland
        fi
      '';
      sessionVariables = {
        SSH_AUTH_SOCK=/home/josh/.1password/agent.sock;
      };
    };

    ssh = {
      enable = true;
      extraConfig = ''
        Host *
          IdentityAgent "~/.1password/agent.sock"
      '';
    };

    chromium = {
      enable = true;
      package = pkgs.brave;
      extensions = [
        { id = "aeblfdkhhhdcdjpifhhbdiojplfjncoa"; }
        { id = "cjpalhdlnbpafiamejdnhcphjbkeiagm"; }
      ];
    };

    starship = {
      enable = true;
      enableBashIntegration = true;

      settings = {
      };
    };
  };
}
