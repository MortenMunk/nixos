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
          nixd.enable = true;
          hls = {
            enable = true;
            settings = {
              haskell = {
                hlintOn = true;
                plugin = {
                  hlint = {
                    codeActionsOn = true;
                    diagnosticsOn = true;
                    hlintRules = {
                      ignore = [
                        "useCamelCase"
                      ];
                    };
                  };
                };
              };
            };
          };
          ts_ls.enable=true;
        };
      };
    };
  };
}
