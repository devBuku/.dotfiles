vim.pack.add({
	{
		src = "https://github.com/Mofiqul/vscode.nvim",
	},
})
-- Lua:
-- For dark theme (neovim's default)
vim.o.background = "dark"

require("vscode").setup({
	-- Alternatively set style in setup
	-- style = 'light'

	-- Enable transparent background
	transparent = true,

	-- Enable italic comment
	italic_comments = false,

	-- Enable italic inlay type hints
	italic_inlayhints = false,

	-- Underline `@markup.link.*` variants
	underline_links = true,

	-- Disable nvim-tree background color
	disable_nvimtree_bg = true,

	-- Apply theme colors to terminal
	terminal_colors = true,
})
require('vscode').load()

-- load the theme without affecting devicon colors.
vim.cmd.colorscheme("vscode")
