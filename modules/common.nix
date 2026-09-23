{
  pkgs,
  ...
}:

{
  imports = [
    ./braveExtensions.nix
    ./fonts.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  time.timeZone = "Europe/London";

  hardware = {
    graphics.enable = true;
    bluetooth = {
      enable = true;
      powerOnBoot = true;
      settings = {
        General = {
          Experimental = true;
          FastConnectable = true;
        };
        Policy = {
          AutoEnable = true;
        };
      };
    };
  };

  services = {
    openssh.enable = true;
    pipewire = {
      enable = true;
      pulse.enable = true;
    };
  };

  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    # Terminal packages
    neovim
    wget
    git
    _1password-cli
    fzf
    unzip
    wiremix

    # Hyprland packages
    waybar
    hyprpaper
    hyprlock
    hypridle
    wofi
    _1password-gui
    wl-clipboard
    ddcutil

    # Neovim Packages
    nodejs
    gcc
    go
    cargo
    luarocks
    php
    jdk
    tree-sitter

    # LSP Servers
    nil
    lua-language-server
    yaml-language-server

    # Formatters
    stylua
    black
    isort
    nixpkgs-fmt
  ];

  programs = {
    _1password = {
      enable = true;
    };

    _1password-gui = {
      enable = true;
      polkitPolicyOwners = [ "josh" ];
    };
  };

  users.users.josh = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "onepassword"
    ];
    packages = with pkgs; [
      tree
    ];
  };



  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
}
