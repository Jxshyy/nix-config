{ pkgs, ... }:

{
  imports = [
    ./brave.nix
    ./ghostty.nix
    ./prism-launcher.nix
  ];
}
