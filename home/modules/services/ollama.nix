{ ... }:

{
  services.ollama = {
    enable = true;
    acceleration = "cuda";
    # Ollama defaults to a 4096-token context window per loaded model regardless
    # of what the model actually supports (confirmed via `ollama ps` — hermes3:8b
    # advertises 131072 but was silently running at 4096). Hermes' real system
    # prompt (SOUL.md + USER.md + skills catalog + tool schemas) blew past that,
    # truncating tool definitions out of the window and causing malformed/
    # hallucinated tool calls. 32768 was tested live and fits comfortably in the
    # 4070 Ti's 12GB VRAM (hermes3:8b: ~8.8GB used at this context size).
    environmentVariables = {
      OLLAMA_CONTEXT_LENGTH = "32768";
    };
  };
}
