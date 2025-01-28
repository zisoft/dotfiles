local opts = {
  expandtab = true,
  tabstop = 2,
  softtabstop = 2,
  shiftwidth = 2,
  number = true,
  ignorecase = true,
  smartcase = true,
}

-- Set options from table
for opt, val in pairs(opts) do
  vim.o[opt] = val
end

vim.g.mapleader = " "

