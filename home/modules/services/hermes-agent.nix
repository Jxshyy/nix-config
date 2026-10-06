{ pkgs, ... }:

{
  programs = {
    hermes-agent.enable = true;
  };

  services.hermes-agent = {
    enable = true;
    gateway.enable = true;
    settings = {
      messaging.telegram = {
          enabled = true;
          allowed_users = [ 8708972339 ];
        };

          toolsets = [
      "file"
      "memory"
      "skills"
      "clarify"
      ];
      model = {
        default = "hermes3:8b";
        base_url = "http://127.0.0.1:11434/v1";
      };
      environment.OPENAI_API_KEY = "ollama";
      environment.OBSIDIAN_VAULT_PATH = "/home/josh/HomeLabDocs";
      environmentFiles = [ "/home/josh/.hermes/.env" ];
    };
    extraPackages = with pkgs; [
      nodejs
      ripgrep
      ffmpeg
    ];
    extraDependencyGroups = [ "messaging" ];

    extraPlugins = [
      (pkgs.fetchFromGitHub {
        owner = "NousResearch";
        repo = "hermes-plugin-claude-subscription-directsdk";
        rev = "ef73726cfaf2fa0ee041e55572f406e2c24fed83";
        hash = "sha256-kOQJWKqfGn41V21x/yjt8+i/MyQ2suctvbhf+x8djk8=";
      })
    ];
  };
}
