-- change <leader> to backslash
vim.g.mapleader = "\\"
vim.g.maplocalleader = "\\"

-- configuration for vimtex
vim.g.vimtex_view_method = 'zathura_simple'


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

