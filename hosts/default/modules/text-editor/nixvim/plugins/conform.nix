{ pkgs, ... }: {
  programs.nixvim = {
    extraPackages = with pkgs; [
      ormolu
      alejandra
      rustfmt
      taplo
      biome
    ];

    plugins.conform-nvim = {
      enable = true;
      settings = {
        notify_on_error = true;
        format_on_save = {
          lspFallback = true;
          timeoutMs = 500;
        };

        formatters_by_ft = {
          nix = ["alejandra"];
          rust = ["rustfmt"];
          toml = ["taplo"];
          haskell = ["ormolu"];
          javascript = ["biome"];
        };
      };
    };
  };
}
