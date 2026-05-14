{pkgs, ...}: {
  programs.vscodium = {
    enable = true;
    profiles.default = {
      enableUpdateCheck = false;
      enableExtensionUpdateCheck = false;
    };
  };

  stylix.targets.vscode.profileNames = [
    "default"
  ];
}
