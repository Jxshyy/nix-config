{ ... }:

{
  services.hyprpaper = {
    enable = true;
    settings = {
      wallpaper = [
        {
          monitor = "DP-5";
          fit_mode = "cover";
          path = "~/nix-config/home/wallpapers/wall3.jpg";
        }

        {
          monitor = "DP-6";
          fit_mode = "cover";
          path = "~/nix-config/home/wallpapers/wall1.png";
        }
      ];
    };
  };
}
