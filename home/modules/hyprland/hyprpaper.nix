{ ... }:

{
  services.hyprpaper = {
    enable = true;
    settings = {
      wallpaper = [
        {
          monitor = "DP-2";
          fit_mode = "cover";
          path = "~/nix-config/home/wallpapers/wall3.jpg";
        }

        {
          monitor = "DP-3";
          fit_mode = "cover";
          path = "~/nix-config/home/wallpapers/wall1.png";
        }
      ];
    };
  };
}
