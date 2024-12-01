{
  programs.nixvim.plugins.statuscol = {
    enable = true;

    settings = {
      clickmod = null;
      relculright = true;
      segments = [
        {
          text = [
            {
              __raw = ''require("statuscol.builtin").lnumfunc'';
            }
          ];
        }
        {
          text = ["%s"];
        }
      ];
    };
  };
}
