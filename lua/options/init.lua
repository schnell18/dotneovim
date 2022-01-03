local set = vim.opt

set.tabstop = 4
set.shiftwidth = 4
set.softtabstop = 4
set.cmdheight = 2
set.updatetime=50
set.signcolumn="yes"
set.clipboard="unnamed,unnamedplus"
-- Set completeopt to have a better completion experience
set.completeopt="menuone,noinsert,noselect"
-- Avoid showing message extra message when using completion
set.shortmess:append("c")
set.mouse:append("a")

set.smartindent=true
set.compatible=false
set.nu=true
set.rnu=true
set.expandtab=true

-- Persistent undo
set.undofile=true
set.undodir=vim.env.HOME .. "/.neovim/undo"

if vim.fn.has('termguicolors') == 1 then
  set.termguicolors = true
end
