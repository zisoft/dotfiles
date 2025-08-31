vim.pack.add({
  { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "master" },
})

local config = require("nvim-treesitter.configs")

config.setup({
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_reges_highlighting = false,
  },
  indent = { enable = true },
  ensure_installed = {
    "c",
    "cpp",
    "gitcommit",
    "gitignore",
    "lua",
    "markdown",
    "vim"
  },
})

vim.api.nvim_create_autocmd('PackChanged', {
  desc = "Handle nvim-treesitter updates",
  group = vim.api.nvim_create_augroup('nvim-treesitter-pack-changed-update-handler', { clear = true }),
  callback = function(event)
    if event.data.kind == 'update' and event.data.spec.name == 'nvim-treesitter' then
      ---@diagnostic disable-next-line: param-type-mismatch
      local ok = pcall(vim.cmd, 'TSUpdate')
      if ok then
        vim.notify('TSUpdate completed successfully!', vim.log.levels.INFO)
      else
        vim.notify('TSUpdate command failed!', vim.log.levels.WARN)
      end
    end
  end,
})

