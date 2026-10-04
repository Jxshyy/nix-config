{ pkgs, ... }:

{
  programs = {
    hermes-agent.enable = true;
    hermes-agent.desktop.enable = true;
  };

  services.hermes-agent = {
    enable = true;
    gateway.enable = true;
    settings = {
      toolsets = [ "all" ];
      model = {
        # "ollama" is a registered alias for the generic "custom" OpenAI-compatible
        # provider; must match a model from services.ollama.loadModels in ./ollama.nix
        default = "qwen3:30b-a3b";
        base_url = "http://127.0.0.1:11434/v1";
      };
      # Ollama ignores the key's value but the OpenAI-compatible client requires one set
      environment.OPENAI_API_KEY = "ollama";
    };

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
