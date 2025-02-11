return {
  {
    "airblade/vim-gitgutter",
  },
  {
    "mbbill/undotree",
    config = function()
      vim.keymap.set("n", "<leader>u", ":UndotreeToggle<CR>", { desc = "Toggle Undotree" })
    end,
  },
}

