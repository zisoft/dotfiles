vim.pack.add({
  { src = "https://github.com/echasnovski/mini.surround" },
  { src = "https://github.com/echasnovski/mini.icons" },
  { src = "https://github.com/echasnovski/mini.align" },
  { src = "https://github.com/echasnovski/mini.statusline" },
})

require("mini.surround").setup()
require("mini.icons").setup()
require("mini.align").setup()

-- statusline
local MiniStatusline = require("mini.statusline")

-- Shortens every directory in the path to its first letter (plus "." if
-- hidden), but keeps the filename fully intact.
-- Example: ./.config/nvim/lua/plugins/mini.lua -> ./.c/n/l/p/mini.lua
--
-- max_len: the length (in characters) above which shortening kicks in. If the
-- path is shorter, it is returned unchanged. Default: 40.
local function shorten_path(path, max_len)
  max_len = max_len or 40
  if #path <= max_len then
    return path
  end

  local leading_slash = path:sub(1, 1) == "/" and "/" or ""

  local parts = {}
  for segment in path:gmatch("[^/\\]+") do
    table.insert(parts, segment)
  end

  if #parts == 0 then
    return path
  end

  local result = {}
  for i, part in ipairs(parts) do
    if i == #parts then
      -- last part = filename, keep it unchanged
      table.insert(result, part)
    else
      -- directory: keep first letter, "." for hidden directories
      if part:sub(1, 1) == "." and #part > 1 then
        table.insert(result, "." .. part:sub(2, 2))
      elseif #part >= 1 then
        table.insert(result, part:sub(1, 1))
      end
    end
  end

  return leading_slash .. table.concat(result, "/")
end

local statusline = function()
  local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
  -- window < 80 cols => section_git returns '' (git disappears entirely)
  local git           = MiniStatusline.section_git({ trunc_width = 120 })
  local diff          = MiniStatusline.section_diff({ trunc_width = 75 })
  local fileinfo      = MiniStatusline.section_fileinfo({ trunc_width = 100 })
  -- local location      = MiniStatusline.section_location({ trunc_width = 1000 })
  local location      = '%l│%2v (%P)'

  local tab_icon = "󰌒 "
  local width = vim.bo.tabstop
  if vim.bo.expandtab then
    tab_icon = "󱁐 "
    width = vim.bo.shiftwidth
  end
  local indent = tab_icon .. width

  -- Same width heuristic as all other sections (is_truncated): only
  -- shorten the path in narrow windows, otherwise give it plenty of room.
  -- Keep the threshold in sync with section_git's trunc_width.
  local max_len = MiniStatusline.is_truncated(120) and 20 or 45

  local filename = shorten_path(vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ':~'), max_len)

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
