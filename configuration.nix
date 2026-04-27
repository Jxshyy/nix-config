{ config, lib, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "mustang"; # Define your hostname.
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/London";

  hardware.graphics.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia = {
    modesetting.enable = true;
    open = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };
  services.displayManager.ly.enable = true;

  nixpkgs.config.allowUnfree = true; 
  environment.systemPackages = with pkgs; [
    # Terminal packages
    ghostty
    neovim
    wget
    git
    _1password-cli
    fzf
    zoxide

    # Hyprland packages
    kitty
    waybar
    hyprpaper
    wofi
    brave
    _1password-gui
    wl-clipboard

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
    hyprland = { 
    enable = true;
    xwayland.enable = true;
    };

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
    extraGroups = [ "wheel" "onepassword" ];
    packages = with pkgs; [
      tree
    ];
  };

  services.openssh.enable = true;

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  system.stateVersion = "25.11"; # Did you read the comment?

}

  # services.pulseaudio.enable = true;
  # OR
  # services.pipewire = {
  #   enable = true;
  #   pulse.enable = true;
  # };

