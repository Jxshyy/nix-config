{
  config,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/common.nix
    ../../modules/hyprland.nix
  ];

  networking.hostName = "mustang"; # Define your hostname.
  networking.networkmanager.enable = true;

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
  };
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  system.stateVersion = "25.11"; # Did you read the comment?

}
