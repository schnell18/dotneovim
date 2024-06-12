-- EXAMPLE 
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = { "html", "cssls" }

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

-- typescript
lspconfig.tsserver.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}

local util = require("lspconfig/util")

lspconfig.texlab.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { 'texlab' },
  filetypes = { 'tex', 'plaintex', 'bib' },
  root_dir = function(fname)
    return util.root_pattern '.latexmkrc'(fname) or util.find_git_ancestor(fname)
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
          ignore = 'W391',
          maxLineLength = 100
        },
      }
    }
  }
}

