return {
  "nvim-telescope/telescope.nvim",

  dependencies = {
    "nvim-lua/plenary.nvim"
  },

  config = function ()
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
    }

    require("telescope").load_extension('harpoon')
    -- require("telescope").load_extension('git_worktree')
  end
}

