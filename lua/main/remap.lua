vim.g.mapleader = ',';


vim.api.nvim_set_keymap('n', '<F6>', ':setlocal spell! spelllang=en_us<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader><leader>', ':Prettier<CR>', { noremap = true, silent = true })


-- Apps
vim.api.nvim_set_keymap('n', '<leader>K', ':!kitty . & <CR><CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>F', ':!nautilus . & <CR><CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>x', ':!node %<CR>', { noremap = true, silent = true })


vim.api.nvim_set_keymap('n', '<leader>hh', ':noh<CR>:ClearNotifications<CR>', { noremap = true, silent = true })


vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Move lines
vim.api.nvim_set_keymap('n', '<A-j>', ':m .+1<CR>==', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-k>', ':m .-2<CR>==', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<A-j>', '<Esc>:m .+1<CR>==gi', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<A-k>', '<Esc>:m .-2<CR>==gi', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<A-j>', ':m \'>+1<CR>gv=gv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<A-k>', ':m \'<-2<CR>gv=gv', { noremap = true, silent = true })

-- Clipboard operations
vim.api.nvim_set_keymap('n', '<C-c>', '"+y', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<C-c>', '"+y', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-v>', '"+p', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-v>', '<C-r>+', { noremap = true, silent = true })
vim.api.nvim_set_keymap('c', '<C-v>', '<C-r>+', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-r>', '<C-v>', { noremap = true, silent = true })

-- Tab switching
for i = 1, 5 do
  vim.api.nvim_set_keymap('n', '<Leader>' .. i, i .. 'gt', { noremap = true, silent = true })
end
vim.api.nvim_set_keymap('n', '<TAB>', ':tabnext<CR>', { noremap = true, silent = true })

-- Resize windows
vim.api.nvim_set_keymap('n', '<right>', ':vertical resize +5<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<left>', ':vertical resize -5<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<up>', ':resize +5<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<down>', ':resize -5<CR>', { noremap = true, silent = true })

-- Better tabbing
vim.api.nvim_set_keymap('i', '<expr><TAB>', 'pumvisible() ? "\\<C-n>" : "\\<TAB>"', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<', '<gv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '>', '>gv', { noremap = true, silent = true })


-- Key mappings for navigating splits
local opts = { noremap = true, silent = true }

-- Move to the left split
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', opts)
-- Move to the below split
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', opts)
-- Move to the above split
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', opts)
-- Move to the right split
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', opts)



-- Snippets

vim.api.nvim_set_keymap('i', '<leader>log', 'console.log()<Left>', { noremap = true, silent = true })




vim.api.nvim_create_user_command('ToggleLineNrColor', function()
  local pink = '#E698FF'
  local blue = '#12525D'
  local current_hl = vim.api.nvim_get_hl_by_name('LineNr', true)

  if current_hl.foreground == tonumber(pink:sub(2), 16) then
    vim.api.nvim_set_hl(0, 'LineNr', { fg = blue })
  else
    vim.api.nvim_set_hl(0, 'LineNr', { fg = pink })
  end
end
, {})
