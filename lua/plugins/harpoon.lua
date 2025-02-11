
return {
  {
    "theprimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("harpoon"):setup()
    end,
    keys = {
      { "<leader>a", function() require("harpoon"):list():add() end, desc = "harpoon file", },
      { "<C-e>", function() local harpoon = require("harpoon") harpoon.ui:toggle_quick_menu(harpoon:list()) end, desc = "harpoon quick menu", },
      { "<C-1>", function() require("harpoon"):list():select(1) end, desc = "harpoon to file 1", },
      { "<C-2>", function() require("harpoon"):list():select(2) end, desc = "harpoon to file 2", },
      { "<C-3>", function() require("harpoon"):list():select(3) end, desc = "harpoon to file 3", },
      { "<C-4>", function() require("harpoon"):list():select(4) end, desc = "harpoon to file 4", },
      { "<C-5>", function() require("harpoon"):list():select(5) end, desc = "harpoon to file 5", },
    },
  },
}
