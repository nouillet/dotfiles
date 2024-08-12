return {
   "zbirenbaum/copilot-cmp",
   after = { "copilot.lua" },

   config = function ()
      require("copilot_cmp").setup({
         suggestion = { enabled = false },
         panel = { enabled = false },
      })
   end
}
