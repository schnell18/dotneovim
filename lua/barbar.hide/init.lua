local map = function(type, key, value)
  vim.api.nvim_buf_set_keymap(0, type, key, value, {noremap = true, silent = true});
end

-- Move to previous/next
map('n', '<A-,>', ':BufferPrevious<CR>')
map('n', '<A-.>', ':BufferNext<CR>')
map('n', '<A-<>', ':BufferMovePrevious<CR>')
map('n', '<A->>', ':BufferMoveNext<CR>')
map('n', '<A->>', ':BufferMoveNext<CR>')
map('n', '<A-1>', ':BufferGoto 1<CR>')
map('n', '<A-2>', ':BufferGoto 2<CR>')
map('n', '<A-3>', ':BufferGoto 3<CR>')
map('n', '<A-4>', ':BufferGoto 4<CR>')
map('n', '<A-5>', ':BufferGoto 5<CR>')
map('n', '<A-6>', ':BufferGoto 6<CR>')
map('n', '<A-7>', ':BufferGoto 7<CR>')
map('n', '<A-8>', ':BufferGoto 8<CR>')
map('n', '<A-9>', ':BufferGoto 9<CR>')
map('n', '<A-p>', ':BufferPin<CR>')
map('n', '<A-c>', ':BufferClose<CR>')
map('n', '<C-s>', ':BufferPick<CR>')
map('n', '<Space>bb', ':BufferOrderByBufferNumber<CR>')
map('n', '<Space>bd', ':BufferOrderByDirectory<CR>')
map('n', '<Space>bl', ':BufferOrderByLanguage<CR>')
map('n', '<Space>bw', ':BufferOrderByWindowNumber<CR>')

-- Wipeout buffer
--                          :BufferWipeout<CR>
-- Close commands
--                          :BufferCloseAllButCurrent<CR>
--                          :BufferCloseAllButPinned<CR>
--                          :BufferCloseBuffersLeft<CR>
--                          :BufferCloseBuffersRight<CR>
-- Magic buffer-picking mode
--
-- Other:
-- :BarbarEnable - enables barbar (enabled by default)
-- :BarbarDisable - very bad command, should never be used
