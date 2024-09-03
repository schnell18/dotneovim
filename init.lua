vim.g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"
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
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
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

require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args)
    require("conform").format({ bufnr = args.buf })
  end,
})

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

augroup('YankHighlight', {clear = true})
autocmd('TextYankPost', {
  group = 'YankHighlight',
  callback = function ()
    vim.highlight.on_yank({ higroup = 'IncSearch', timeout = '1000' })
  end
})


augroup('vimrc', {clear = true})
autocmd('TextYankPost', {
  group = 'vimrc',
  pattern = '/tmp/*',
  command = 'setlocal noundofile'
})


augroup('javaclass', {clear = true})
autocmd('BufReadPre',   {group='javaclass', pattern='*.class', command='let &bin=1'})
autocmd('BufReadPost',  {group='javaclass', pattern='*.class', command='if &bin | %!xxd'})
autocmd('BufReadPost',  {group='javaclass', pattern='*.class', command='set ft=xxd | endif'})
autocmd('BufWritePre',  {group='javaclass', pattern='*.class', command='if &bin | %!xxd -r'})
autocmd('BufWritePre',  {group='javaclass', pattern='*.class', command='endif'})
autocmd('BufWritePost', {group='javaclass', pattern='*.class', command='if &bin | %!xxd'})
autocmd('BufWritePost', {group='javaclass', pattern='*.class', command='set nomod | endif'})

local VIM_EDITTABLE_PATTERNS = {
    '*.yml', '*.yaml', '*.js', '*.ts',
    '*.md', '*.go', '*.xml', '*.java',
    '*.py', '*.sh', '*.json', '*.pl',
    '*.txt', '*.html', '*.tex', '*.bib',
    '*.css', '*.sql', '*.lua', '*.ini',
    '*.cls', 'Makefile', 'Dockerfile',
}

-- highlight trailing spaces
augroup('hlTrailingSpaces', {clear = true})
autocmd({'BufRead', 'BufNewFile'}, {
  pattern=VIM_EDITTABLE_PATTERNS,
  group = 'hlTrailingSpaces',
  callback = function ()
    vim.api.nvim_command([[
      highlight EoLSpace ctermbg=red guibg=#892929
      match EoLSpace /\s\+$/
    ]])
  end
})

-- -- strip trailing spaces on save
-- augroup('stripTrailingSpaces', {clear = true})
-- autocmd('BufWritePre', {
--   pattern=VIM_EDITTABLE_PATTERNS,
--   group = 'stripTrailingSpaces',
--   callback = function ()
--     local save_cursor = vim.fn.getcurpos()
--     vim.api.nvim_command("%s/\\s\\+$//e")
--     vim.fn.setpos('.', save_cursor)
--   end
-- })
