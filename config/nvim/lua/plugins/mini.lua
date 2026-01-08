vim.pack.add({
  { src = "https://github.com/echasnovski/mini.ai" },
  { src = "https://github.com/echasnovski/mini.surround" },
  { src = "https://github.com/echasnovski/mini.icons" },
  { src = "https://github.com/echasnovski/mini.statusline" },
})

require("mini.ai").setup()
require("mini.surround").setup()
require("mini.icons").setup()

-- statusline
local MiniStatusline = require("mini.statusline")

local statusline = function()
  local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
  local git           = MiniStatusline.section_git({ trunc_width = 40 })
  local diff          = MiniStatusline.section_diff({ trunc_width = 75 })
  local filename      = MiniStatusline.section_filename({ trunc_width = 140 })
  local fileinfo      = MiniStatusline.section_fileinfo({ trunc_width = 40 })
  -- local location      = MiniStatusline.section_location({ trunc_width = 1000 })
  local location      = '%l│%2v (%P)'

  -- cut off file size from fileinfo, don't need it
  local last_space = fileinfo:match(".*()%s+")
  if last_space then
    fileinfo = fileinfo:sub(1, last_space - 1)
  end

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

