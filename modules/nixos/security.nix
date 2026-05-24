{self, ...}: {
  flake.nixosModules.mySecurity = {pkgs, ...}: {
    security = {
      sudo.enable = false;
      sudo-rs.enable = true;
      pam.services.greetd.enableGnomeKeyring = true;
      pam.services.swaylock = {};
      polkit.enable = true;
    };

    services.gnome.gnome-keyring.enable = true;
  };
}
