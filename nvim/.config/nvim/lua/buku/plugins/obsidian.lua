vim.pack.add {
  {
    src = "https://github.com/obsidian-nvim/obsidian.nvim",
    version = vim.version.range "*",
  },
}

require("obsidian").setup({
  legacy_commands = false,

  frontmatter = {
    enabled = false
  },

  workspaces = {
    {
      name = "personal",
      path = "~/Projects/personal/Notes",
    },
  },

  -- New notes go here
  notes_subdir = "inbox",

  -- Create new notes in notes_subdir
  new_notes_location = "notes_subdir",
  note_id_func = function(title)
    if title then
      return title
        :gsub(" ", "-")
        :gsub("[^A-Za-z0-9-]", "")
        :lower()
    end

    return tostring(os.time())
  end
})

local map = vim.keymap.set

map("n", "<leader>on", "<cmd>Obsidian new<CR>", { desc = "New Note" })
map("n", "<leader>or", "<cmd>Obsidian rename<CR>", { desc = "Rename Note" })
map("n", "<leader>ol", "<cmd>Obsidian follow_link<CR>", { desc = "Follow Link" })
map("n", "<leader>oo", "<cmd>Obsidian open<CR>", { desc = "Open in Obsidian" })
map("n", "<leader>ox", "<cmd>Obsidian toggle_checkbox<CR>", { desc = "Toggle Checkbox" })
map("n", "<leader>os", "<cmd>Obsidian search<CR>", { desc = "Search Notes in Vault" })
