{
  programs.nixvim.plugins = {
    hmts.enable = true;

    treesitter = {
      enable = true;
      nixvimInjections = true;
      folding = true;
  
      settings = {
        highlight.enable = true;
        indent.enable = true;
      };
    };

    treesitter-refactor = {
      enable = true;
      highlightDefinitions = {
        enable = true;
        clearOnCursorMove = false;
      };
    };
  };
}
