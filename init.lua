local cmd = vim.cmd
local utils = require("utils")

require("options")
require("plugins")

--treesitter
require("treesitter")

--which key
require("whichkey")

--todo comments
require("todo")

--LSP
require("lspcommon")

-- require("navigatorcnf")
require("eviline")
-- require("barbar").setup{
--   auto_hide = true,
--   clickable = true,
--   closable = true,
-- }

require("nvimcmp")

require("gitsignscnf")

--Debugging
require("debug.all")

--startup screen configuration
require("dashboard").setup({
  theme = 'doom',
  config = {
    header = {
      '                                                    ',
      '                                                    ',
      '                                                    ',
      '                                                    ',
      '                                                    ',
      '                                                    ',
      ' ██╗   ██╗ ██████╗██╗      ██████╗ ██╗   ██╗██████╗ ',
      ' ██║   ██║██╔════╝██║     ██╔═══██╗██║   ██║██╔══██╗',
      ' ██║   ██║██║     ██║     ██║   ██║██║   ██║██║  ██║',
      ' ██║   ██║██║     ██║     ██║   ██║██║   ██║██║  ██║',
      ' ╚██████╔╝╚██████╗███████╗╚██████╔╝╚██████╔╝██████╔╝',
      '  ╚═════╝  ╚═════╝╚══════╝ ╚═════╝  ╚═════╝ ╚═════╝ ',
      '                                                    ',
      '                                                    ',
      '                                                    ',
    },
    center = {
      {
        icon = ' ',
        icon_hl = 'Title',
        desc = 'Find File           ',
        desc_hl = 'String',
        key = 'b',
        keymap = 'SPC f f',
        key_hl = 'Number',
        action = 'Telescope find_files'
      },
      {
        icon = ' ',
        desc = 'Git Status',
        key = 's',
        keymap = 'SPC f s',
        action = 'Telescope git_status'
      },
      {
        icon = ' ',
        desc = 'New File',
        key = 'n',
        keymap = 'SPC f n',
        action = 'buffer'
      },
      {
        icon = ' ',
        desc = 'Last Session',
        key = 'l',
        keymap = 'SPC f l',
        action = 'Telescope last_session'
      },
      {
        icon = ' ',
        desc = 'Search',
        key = 'g',
        keymap = 'SPC f g',
        action = 'Telescope live_grep'
      },
    },
    footer = {}  --your footer
  }

})

cmd([[
    let g:edge_style = 'aura'
    let g:edge_enable_italic = 1
    let g:edge_disable_italic_comment = 1
    colorscheme edge
]])

cmd([[ syntax enable ]])
cmd([[ filetype plugin indent on ]])


--Automatically install missing plugins on startup
cmd([[ 
    autocmd VimEnter *
      \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
      \|   PlugInstall --sync | q
      \| endif
]])

utils.create_augroup({
    {'TextYankPost', '*', [[ silent! lua require('vim.highlight').on_yank() ]]},
}, 'highlight_yank')

utils.create_augroup({
    {'BufWritePre', '/tmp/*', 'setlocal noundofile'},
}, 'vimrc')

utils.create_augroup({
    {'BufWritePre', '*.markdown,*.md', 'call PanGuSpacing()'},
    {'BufWritePre', '*.text,*.txt,*.wiki,*.cnx', 'call PanGuSpacing()'},
}, 'Chinese')

utils.create_augroup({
    {'BufReadPre', '*.class', 'let &bin=1'},
    {'BufReadPost', '*.class', 'if &bin | %!xxd'},
    {'BufReadPost', '*.class', 'set ft=xxd | endif'},
    {'BufWritePre', '*.class', 'if &bin | %!xxd -r'},
    {'BufWritePre', '*.class', 'endif'},
    {'BufWritePost', '*.class', 'if &bin | %!xxd'},
    {'BufWritePost', '*.class', 'set nomod | endif'},
}, 'Binary')

-- utils.create_augroup({
--     {'BufEnter', '*', [[ let g:completion_trigger_character = ['.'] ]]},
--     {'BufEnter', '*.c,*.cpp', [[ let g:completion_trigger_character = ['.', '::'] ]]},
-- }, 'CompletionTriggerCharacter')

cmd([[ autocmd BufWritePre *.go lua vim.lsp.buf.format() ]])
cmd([[ autocmd BufWritePre *.go lua require("lspgopls").goimports(1000) ]])

require("troublecnf")

--nvim-tree
require("nvimtreecnf")

require("keymaps")

-- Try to install new plugin
-- autocmd VimEnter * PlugInstall

