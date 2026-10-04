{
  config,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/common.nix
    ../../modules/hyprland.nix
    ../../modules/ly.nix
  ];

  nix = {
    optimise.automatic = true;
    settings.auto-optimise-store = true;
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
  };

  networking.hostName = "mustang"; # Define your hostname.
  networking.networkmanager.enable = true;

  # Restrict CUDA builds (e.g. ollama's llama.cpp backend) to this machine's
  # actual GPU (RTX 4070 Ti, sm_89) instead of nixpkgs' default 9-architecture list.
  nixpkgs.config.cudaCapabilities = [ "8.9" ];

  hardware = {
    graphics.enable = true;
    nvidia = {
      modesetting.enable = true;
      open = true;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };

    i2c = {
      enable = true;
      group = "i2c";
    };
  };

  services = {
    xserver.videoDrivers = [ "nvidia" ];
  };

  users.users.josh = {
    extraGroups = [
      "i2c"
    ];
    linger = true; # keep the hermes-agent user service/gateway alive after logout
  };
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  system.stateVersion = "25.11"; # Did you read the comment?

}
