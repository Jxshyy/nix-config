{ pkgs, ... }:

{
  imports = [
    ./bash.nix
    ./brave.nix
    ./git.nix
    ./ssh.nix
    ./starship.nix
    ./zoxide.nix
    ./bat.nix
    ./fzf.nix
  ];
}
