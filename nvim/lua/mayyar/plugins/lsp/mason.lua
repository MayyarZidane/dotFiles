local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local mason_null_ls = require("mason-null-ls")

mason.setup({
    providers = {
        "mason.providers.client",
        "mason.providers.registry-api",
    }
})
mason_lspconfig.setup({
	ensure_installed = {
		"html",
		"cssls",
		"tsserver",
		"bashls",
		"lua_ls",
	},
})

mason_null_ls.setup({
	ensure_installed = {
		"prettier",
		"stylua",
		"eslint_d",
	},
})
