{ config, pkgs, ... }: {
  home.username = "morten";
  home.homeDirectory = "/home/morten";

  home.stateVersion = "24.05"; # Please read the comment before changing.

  imports = [
	./modules/style/themes.nix

	./modules/file-managers/media.nix

	./modules/text-editor/vscodium.nix
	#./modules/text-editor/obsidian.nix
	./modules/text-editor/nvim.nix

	./modules/style/fonts.nix

	./modules/wm/hyprland.nix
	./modules/wm/hyprlock.nix
	./modules/wm/hypridle.nix
	./modules/wm/hyprpaper.nix
	
	./modules/system/btop.nix
	./modules/system/clip.nix
	./modules/system/rofi.nix
	./modules/system/git.nix
	./modules/system/dunst.nix
	./modules/system/screenshot.nix

	./modules/terminal/kitty.nix
	./modules/terminal/zsh.nix

	./modules/browser/brave.nix

	./modules/other/discord.nix
  ];

  home.packages = with pkgs; [
	# WM
	waybar
	kitty

	# CMD
	neofetch
	nautilus
  ];

  home.sessionVariables = {
	XDG_CURRENT_DESKTOP = "Hyprland";
	ROFI_WAYLAND = "1";
	NIXOS_OZONE_WL = "1";
	WLR_NO_HARDWARE_CURSORS = "1";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}

