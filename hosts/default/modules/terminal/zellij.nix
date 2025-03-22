{
  programs.zellij = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      show_startup_tips = false;
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
