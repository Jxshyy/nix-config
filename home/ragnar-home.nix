{ config, pkgs, ... }:

{
  home.username = "josh";
  home.homeDirectory = "/Users/josh";
  home.stateVersion = "25.11";

   home.packages = with pkgs; [

    ripgrep
    ansible
    terraform
    
    obsidian
    proton-vpn
   ];

  imports = [
    ./modules/apps
    ./modules/cli
    ./modules/cli/zsh.nix
  ];
}
