{ pkgs, self, ... }: {
  nix.settings.experimental-features = "nix-command flakes";

  programs.zsh.enable = true;

  nixpkgs.hostPlatform = "aarch64-darwin";
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs;
    [
      # Terminal packages
      ghostty-bin
      fzf
      nerd-fonts.jetbrains-mono
      claude-code
      _1password-cli
      ripgrep
      bat
      nmap
      ansible
      terraform

      # GUI apps
      obsidian
      brave
      _1password-gui
      libreoffice-bin
      rectangle
      proton-vpn

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
