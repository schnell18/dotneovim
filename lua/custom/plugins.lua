local plugins = {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "delve",
        "gofumpt",
        "goimports",
        "goimports-reviser",
        "golines",
        "gomodifytags",
        "gopls",
        "gotests",
        "gotestsum",
        "texlab",
        "lua-language-server",
        "json-lsp",
      },
    }
  },
  {
    "lervag/vimtex",
    lazy = false,
    -- opts = {
    --   vimtex_view_method = 'zathura',
    --   vimtex_view_general_viewer = 'zathura',
    -- }
  },
  {
    "mfussenegger/nvim-dap",
    init = function ()
      require("core.utils").load_mappings("dap")
      vim.fn.sign_define('DapBreakpoint', {text='🛑', texthl='', linehl='', numhl=''})
    end
  },
  {
    "leoluz/nvim-dap-go",
    ft = "go",
    dependencies = "mfussenegger/nvim-dap",
    config = function(_, opts)
      require("dap-go").setup(opts)
      require("core.utils").load_mappings("dap_go")
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function ()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    ft = "go",
    opts = function ()
      return require("custom.configs.null-ls")
    end

  },
  {
    "olexsmir/gopher.nvim",
    ft = "go",
    config = function(_, opts)
      require("gopher").setup(opts)
      require("core.utils").load_mappings("gopher")
    end,
    build = function()
      vim.cmd [[silent! GoInstallDeps]]
    end
  },
  {
    "yanskun/gotests.nvim",
    ft = "go",
    config = function()
      require("gotests").setup()
      require("core.utils").load_mappings("gotests")
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        -- defaults
        "vim",
        "lua",
        "python",

        -- web dev
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "json",
        -- "vue", "svelte",

       -- low level
        "c",
        "go"
      },
    },
  },
  {
    -- column-wise alignment
    'junegunn/vim-easy-align',
    lazy = false
  }
}

vim.api.nvim_set_hl(0, "TelescopeBorder", {bg="#3B4252"})
vim.api.nvim_set_hl(0, "TelescopePromptBorder", {bg="#3B4252"})
vim.api.nvim_set_hl(0, "TelescopeResultsBorder", {bg="#3B4252"})
vim.api.nvim_set_hl(0, "TelescopePreviewBorder", {bg="#3B4252"})
vim.api.nvim_set_hl(0, "TelescopeResultsTitle", {bg="#3B4252", fg="#5E81AC"})
vim.api.nvim_set_hl(0, "TelescopePromptTitle", {bg="#3B4252", fg="#5E81AC"})
vim.api.nvim_set_hl(0, "TelescopePreviewTitle", {bg="#3B4252", fg="#5E81AC"})

return plugins
