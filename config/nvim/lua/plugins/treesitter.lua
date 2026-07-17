vim.pack.add {
  { src = "https://github.com/romus204/tree-sitter-manager.nvim" }
}

require("tree-sitter-manager").setup({
  auto_install = true,

  -- Use built-in Neovim treesitter parsers
  noauto_install = {
    "lua", "markdown", "markdown_inline", "query", "vim", "vimdoc"
  },

  ensure_installed = {
    "cpp",
    "css",
    "ecma",
    "git_config",
    "gitcommit",
    "gitignore",
    "html",
    "html_tags",
    "javascript",
    "json",
    "jsx",
    "python",
    "scss",
    "swift",
    "tmux",
    "toml",
    "twig",
    "typescript",
    "yaml"
  }
})
