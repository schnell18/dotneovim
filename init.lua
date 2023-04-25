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
require("barbar")

require("nvimcmp")

require("gitsignscnf")

--Debugging
require("debug.all")

--NOTE: If barbar's option dict isn't created yet, create it
cmd([[
    let bufferline = get(g:, 'bufferline', {})
    " Enable/disable auto-hiding the tab bar when there is a single buffer
    let bufferline.auto_hide = v:true
    " Enable/disable close button
    let bufferline.closable = v:true
    " Enables/disable clickable tabs
    let bufferline.clickable = v:true
]])

--startup screen configuration
cmd([[
let g:dashboard_default_executive ='telescope'

let g:dashboard_custom_header = [
\ '                                                       ',
\ '                                                       ',
\ ' ██╗   ██╗ ██████╗██╗      ██████╗ ██╗   ██╗██████╗ ',
\ ' ██║   ██║██╔════╝██║     ██╔═══██╗██║   ██║██╔══██╗',
\ ' ██║   ██║██║     ██║     ██║   ██║██║   ██║██║  ██║',
\ ' ██║   ██║██║     ██║     ██║   ██║██║   ██║██║  ██║',
\ ' ╚██████╔╝╚██████╗███████╗╚██████╔╝╚██████╔╝██████╔╝',
\ '  ╚═════╝  ╚═════╝╚══════╝ ╚═════╝  ╚═════╝ ╚═════╝ ',
\ '                                                       ',
\ '                                                       ',
\]

let g:dashboard_custom_shortcut={
\ 'new_file'           : 'leader c n',
\ 'last_session'       : 'leader s l',
\ 'find_history'       : 'leader f h',
\ 'find_file'          : 'leader f f',
\ 'change_colorscheme' : 'leader t c',
\ 'find_word'          : 'leader f g',
\ 'book_marks'         : 'leader f b',
\ }

]])

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

cmd([[ autocmd BufWritePre *.go lua vim.lsp.buf.formatting() ]])
cmd([[ autocmd BufWritePre *.go lua require("lspgopls").goimports(1000) ]])

require("troublecnf")

--nvim-tree
require("nvimtreecnf")

require("keymaps")

-- Try to install new plugin
-- autocmd VimEnter * PlugInstall

