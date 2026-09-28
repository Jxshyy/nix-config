{ config, pkgs, ... }:

{
  home.username = "josh";
  home.homeDirectory = "/home/josh";
  home.stateVersion = "26.05";
  home.packages = with pkgs; [
    # Terminal packages
    claude-code
    lazygit
    starship
    hyprcursor
    shellcheck
    unzip
    gitleaks

    # GUI Packages
    spotify
    obsidian
    # TUI Packages

    bluetui
  ];

  imports = [
    ./modules/cli
    ./modules/apps/ghostty.nix
    ./modules/hyprland/hyprpaper.nix
  ];

  # Disabled for now — home-manager would overwrite the hand-written
  # ~/.config/hypr/hyprland.lua with an empty generated one. Re-enable
  # once that file's content is migrated into extraConfig/settings below.
  # wayland.windowManager.hyprland = {
  #   enable = true;
  #   configType = "lua";
  #     settings = {
  #       import = [
  #         ./modules/hyprland/monitors.nix
  #       ];
  #     };
  # };
}
