return {
	"obsidian-nvim/obsidian.nvim",
	version = "*",

	keys = {
		{
			"<leader>oo",
			"<cmd>Obsidian open<cr>",
			desc = "Open current note in Obsidian",
		},
		{
			"<leader>od",
			"<cmd>Obsidian today<cr>",
			desc = "Open today's daily note",
		},
	},

	opts = {
		frontmatter = { enabled = false },

		daily_notes = {
			enabled = true,
			folder = "daily",
			date_format = "YYYY-MM-DD",
		},

		callbacks = {
			enter_note = function(note)
				vim.keymap.set("n", "<leader>ch", "<cmd>Obsidian toggle_checkbox<cr>", {
					buffer = true,
					desc = "Toggle checkbox",
				})
			end,
		},

		legacy_commands = false,

		workspaces = {
			{
				name = "personal",
				path = "~/Documents/dox",
			},
		},
	},
}
