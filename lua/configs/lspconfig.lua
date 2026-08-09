-- on_attach, on_init and capabilities are applied globally by
-- require("nvchad.configs.lspconfig").defaults(), which runs just before this
-- file (see lua/plugins/init.lua). Only per-server overrides belong here.
-- cmd / filetypes / root_markers come from the lsp/<server>.lua files shipped
-- by nvim-lspconfig, so only spell out what differs.

vim.lsp.config("texlab", {
  root_markers = { ".latexmkrc", ".git" },
})

vim.lsp.config("pylsp", {
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = {
          ignore = "W391",
          maxLineLength = 100,
        },
      },
    },
  },
})

vim.lsp.config("gopls", {
  -- go formatting is handled by conform.nvim, see configs/conform.lua
  on_attach = function(client, _)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
  end,
  root_markers = { "go.work", "go.mod", ".git" },
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      completeUnimported = true,
      usePlaceholders = true,
      staticcheck = true,
    },
  },
})

-- merges over the lua_ls config set up by nvchad's defaults()
vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using
        -- (most likely LuaJIT in the case of Neovim)
        version = "LuaJIT",
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {
          "vim",
          "require",
        },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
})

vim.lsp.enable(require("configs.servers"))
