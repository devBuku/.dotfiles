vim.pack.add({
	"https://github.com/maxmx03/solarized.nvim",
})

-- Default options:
vim.o.background = "dark"

-- default config
require("solarized").setup({
	transparent = {
		enabled = true,
		pmenu = true,
		normal = true,
		normalfloat = true,
		neotree = true,
		nvimtree = true,
		whichkey = true,
		telescope = true,
		lazy = true,
	},
	on_highlights = nil,
	on_colors = nil,
	palette = "solarized", -- solarized (default) | selenized
	variant = "winter", -- "spring" | "summer" | "autumn" | "winter" (default)
	error_lens = {
		text = false,
		symbol = false,
	},
	styles = {
		enabled = true,
		types = { italic = false },
		functions = { italic = false },
		parameters = { italic = false },
		comments = { italic = false },
		strings = { italic = false },
		keywords = { italic = false },
		variables = { italic = false },
		constants = { italic = false },
	},
	plugins = {
		treesitter = true,
		lspconfig = true,
		navic = true,
		cmp = true,
		indentblankline = true,
		indentmini = true,
		neotree = true,
		nvimtree = true,
		whichkey = true,
		dashboard = true,
		gitsigns = true,
		telescope = true,
		noice = true,
		hop = true,
		ministatusline = true,
		minitabline = true,
		ministarter = true,
		minicursorword = true,
		notify = true,
		rainbowdelimiters = true,
		bufferline = true,
		lazy = true,
		rendermarkdown = true,
		ale = true,
		coc = true,
		leap = true,
		alpha = true,
		yanky = true,
		gitgutter = true,
		mason = true,
		flash = true,
	},
})

vim.cmd.colorscheme("solarized")
