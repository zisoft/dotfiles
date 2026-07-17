vim.pack.add({
  -- { src = "https://github.com/echasnovski/mini.ai" },
  { src = "https://github.com/echasnovski/mini.surround" },
  { src = "https://github.com/echasnovski/mini.icons" },
  { src = "https://github.com/echasnovski/mini.align" },
  { src = "https://github.com/echasnovski/mini.statusline" },
})

-- require("mini.ai").setup()
require("mini.surround").setup()
require("mini.icons").setup()
require("mini.align").setup()

-- statusline
local MiniStatusline = require("mini.statusline")

local statusline = function()
  local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
  local git           = MiniStatusline.section_git({ trunc_width = 40 })
  local diff          = MiniStatusline.section_diff({ trunc_width = 75 })
  local filename      = '%-20f %-0.4r'
  local fileinfo      = MiniStatusline.section_fileinfo({ trunc_width = 40 })
  -- local location      = MiniStatusline.section_location({ trunc_width = 1000 })
  local location      = '%l│%2v (%P)'

  local tab_icon = "󰌒 "
  local width = vim.bo.tabstop
  if vim.bo.expandtab then
    tab_icon = "󱁐 "
    width = vim.bo.shiftwidth
  end
  local indent = tab_icon .. width

  return MiniStatusline.combine_groups({
    { hl = mode_hl,                 strings = { mode } },
    { hl = 'MiniStatuslineDevinfo', strings = { git, diff } },
    '%<', -- Mark general truncate point
    { hl = 'MiniStatuslineFilename', strings = { filename } },
    '%=', -- End left alignment
    { hl = 'MiniStatuslineFileinfo', strings = { indent } },
    { hl = 'MiniStatuslineFileinfo', strings = { fileinfo } },
    { hl = 'MiniStatuslineFileinfo', strings = { location } },
  })
end

MiniStatusline.setup({
  content = {
    active = statusline,
    inactive = nil,
  },
  use_icons = true
})

