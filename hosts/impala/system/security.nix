{pkgs, ...}: {
  security = {
    sudo.enable = false;
    sudo-rs.enable = true;

    pam.services.greetd.enableGnomeKeyring = true;
  };

  services.gnome.gnome-keyring.enable = true;

  environment.systemPackages = with pkgs; [
    libsecret
  ];
}
