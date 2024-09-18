local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "ruff_fix", "ruff_organize_imports", "ruff_format" },
    -- r = { "styler" },
    -- css = { "prettier" },
    -- html = { "prettier" },
  },

  format_on_save = function(bufnr)
    -- Disable format-on-save w/ git projects with a .no-fmt-on-save file
    -- under project root directory
    local root_patterns = { ".git" }
    local root_dir =
      vim.fs.dirname(vim.fs.find(root_patterns, { upward = true })[1])
    local exists = root_dir
      and vim.fn.filereadable(vim.fs.joinpath(root_dir, ".no-fmt-on-save"))
    if exists == 1 then
      return false
    end
    return {
      -- These options will be passed to conform.format()
      timeout_ms = 2000,
      lsp_fallback = true,
    }
  end,
}

require("conform").setup(options)
