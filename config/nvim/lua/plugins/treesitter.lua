-- queries can be downloaded at https://github.com/nvim-treesitter/nvim-treesitter/tree/main/runtime/queries
-- and need to be copied to ~/.local/share/nvim/site/queries/
--
-- parsers can be found at https://github.com/orgs/tree-sitter/repositories?type=all
-- clone the repo for the language and build the parser with `tree-sitter build`, then
-- copy the shared library to ~/.local/share/nvim/site/parser/

vim.api.nvim_create_autocmd("FileType", {
  callback = function(args)
    local bufnr = args.buf
    local ft = vim.bo[bufnr].filetype

    if ft == "" or vim.bo[bufnr].buftype == "nofile" then
      return
    end

    pcall(vim.treesitter.start, bufnr)
  end,
})

