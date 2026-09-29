{ pkgs, ... }:

{
  imports = [
    ./git.nix
    ./lazygit.nix
    ./ssh.nix
    ./starship.nix
    ./zoxide.nix
    ./bat.nix
    ./fzf.nix
  ];
}
