
-- require('navigator').setup()

require('navigator').setup({
  debug            = false,
  code_action_icon = " ",
  width            = 0.75,
  height           = 0.3,
  preview_height   = 0.35,
  border           = {"╭", "─", "╮", "│", "╯", "─", "╰", "│"},

  default_mapping = true,
  keymaps = {{key = "gK", func = "declaration()"}},
  treesitter_analysis = true,
  code_action_prompt = {
      enable        = true,
      sign          = true,
      sign_priority = 40,
      virtual_text  = true
  },
  icons = {
    code_action_icon           = " ",
    diagnostic_head            = '🐛',
    diagnostic_head_severity_1 = "🈲",
  },
  lspinstall = false,

  lsp = {
    format_on_save = true,
    -- diag_scroll_bar_sign = nil,

    disply_diagnostic_qf = true,
  }
})
