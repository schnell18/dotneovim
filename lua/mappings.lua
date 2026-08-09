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

-- quickfix cnext
map("n", "<Leader>fj", "<cmd> cnext<CR>")
map("n", "<Leader>fh", "<cmd> cprev<CR>")
map("n", "<Leader>ca", ":lua vim.lsp.buf.code_action()<CR>")

vim.g.copilot_no_tab_map = true
vim.b.copilot_enabled = false

map("n", "<Leader>mq", "<cmd> MarkdownPreview<CR>")
map("n", "<Leader>mqs", "<cmd> MarkdownPreviewStop<CR>")
map("n", "<Leader>mqt", "<cmd> MarkdownPreviewToggle<CR>")
