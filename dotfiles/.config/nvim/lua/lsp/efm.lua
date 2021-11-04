local tools = {
	stylua = require("lsp/tools/stylua"),
	black = require("lsp/tools/black"),
	isort = require("lsp/tools/isort"),
	prettier = require("lsp/tools/prettier"),
	shfmt = require("lsp/tools/shfmt"),
}

return {
	init_options = { documentFormatting = true },
	root_dir = vim.loop.cwd,
	filetypes = {
		"lua",
		"python",
		"yaml",
		"json",
		"markdown",
		"sh",
	},
	settings = {
		rootMarkers = { ".git/" },
		languages = {
			lua = { tools.stylua },
			python = { tools.black, tools.isort },
			typescript = { tools.prettier },
			javascript = { tools.prettier },
			typescriptreact = { tools.prettier },
			javascriptreact = { tools.prettier },
			yaml = { tools.prettier },
			json = { tools.prettier },
			html = { tools.prettier },
			scss = { tools.prettier },
			css = { tools.prettier },
			markdown = { tools.prettier },
			sh = { tools.shfmt },
		},
	},
}
