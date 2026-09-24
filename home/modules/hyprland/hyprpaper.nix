{ ... }:

{
  services.hyprpaper = {
    enable = true;
    settings = {
      wallpaper = [
        {
          monitor = "DP-2";
          fit_mode = "cover";
          path = "../../wallpapers/wall2.jpg";
        }

        {
          monitor = "DP-3";
          fit_mode = "cover";
          path = "../../wallpapers/wall1.jpg";
        }
      ];
    };
  };
}
