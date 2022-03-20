local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local function map(mode, src, dest)
    vim.api.nvim_set_keymap(mode, src, dest, opts)
end

--Remap space as leader key
map("", "<Space>", "<Nop>")
vim.g.mapleader = "\\"
vim.g.maplocalleader = "\\"

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- Resize with arrows
map("n", "<C-Up>", ":resize +2<CR>")
map("n", "<C-Down>", ":resize -2<CR>")
map("n", "<C-Left>", ":vertical resize -2<CR>")
map("n", "<C-Right>", ":vertical resize +2<CR>")

-- Navigate buffers
map("n", "<S-l>", ":bnext<CR>")
map("n", "<S-h>", ":bprevious<CR>")

-- Insert --
-- Press jk fast to enter
map("i", "jk", "<ESC>")

-- Visual --
-- Stay in indent mode
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Move text up and down
map("v", "<A-j>", ":m .+1<CR>==")
map("v", "<A-k>", ":m .-2<CR>==")
map("v", "p", '"_dP')

-- Visual Block --
-- Move text up and down
map("x", "J", ":move '>+1<CR>gv-gv")
map("x", "K", ":move '<-2<CR>gv-gv")
map("x", "<A-j>", ":move '>+1<CR>gv-gv")
map("x", "<A-k>", ":move '<-2<CR>gv-gv")

-- Terminal --
-- Better terminal navigation
map("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
map("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
map("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
map("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- mappings for open config file
map("n", ",v", ":tabedit $MYVIMRC<CR>")

-- mappings for tabularize
map("n", "a=", ":Tabularize /=<CR>")
map("v", "a=", ":Tabularize /=<CR>")
map("n", "a:", ":Tabularize /:\\zs<CR>")
map("v", "a:", ":Tabularize /:\\zs<CR>")


-- golang extra mappings
map("n", ",g", ":!go run %<CR>")

-- Use <Tab> and <S-Tab> to navigate through popup menu
-- inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
-- inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
-- imap <tab> <Plug>(completion_smart_tab)
-- imap <s-tab> <Plug>(completion_smart_s_tab)

-- Telescope Fuzzy finder
map("n", "<Leader>ff", "<cmd>Telescope find_files<CR>")
map("n", "<Leader>fg", "<cmd>Telescope live_grep<CR>")
map("n", "<Leader>fh", "<cmd>Telescope help_tags<CR>")
map("n", "<Leader>fl", "<cmd>Telescope git_files<CR>")
-- nnoremap <Leader>fb <cmd>Telescope buffers<CR>
map("n", "<Leader>fb", "<cmd>Telescope dap list_breakpoints<CR>")
map("n", "<Leader>fc", "<cmd>Telescope dap configurations<CR>")
map("n", "<Leader>fm", "<cmd>Telescope dap frames<CR>")

-- Debugging
map("n",  "<F2>", ":lua require'dapui'.toggle()<CR>")
map("n",  "<F5>", ":lua require'dap'.continue()<CR>")
map("n",  "<F10>", ":lua require'dap'.step_over()<CR>")
map("n",  "<F11>", ":lua require'dap'.step_into()<CR>")
map("n",  "<F12>", ":lua require'dap'.step_out()<CR>")
map("n",  "<Leader>b", ":lua require'dap'.toggle_breakpoint()<CR>")
map("n",  "<Leader>B", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
map("n",  "<Leader>lp", ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>")
map("n",  "<Leader>dr", ":lua require'dap'.repl.open()<CR>")
map("n",  "<Leader>dl", ":lua require'dap'.repl.run_last()<CR>")
map("n",  "<Leader>e", ":lua require'dapui'.eval()<CR>")
map("n",  "<Leader>du", ":lua require'dapui'.toggle()<CR>")


map("n",  "<Leader>tt", ":NvimTreeToggle<CR>")
map("n",  "<Leader>tr", ":NvimTreeRefresh<CR>")
map("n",  "<Leader>tn", ":NvimTreeOpen<CR>")

