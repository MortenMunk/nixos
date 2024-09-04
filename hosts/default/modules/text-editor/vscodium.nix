{pkgs, ...}: {
    home.packages = with pkgs; [
        vscodium
    ];
    
    programs.vscode = {
        enable = true;
        package = pkgs.vscodium;
    };
}