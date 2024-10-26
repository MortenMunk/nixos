{
  programs.nixvim = {
    plugins = {
      lsp = {
        enable = true;
        
        keymaps = {
          silent = true;
          diagnostic = {
            # Navigate in diagnostics
            "<leader>k" = "goto_prev";
            "<leader>j" = "goto_next";
          };

          lspBuf = {
            gd = "definition";
            gD = "references";
            gt = "type_definition";
            gi = "implementation";
            K = "hover";
            "<F2>" = "rename";
          };
        };

        servers = {
          # NIX
          nixd = {
            enable = true;
            settings = {
              formatting.command = ["alejandra"];
              nixpkgs = {
                expr = "import <nixpkgs> {}";
              };
              options = let 
                getFlake = ''(builtins.getFlake "/../etc/nixos")'';
              in {
                nixos.expr = ''${getFlake}.nixosConfigurations.default.options'';
                nixvim.expr = ''${getFlake}.nixvim.options'';
                home-manager.expr = ''${getFlake}.homeConfigurations.morten.options'';
              };
            };
          };
          # HASKELL
          hls.enable = true;
          # TYPESCRIPT/JAVASCRIPT
          ts_ls.enable=true;
        };
      };
    };
  };
}
