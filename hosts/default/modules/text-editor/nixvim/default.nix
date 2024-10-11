{
	imports = [
		./settings.nix
		./keymaps.nix
    ./plugins/lsp.nix
    ./plugins/treesitter.nix
    ./plugins/neo-tree.nix
	];

	programs.nixvim = {
		enable = true;
		defaultEditor = true;

		colorschemes.catppuccin.enable = true;
		plugins.web-devicons.enable = true;

		diagnostics = { virtual_lines.only_current_line = true; };
		
	};
}
