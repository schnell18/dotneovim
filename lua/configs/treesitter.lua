local options = {
  ensure_installed = {
    "bash",
    "css",
    "dap_repl",
    "html",
    "javascript",
    "lua",
    "luadoc",
    "markdown",
    "perl",
    "printf",
    "python",
    "sql",
    "toml",
    "typescript",
    "vim",
    "vimdoc",
    "yaml",
    "go",
    "gomod",
    "gosum",
    "gotmpl",
    "gowork",
  },
  highlight = {
    enable = true,
    use_languagetree = true,
  },

  indent = { enable = true },
}

require("nvim-treesitter.configs").setup(options)
