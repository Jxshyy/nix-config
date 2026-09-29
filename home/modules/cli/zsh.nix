{ ... }:

{
  programs.zsh = {
    enable = true;
    shellAliases = {
      btw = "echo I use nixos, btw";
      reload = "sudo darwin-rebuild switch --flake ~/nix-config";
      z = "zoxide";
    };
    sessionVariables = {
      SSH_AUTH_SOCK = "/Users/josh/.1password/agent.sock";
    };
  };
}
