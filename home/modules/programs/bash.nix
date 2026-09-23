{ ... }:
{
  programs.bash = {
    enable = true;
    shellAliases = {
      btw = "echo I use nixos, btw";
      z = "zoxide";
      rebuild = "sudo nixos-rebuild switch --flake ~/nix-config#mustang";
      update = "nix flake update ~/nix-config && sudo nixos-rebuild switch --flake ~/nix-config#mustang";
    };
    sessionVariables = {
      SSH_AUTH_SOCK = /home/josh/.1password/agent.sock;
    };
  };
}
