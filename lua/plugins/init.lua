return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "stylua",
        -- "html-lsp",
        -- "css-lsp",
        -- "prettier",
        "python-lsp-server",
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
        "json-lsp",
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim", "lua", "vimdoc",
        "html", "css", "javascript", "typescript",
        "python", "bash", "perl",
        "sql"
      },
    },
  },

  {
    "lervag/vimtex",
    -- lazy = false,
    tag = 'v2.15',
    ft = { 'tex' },
    init = function()
      -- setup bi-directory search with zathura is
      -- difficult, especially on MacOS as it requires
      -- dbus. We deprecate the this method in favor
      -- of TeXpresso which can do live preview
      -- vim.g.vimtex_view_method = 'zathura'
      -- vim.g.vimtex_view_general_viewer = 'zathura'
    end
  },

  {
    "let-def/texpresso.vim",
    -- lazy = false,
    ft = { 'tex' },
  },
}
