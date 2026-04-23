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

  # Enable the X11 windowing system.
  # services.xserver.enable = true;
  hardware.opengl.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia = {
    modesetting.enable = true;
    open = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };
#    services.xserver = {
#  	enable = true;
#  	autoRepeatDelay = 200;
#  	autoRepeatInterval = 30;
#  	windowManager.qtile.enable = true;
#    };

  services.displayManager.ly.enable = true;

  programs.hyprland = { 
	enable = true;
	xwayland.enable = true;
  };
  # Enable sound.
  # services.pulseaudio.enable = true;
  # OR
  # services.pipewire = {
  #   enable = true;
  #   pulse.enable = true;
  # };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.josh = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    packages = with pkgs; [
      tree
    ];
  };

  # programs.firefox.enable = true;

  nixpkgs.config.allowUnfree = true; 
  environment.systemPackages = with pkgs; [
    neovim
    wget
    git
    waybar
    kitty
    ghostty
    hyprpaper
    wofi
    brave
    _1password-gui
    _1password-cli
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

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  system.stateVersion = "25.11"; # Did you read the comment?

}

