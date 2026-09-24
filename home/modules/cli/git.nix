{ ... }:
{
  programs.git = {
    enable = true;
    settings = {
      user.name = "Josh Cowen";
      user.email = "josh.cowen@icloud.com";
      init.defaultBranch = "main";
      pull.rebase = false;
    };
  };
}
