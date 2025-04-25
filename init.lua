vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.opt.colorcolumn = "79"
-- configuration for vimtex
vim.g.vimtex_quickfix_open_on_warning = 0
vim.g.vimtex_quickfix_autoclose_after_keystrokes = 1

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    repo,
    "--branch=stable",
    lazypath,
  }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
    config = function()
      require "options"
    end,
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

augroup("YankHighlight", { clear = true })
autocmd("TextYankPost", {
  group = "YankHighlight",
  callback = function()
    vim.highlight.on_yank { higroup = "IncSearch", timeout = "1000" }
  end,
})

augroup("vimrc", { clear = true })
autocmd("TextYankPost", {
  group = "vimrc",
  pattern = "/tmp/*",
  command = "setlocal noundofile",
})

augroup("javaclass", { clear = true })
autocmd("BufReadPre", { group = "javaclass", pattern = "*.class", command = "let &bin=1" })
autocmd("BufReadPost", { group = "javaclass", pattern = "*.class", command = "if &bin | %!xxd" })
autocmd("BufReadPost", { group = "javaclass", pattern = "*.class", command = "set ft=xxd | endif" })
autocmd("BufWritePre", { group = "javaclass", pattern = "*.class", command = "if &bin | %!xxd -r" })
autocmd("BufWritePre", { group = "javaclass", pattern = "*.class", command = "endif" })
autocmd("BufWritePost", { group = "javaclass", pattern = "*.class", command = "if &bin | %!xxd" })
autocmd("BufWritePost", { group = "javaclass", pattern = "*.class", command = "set nomod | endif" })

local VIM_EDITTABLE_PATTERNS = {
  "*.R",
  "*.bib",
  "*.cls",
  "*.css",
  "*.go",
  "*.html",
  "*.ini",
  "*.java",
  "*.js",
  "*.json",
  "*.lua",
  "*.md",
  "*.pl",
  "*.py",
  "*.r",
  "*.sh",
  "*.sql",
  "*.tex",
  "*.ts",
  "*.txt",
  "*.xml",
  "*.yaml",
  "*.yml",
  "Makefile",
  "Dockerfile",
}

-- highlight trailing spaces
augroup("hlTrailingSpaces", { clear = true })
autocmd({ "BufRead", "BufNewFile" }, {
  pattern = VIM_EDITTABLE_PATTERNS,
  group = "hlTrailingSpaces",
  callback = function()
    vim.api.nvim_command [[
      highlight EoLSpace ctermbg=red guibg=#892929
      match EoLSpace /\s\+$/
    ]]
  end,
})

-- format code on save
-- strip trailing spaces on save
autocmd("BufWritePre", {
  pattern = VIM_EDITTABLE_PATTERNS,
  callback = function(args)
    local save_cursor = vim.fn.getcurpos()
    vim.api.nvim_command "%s/\\s\\+$//e"
    vim.fn.setpos(".", save_cursor)
  end,
})

-- git setup
require("gitsigns").setup()
