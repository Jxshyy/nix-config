{ pkgs, self, ... }: {
  nix = {
    settings.experimental-features = "nix-command flakes";

    gc = {
      automatic = true;
      interval = {
        Weekday = 0;
        Hour = 3;
        Minute = 3;
      };
      options = "--delete-older-than 30d";
    };
  };

  programs = {
    _1password-gui.enable = true;
    _1password.enable = true;
    zsh.enable = true;
  };

  nixpkgs.hostPlatform = "aarch64-darwin";
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs;
    [
      # Terminal packages
      nerd-fonts.jetbrains-mono
      claude-code
      ripgrep
      bat
      nmap
      ansible
      terraform

      # GUI apps
      rectangle
      proton-vpn
      netbird

      # Neovim Packages
      neovim
      nodejs
      gcc
      go
      cargo
      luarocks
      php
      jdk
      wget
      zoxide
      tree-sitter

      # LSP servers 
      nil # Nix LSP
      lua-language-server
      yaml-language-server

      # Formatters 
      stylua
      black
      isort
      nixpkgs-fmt
    ];

  homebrew = {
    enable = true;
    taps = [
      "herald-email/herald"
      "netbirdio/tap"
    ];
    brews = [
      "herald-email/herald/herald"
    ];
    casks = [
      "bambu-studio"
      "balenaetcher"
      "spotify"
      "vlc"
      "rustdesk"
      "discord"
      "netbirdio/tap/netbird-ui"
    ];
    onActivation.cleanup = "zap";
    masApps = {
      "WireGuard" = 1451685025;
    };
  };

  system = {
    configurationRevision = self.rev or self.dirtyRev or null;
    primaryUser = "josh";
    stateVersion = 6;
    defaults = {
      dock.autohide = true;
      dock.persistent-apps = [
        "/Applications/1Password.app"
        "/Applications/Nix\ Apps/Ghostty.app"
        "/Applications/Nix\ Apps/Brave\ Browser.app"
      ];

      NSGlobalDomain.AppleInterfaceStyle = "Dark";
      NSGlobalDomain.AppleShowAllExtensions = true;
      NSGlobalDomain.AppleICUForce24HourTime = true;

      finder.FXPreferredViewStyle = "clmv";
      finder.AppleShowAllExtensions = true;
      finder._FXSortFoldersFirst = true;
    };
  };

  users.users.josh.home = "/Users/josh";

  system.keyboard = {
    enableKeyMapping = true;
    remapCapsLockToEscape = true;
  };
}
