---@diagnostic disable: undefined-global

vim.o.expandtab = true
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.shiftround = true
vim.o.number = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.filetype = "on"
vim.o.cursorline = true
vim.o.autoread = true
vim.o.signcolumn = "yes:1"
vim.o.clipboard = "unnamedplus"
vim.o.swapfile = false
vim.o.wrap = false
vim.o.termguicolors = true
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.relativenumber = true
vim.o.backup = false
vim.o.writebackup = false
vim.o.winborder = "rounded"
vim.o.sessionoptions = "buffers,curdir,folds,help,tabpages,winsize,winpos,localoptions"
vim.o.listchars = "eol:$"
-- vim.o.guicursor = "n-v-c:blink0"
vim.o.clipboard = "unnamedplus"

vim.g.mapleader = " "

vim.diagnostic.config({ virtual_text = true })

-- folding
vim.o.foldmethod = "indent"
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99

vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#737994" })
vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#737994" })

-- OSC 7: send CWD to terminal
local function emit_osc7()
  local cwd = vim.uv.cwd()
  if not cwd then
    return
  end
  local encoded = cwd:gsub("([^%w/%-%._~])", function(c)
    return string.format("%%%02X", string.byte(c))
  end)
  io.stdout:write(string.format("\027]7;file://%s%s\027\\", vim.uv.os_gethostname(), encoded))
end

vim.api.nvim_create_autocmd({ "DirChanged", "VimEnter" }, {
  callback = emit_osc7,
})

vim.api.nvim_create_autocmd("VimLeave", {
  callback = function()
    vim.fn.chdir(vim.env.HOME)
  end,
})

