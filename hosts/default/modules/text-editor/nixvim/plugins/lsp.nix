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
                flakePath = "/etc/nixos";
                getFlake = "(builtins.getFlake \"${flakePath}\")";
                hm = "${getFlake}.homeConfigurations.\"morten@nixos\".options";
              in {
                nixos.expr = "${getFlake}.nixosConfigurations.nixos.options";
                home-manager.expr = "${hm}";
                nixvim.expr = "${hm}.programs.nixvim.type.getSubOptions []";
              };
            };
          };
          # HASKELL
          hls = {
            enable = true;
            installGhc = false;
          };
          # TYPESCRIPT/JAVASCRIPT
          ts_ls.enable=true;
        };
      };
    };
  };
}
