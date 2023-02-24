local treesitter = require("nvim-treesitter.configs")
treesitter.setup({
	highlight = {
		enable = false,
	},
	indent = {
		enable = true,
	},
	autotag = {
		enable = true,
	},
	ensure_installed = { "bash", "lua", "vim", "help", "html", "scss", "css", "javascript" },
	auto_install = true,
})
