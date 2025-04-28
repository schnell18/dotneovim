return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    config = function()
      require("configs.conform")
    end,
  },
  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("configs.lint")
    end,
  },
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require("configs.lspconfig")
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-lspconfig" },
    config = function()
      require("configs.mason-lspconfig")
    end,
  },
  {
    "schnell18/mason-nvim-lint",
    event = "VeryLazy",
    dependencies = { "nvim-lint" },
    config = function()
      require("configs.mason-lint")
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "delve",
        "gofumpt",
        "goimports",
        "goimports-reviser",
        "golines",
        "gomodifytags",
        "gotests",
        "gotestsum",
        "ruff",
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("configs.treesitter")
    end,
  },
  {
    "lervag/vimtex",
    -- lazy = false,
    tag = "v2.15",
    ft = { "tex" },
    init = function()
      -- setup bi-directory search with zathura is
      -- difficult, especially on MacOS as it requires
      -- dbus. We deprecate the this method in favor
      -- of TeXpresso which can do live preview
      -- vim.g.vimtex_view_method = 'zathura'
      -- vim.g.vimtex_view_general_viewer = 'zathura'
    end,
  },

  {
    "let-def/texpresso.vim",
    -- lazy = false,
    ft = { "tex" },
  },
  {
    "mfussenegger/nvim-dap",
    config = function()
      require("configs.dap")
    end,
  },
  { "rcarriga/nvim-dap-ui", dependencies = { "mfussenegger/nvim-dap" } },
  { "theHamsta/nvim-dap-virtual-text" },
  { "nvim-telescope/telescope-dap.nvim" },
  { "LiadOz/nvim-dap-repl-highlights" },
  { "nvim-neotest/nvim-nio" },
  { "lewis6991/gitsigns.nvim" },
  {
    "leoluz/nvim-dap-go",
    ft = { "go" },
    config = function()
      require("configs.dapgo")
    end,
  },
  -- unit test related plugins
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("configs.neotest")
    end,
  },
  { "nvim-neotest/neotest-python" },

  -- AI plugins
  -- {
  --   "github/copilot.vim",
  --   lazy = false,
  --   event = { "BufEnter" },
  -- },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
      { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
    },
    build = "make tiktoken", -- Only on MacOS or Linux
    opts = {
      debug = false,
      window = {
        width = 0.25,
      },
    },
    keys = {
      {
        "<Leader>ac",
        ":'<,'>CopilotChat<CR>",
        mode = { "v" },
        desc = "Copilot Chat Selection",
      },
      {
        "<Leader>ac",
        ":CopilotChatToggle<CR>",
        mode = { "n" },
        desc = "Toggle Copilot Chat",
      },
    },
  },
  -- {
  --   "Exafunction/windsurf.vim",
  --   event = "BufEnter",
  -- },

  -- Misc
  -- { "subnut/nvim-ghost.nvim", lazy = false },
}
