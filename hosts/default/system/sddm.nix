{pkgs, ...}: {
  services.displayManager.sddm = {
    enable = true;
    package = pkgs.kdePackages.sddm;
    theme = "sddm-astronaut-theme";
    extraPackages = with pkgs; [sddm-astronaut];
    wayland.enable = true;
  };
}
