{ config, pkgs, ... }:

{
	home.username = "josh";
	home.homeDirectory = "/home/josh";
	home.stateVersion = "25.11";
  home.packages = with pkgs; [
    # Terminal packages
    claude-code
    lazygit
    starship
    hyprcursor
    shellcheck

    # GUI Packages
    spotify
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
        reload = "sudo nixos-rebuild switch --flake /home/josh/nix-config/";
        z = "zoxide";
        rebuild = "sudo nixos-rebuild switch --flake ~/nix-config#mustang";
        update = "nix flake update ~/nix-config && sudo nixos-rebuild switch --flake ~/nix-config#mustang";
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
          IdentityAgent "~/.1password/agent.sock"
          setEnv TERM=xterm-256color
      '';
    };

    chromium = {
      enable = true;
      package = pkgs.brave;
    };

    starship = {
      enable = true;
      enableBashIntegration = true;
      settings = {
      };
    };

    zoxide = {
      enable = true;
      enableBashIntegration = true;
    };
  };
}
