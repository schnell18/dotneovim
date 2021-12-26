local map = function(type, key, value)
  vim.api.nvim_buf_set_keymap(0, type, key, value, {noremap = true, silent = true});
end

local _ = require("nvim-tree").setup({})

-- File explorer
-- map('n', '<Leader>tt', ':NvimTreeToggle<CR>')
-- map('n', '<Leader>tr', ':NvimTreeRefresh<CR>')
-- map('n', '<Leader>tn', ':NvimTreeOpen<CR>')
-- NvimTreeOpen and NvimTreeClose are also available if you need them
