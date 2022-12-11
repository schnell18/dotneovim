require('telescope').load_extension('dap')
require("dapui").setup()
require("debug.go")
-- local map = function(type, key, value)
--   vim.api.nvim_buf_set_keymap(0, type, key, value, {noremap = true, silent = true});
-- end


vim.fn.sign_define('DapBreakpoint', {text='🛑', texthl='', linehl='', numhl=''})
-- nvim-dap-virtual-text: show virtual text for current frame
vim.g.dap_virtual_text = true

-- -- setup ultest for debug
-- require("ultest").setup({
--   builders = {
--     ['go#gotest'] = function (cmd)
--       local args = {}
--       for i = 3, #cmd - 1, 1 do
--         local arg = cmd[i]
--         if vim.startswith(arg, "-") then
--           -- Delve requires test flags be prefix with 'test.'
--           arg = "-test." .. string.sub(arg, 2)
--         end
--         args[#args + 1] = arg
--       end
--       return {
--         dap = {
--           type = "go",
--           request = "launch",
--           mode = "test",
--           program = "${fileDirname}",
--           dlvToolPath = vim.fn.exepath("dlv"),
--           args = args
--         },
--         parse_result = function(lines)
--           return lines[#lines] == "FAIL" and 1 or 0
--         end
--       }
--     end
--   }
-- })

-- setup nvim-dap-ui
-- map('n', '<Leader>du', '<Cmd>lua require("dapui").toggle()<CR>')
-- map('n', '<Leader>e', '<Cmd>lua require("dapui").eval()<CR>')
-- map('n', '<F5>', "<Cmd>lua require'dap'.continue()<CR>")
-- map('n', '<Leader>dd', "<Cmd>lua require('dap').continue()<CR>")
-- map('n', '<F10>', "<Cmd>lua require'dap'.step_over()<CR>")
-- map('n', '<F11>', "<Cmd>lua require'dap'.step_into()<CR>")
-- map('n', '<F12>', "<Cmd>lua require'dap'.step_out()<CR>")
-- map('n', '<Leader>b', "<Cmd>lua require'dap'.toggle_breakpoint()<CR>")
-- map('n', '<Leader>B', "<Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
-- map('n', '<Leader>lp', "<Cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>")
-- map('n', '<Leader>dr', "<Cmd>lua require'dap'.repl.open()<CR>")
-- map('n', '<Leader>dl', "<Cmd>lua require'dap'.repl.run_last()<CR>`")

-- nnoremap <silent> <Leader>dn :lua require('dap-python').test_method()<CR>
-- vnoremap <silent> <Leader>ds <ESC>:lua require('dap-python').debug_selection()<CR>


