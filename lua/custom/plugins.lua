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
      },
    }
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
}
return plugins
