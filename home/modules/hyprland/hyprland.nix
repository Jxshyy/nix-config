{ config, ... }:

{
  xdg.configFile."hypr".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/hypr";
}
