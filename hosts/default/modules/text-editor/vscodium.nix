{pkgs, ...}: {
  home.packages = with pkgs; [
    vscodium
  ];

  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    profiles.default = {
      enableUpdateCheck = false;
      enableExtensionUpdateCheck = false;
    };
  };

  stylix.targets.vscode.profileNames = [
    "default"
  ];
}
