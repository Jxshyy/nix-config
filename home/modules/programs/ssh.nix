{ ... }:

{
  programs.ssh = {
    enable = true;
    settings."*" = {
      forwardAgent = true;
      addKeysToAgent = false;
      compression = false;
      serverAliveInterval = 0;
      serverAliveCountMax = 3;
      hashKnownHosts = false;
      userKnownHostsFile = "~/.ssh/known_hosts";
      controlMaster = "no";
      controlPath = "~/.ssh/master-%r@%n:%p";
      controlPersist = "no";
    };

    enableDefaultConfig = false;
    extraConfig = ''
      IdentityAgent "~/.1password/agent.sock"
      setEnv TERM=xterm-256color
    '';
  };
}
