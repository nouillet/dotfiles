local actions = require("telescope.actions")

require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ["<C-u>"] = false,
        ["<esc>"] = actions.close,
      },
    },
  },
  pickers = {
    -- buffers = {
    --   theme = "ivy"
    -- },
    -- find_files = {
    --   theme = "ivy"
    -- },
    -- git_files = {
    --   theme = "ivy"
    -- },
    -- live_grep = {
    --   theme = "ivy"
    -- }
  }
}

require("telescope").load_extension('harpoon')
require("telescope").load_extension('git_worktree')

