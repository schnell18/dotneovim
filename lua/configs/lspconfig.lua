-- EXAMPLE
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local util = require "lspconfig/util"

-- list of all servers configured.
lspconfig.servers = {
  "lua_ls",
  "ts_ls",
  "pylsp",
  "gopls",
  "texlab",
}

-- list of servers configured with default config.
local default_servers = {
  "ts_ls",
}

-- lsps with default config
for _, lsp in ipairs(default_servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

lspconfig.texlab.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "texlab" },
  filetypes = { "tex", "plaintex", "bib" },
  root_dir = function(fname)
    return util.root_pattern ".latexmkrc"(fname) or util.find_git_ancestor(fname)
  end,
  single_file_support = true,
}

lspconfig.pylsp.setup {
  on_attach = on_attach,
  capabilities = capabilities,
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
}

-- lspconfig.r_language_server.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
--   settings = {
--     pylsp = {
--       plugins = {
--         pycodestyle = {
--           ignore = "W391",
--           maxLineLength = 100,
--         },
--       },
--     },
--   },
-- }

lspconfig.gopls.setup {
  on_attach = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
    on_attach(client, bufnr)
  end,
  on_init = on_init,
  capabilities = capabilities,
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gotmpl", "gowork" },
  root_dir = lspconfig.util.root_pattern("go.work", "go.mod", ".git"),
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
}
