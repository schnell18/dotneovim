require("go").setup({
  goimport='gofumports', -- goimport command
  --gofmt = 'gofumpt', --gofmt cmd,
  max_line_len = 120, -- max line length in goline format
  tag_transform = false, -- tag_transfer  check gomodifytags for details
  test_template = '',
  test_template_dir = '', 
  comment_placeholder = '' ,
  verbose = true,  -- output loginf in messages
  lsp_cfg = true, -- true: apply go.nvim non-default gopls setup
  lsp_gofumpt = true, -- true: set default gofmt in gopls format to gofumpt
  lsp_on_attach = true, 
  gopls_cmd = {"/home/justin/go/bin/gopls", "-logfile", "/home/justin/.local/gopls.log" },
  lsp_diag_hdlr = true, -- hook lsp diag handler
  dap_debug = true, -- set to true to enable dap
  dap_debug_keymap = true, -- set keymaps for debugger
  dap_debug_gui = true, -- set to true to enable dap gui, highly recommand
  dap_debug_vt = true -- set to true to enable dap virtual text
})

-- key bindings
vim.cmd("autocmd FileType go nmap <Leader>gl GoLint")
vim.cmd("autocmd FileType go nmap <Leader>gc :lua require('go.comment').gen()")

