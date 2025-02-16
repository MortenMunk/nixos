{
  programs.zellij = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      simplified_ui = true;
      pane_frames = false;
      copy_on_select = true;
      plugins = {};
      ui = {
        pane_frames = {
          hide_session_name = true;
        };
      };
    };
  };
}
