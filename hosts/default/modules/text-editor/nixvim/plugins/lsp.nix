{pkgs, ...}: {
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
            settings = let
              flake = ''(builtins.getFlake "/etc/nixos")'';
              system = ''''${builtsins.currentSystem}'';
            in {
              formatting.command = ["alejandra"];
              nixpkgs.expr = "import ${flake}.inputs.nixpkgs {}";
              options = rec {
                nixos.expr = "${flake}.nixosConfigurations.nixos.options";
                home-manager.expr = "${nixos.expr}.home-manager.users.type.getSubOptions [ ]";
                nixvim.expr = "${flake}.packages.${system}.nvim.options";
              };
            };
          };
          # HASKELL
          hls = {
            enable = true;
            installGhc = false;
          };
          # TYPESCRIPT/JAVASCRIPT
          ts_ls.enable = true;

          # C & C++
          clangd.enable = true;

          # Coq
          coq_lsp.enable = true;

          # GO
          gopls.enable = true;
        };
      };
    };
  };
}
