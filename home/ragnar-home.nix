{ config, pkgs, ... }:

{
  home.username = "josh";
  home.homeDirectory = "/Users/josh";
  home.stateVersion = "25.11";

  home.packages = with pkgs; [
    lazygit
    shellcheck
  ];

  imports = [
    ./modules/cli/ssh.nix
  ];

  programs = {
    ghostty = {
      enable = true;
      package = if pkgs.stdenv.hostPlatform.isDarwin then pkgs.ghostty-bin else pkgs.ghostty;
      enableZshIntegration = true;
      settings = {
        theme = "TokyoNight";
        font-size = 14;
        window-decoration = false;
      };
    };
    git = {
      enable = true;
      settings = {
        user.name = "Josh Cowen";
        user.email = "josh.cowen@icloud.com";
        init.defaultBranch = "main";
        pull.rebase = false;
      };
    };

    zsh = {
      enable = true;
      shellAliases = {
        btw = "echo I use nixos, btw";
        reload = "sudo darwin-rebuild switch --flake ~/nix-config";
        z = "zoxide";
      };
      sessionVariables = {
        SSH_AUTH_SOCK = "/Users/josh/.1password/agent.sock";
      };
    };

    #    ssh = {
    #      enable = true;
    #
    #      extraConfig = ''
    #        Include ~/.ssh/1Password/config
    #
    #        Host *
    #          IdentityAgent "~/.1password/agent.sock"
    #          SetEnv TERM=xterm-256color
    #      '';
    #    };

    starship = {
      enable = true;
      enableZshIntegration = true;
      settings = { };
    };

    zoxide = {
      enable = true;
      enableZshIntegration = true;
    };
  };
}
