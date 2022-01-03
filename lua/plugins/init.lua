local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')

-- Sensible default
Plug 'tpope/vim-sensible'

-- Color schemes
Plug 'sainnhe/edge'

-- LSP
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
-- Plug 'kabouzeid/nvim-lspinstall'
Plug 'nvim-lua/completion-nvim'

-- Code snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

-- Fuzzy finder
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

-- Syntax
Plug('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})
Plug 'nvim-treesitter/playground'

-- File explorer
-- for file icons
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'

-- Status line
Plug 'glepnir/galaxyline.nvim'

-- Debugging
Plug 'nvim-telescope/telescope-dap.nvim'
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'
Plug 'theHamsta/nvim-dap-virtual-text'
Plug 'mfussenegger/nvim-dap-python'

-- Github integration
Plug 'pwntester/octo.nvim'

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'godlygeek/tabular'
Plug 'hotoo/pangu.vim'
-- Java JDT Language Server
-- Plug 'mfussenegger/nvim-jdtls'

-- startup screen
Plug 'glepnir/dashboard-nvim'

Plug 'folke/which-key.nvim'

-- powerful tab
Plug 'romgrk/barbar.nvim'

Plug 'folke/todo-comments.nvim'
Plug 'folke/trouble.nvim'

Plug('ray-x/guihua.lua', { ['do'] = 'cd lua/fzy && make' })
Plug 'ray-x/navigator.lua'
Plug 'onsails/lspkind-nvim'

Plug 'hashivim/vim-terraform'
-- unit test
Plug 'vim-test/vim-test'
Plug('rcarriga/vim-ultest', { ['do'] = ':UpdateRemotePlugins' })
-- for test result output
Plug 'preservim/vimux'
-- for database access
Plug 'vim-scripts/dbext.vim'

vim.call('plug#end')

