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

set.list=true
set.listchars="eol:↵,trail:~,tab:>-,nbsp:␣"

-- neovim 0.7 global status line
set.laststatus=3

if vim.fn.has('termguicolors') == 1 then
  set.termguicolors = true
end

require('colorizer').setup(
    {'*';},
    {
        RGB      = true;
        RRGGBB   = true;
        names    = true;
        RRGGBBAA = true;
        rgb_fn   = true;
        hsl_fn   = true;
        css      = true;
        css_fn   = true;
    })
