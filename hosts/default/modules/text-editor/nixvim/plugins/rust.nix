{
  programs.nixvim.plugins.rustaceanvim = {
    enable = true;
    rustAnalyzerPackage = null;

    settings = {
      tools.test_executor = "background";

      default_settings = {
        rust-analyxer = {
          procMacro.enable = true;

          cargo = {
            autoreload = true;
            buildScripts.enable = true;
          };

          completion = {
            autoimport.enable = true;
            autoself.enable = true;
          };

          check = {
            command = "clippy";
            extraArgs = ["--tests" "--" "-W" "clippy::all"];
          };

          lens = {
            enable = true;
            debug.enable = true;
            implementations.enable = true;
            references = {
              adt.enable = true;
              enumVariant.enable = true;
              method.enable = true;
              trait.enable = true;
            };
          };
        };
      };
    };
  };
}
