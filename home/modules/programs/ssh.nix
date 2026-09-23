{ ... }:

{
  programs.ssh = {
    enable = true;
    extraConfig = ''
      IdentityAgent "~/.1password/agent.sock"
      setEnv TERM=xterm-256color
    '';
  };
}
