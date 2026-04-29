{ config, lib, pkgs, ... }:
{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports =
    [ 
      ./hardware-configuration.nix
    ];
  imports = [
    ./hardware-configuration.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "mustang"; # Define your hostname.
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/London";

  hardware = {
    graphics.enable = true;
    nvidia = {
      modesetting.enable = true;
      open = true;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };

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

    i2c = {
      enable = true;
      group = "i2c";
    };
  };

  services = {
    xserver.videoDrivers = [ "nvidia" ];
    displayManager.ly.enable = true;
    openssh.enable = true;
    pipewire = {
      enable = true;
      pulse.enable = true;
    };
  };

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
    unzip
    gitleaks

    # Hyprland packages
    kitty
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

    # QoL services
    bluetui
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
    extraGroups = [
      "wheel"
      "onepassword"
      "i2c"
    ];
    packages = with pkgs; [
      tree
    ];
  };

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  environment.etc."brave/policies/managed/extensions.json".text = builtins.toJSON {
    ExtensionInstallForcelist = [
      "aeblfdkhhhdcdjpifhhbdiojplfjncoa;https://clients2.google.com/service/update2/crx"
      "fbdlhcdkmaleonkhckokleapdgilbcph;https://clients2.google.com/service/update2/crx"
    ];
    HomepageLocation = "https://homepage.cowenjones.co.uk";
    HomepageIsNewTabPage = false;
    ShowHomeButton = true;
    NewTabPageLocation = "https://homepage.cowenjones.co.uk";
  };

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  system.stateVersion = "25.11"; # Did you read the comment?

}
