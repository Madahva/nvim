return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "LukasPietzschmann/telescope-tabs",
    },
    config = function()
      local builtin = require("telescope.builtin")

      vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
      vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
      vim.keymap.set("n", "<C-p>", builtin.git_files, {})
      vim.keymap.set("n", "<leader>fr", builtin.oldfiles, {})

      vim.keymap.set("n", "<leader>fk", builtin.keymaps, {})
      vim.keymap.set("n", "<leader>fh", builtin.highlights, {})

      vim.keymap.set("n", "<leader>ps", function()
        builtin.grep_string({ search = vim.fn.input("Grep > ") })
      end)

      require("telescope-tabs").setup()
      vim.keymap.set("n", "<leader>ft", ":Telescope telescope-tabs list_tabs<CR>", {})
    end,
  },
}
