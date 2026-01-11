-- the best nvim colorscheme(s)!
return {
	"metalelf0/black-metal-theme-neovim",

	lazy = false,
	priority = 1000,
	config = function()
		-- typically I'd rotate around gorgoroth, dark-funeral and this.
		vim.cmd("colorscheme emperor")
		vim.o.background = "dark"
	end,
}
