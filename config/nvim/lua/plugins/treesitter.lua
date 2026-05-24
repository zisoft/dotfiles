local parsers = {
  "c",
  "cpp",
  "css",
  "gitcommit",
  "gitignore",
  "html",
  "javascript",
  "json",
  "lua",
  "markdown",
  "markdown_inline",
  "python",
  "query",
  "toml",
  "twig",
  "vim",
  "vimdoc",
  "yaml",
}

vim.pack.add({
  { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
})

local nvim_treesitter = require("nvim-treesitter")

nvim_treesitter.setup()

if vim.fn.executable("tree-sitter") == 1 then
  nvim_treesitter.install(parsers)
end

vim.api.nvim_create_autocmd("FileType", {
  desc = "Enable Tree-sitter highlighting and indentation",
  group = vim.api.nvim_create_augroup("nvim-treesitter-filetype-setup", { clear = true }),
  callback = function(args)
    local filetype = vim.bo[args.buf].filetype
    local lang = vim.treesitter.language.get_lang(filetype)

    if not lang then
      return
    end

    local ok = pcall(vim.treesitter.start, args.buf, lang)
    if not ok then
      return
    end

    local ok_query, query = pcall(vim.treesitter.query.get, lang, "indents")
    if ok_query and query then
      vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end
  end,
})

vim.api.nvim_create_autocmd("PackChanged", {
  desc = "Handle nvim-treesitter updates",
  group = vim.api.nvim_create_augroup("nvim-treesitter-pack-changed-update-handler", { clear = true }),
  callback = function(event)
    if event.data.kind == "update" and event.data.spec.name == "nvim-treesitter" then
      ---@diagnostic disable-next-line: param-type-mismatch
      local ok = pcall(vim.cmd, "TSUpdate")
      if ok then
        vim.notify("TSUpdate completed successfully!", vim.log.levels.INFO)
      else
        vim.notify("TSUpdate command failed!", vim.log.levels.WARN)
      end
    end
  end,
})

