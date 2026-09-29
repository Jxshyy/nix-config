{ pkgs, ... }:

{
  programs.ghostty = {
    enable = true;
    package = if pkgs.stdenv.hostPlatform.isDarwin then pkgs.ghostty-bin else pkgs.ghostty;
    settings = {
      theme = "TokyoNight";
      font-size = 14;
      window-decoration = false;
    };
  };
}
