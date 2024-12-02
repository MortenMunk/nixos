{ pkgs, ... }: {
	imports = [
		./settings.nix
		./keymaps.nix
    ./performance.nix
    ./plugins/lsp.nix
    ./plugins/rust.nix
    ./plugins/treesitter.nix
    ./plugins/neo-tree.nix
    ./plugins/which-key.nix
    ./plugins/toggleterm.nix
    ./plugins/cmp.nix
    ./plugins/luasnip.nix
    ./plugins/indent.nix
    ./plugins/lualine.nix
    ./plugins/conform.nix
    ./plugins/barbar.nix
    ./plugins/telescope.nix
    #./plugins/statuscol.nix
    ./plugins/startup.nix
	];

	programs.nixvim = {
		enable = true;
		defaultEditor = true;

		colorschemes.catppuccin = {
      enable = true;
      settings = {
        flavour = "macchiato";
      };
    };

    extraPackages = with pkgs; [
      ripgrep
    ];

		plugins.web-devicons.enable = true;

		diagnostics = { virtual_lines.only_current_line = true; };
		
	};
}
