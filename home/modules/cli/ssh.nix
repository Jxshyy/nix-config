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
      # 1Password SSH bookmarks pin each host to its own key (IdentitiesOnly),
      # so the agent's 30+ keys don't trip MaxAuthTries on hosts without a
      # bookmark match. 1Password manages this file; don't edit it directly.
      Include ~/.ssh/1Password/config

      IdentityAgent "~/.1password/agent.sock"
      setEnv TERM=xterm-256color
    '';
  };
}
