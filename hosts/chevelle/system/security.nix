{...}: {
  security = {
    sudo.enable = false;
    sudo-rs.enable = true;

    # Enabled to allow Hyprlock
    # pam.services.hyprlock = {};
  };
}
