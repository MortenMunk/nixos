{pkgs, ...}: {
  home.packages = with pkgs; [
    isabelle
  ];
}
