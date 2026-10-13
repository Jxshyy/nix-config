{ ... }:

{
  services.netbird.clients.wt0 = {
    login = {
      enable = true;
      setupKeyFile = "/home/josh/netbird/key";
    };

    port = 51821;
    ui.enable = true;

    openFirewall = true;
    openInternalFirewall = true;
  };
}
