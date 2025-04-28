require("nvchad.mappings")

-- add yours here

local map = vim.keymap.set

-- map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("n", "]g", function()
  vim.diagnostic.goto_next()
end)

map("n", "[g", function()
  vim.diagnostic.goto_prev()
end)

vim.g.copilot_no_tab_map = true
vim.b.copilot_enabled = false

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
