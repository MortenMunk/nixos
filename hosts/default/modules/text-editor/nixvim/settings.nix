{
	programs.nixvim = {
		clipboard = {
			register = "unnamedplus";
			providers.wl-copy.enable = true;
		};

		opts = {
			updatetime = 100;
			relativenumber = true;
			number = true;
			splitbelow = true;
			splitright = true;
			scrolloff = 4;
			autoindent = true;
			expandtab = true;
			shiftwidth = 2;
			smartindent = true;
			tabstop = 2;
			ignorecase = true;
			incsearch = true;
			smartcase = true;
			wildmode = "list:longest";
			swapfile = false;
			undofile = true;
			termguicolors = true;
      spell = false;
      wrap = false;
      foldlevel = 200;
		};
	};
}
