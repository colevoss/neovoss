local conditions = require('heirline.conditions')
local colors = require('nvimpire').colors
local helpers = require('neovoss.plugins.heirline.helpers')
local utils = require('heirline.utils')

local Ruler = {
  -- %l = current line number
  -- %L = number of lines in the buffer
  -- %c = column number
  -- %P = percentage through file of displayed window
  -- provider = "%7(%l/%L%) : %c %P",
  provider = "%7(%l/%L%) [%c] ",

  hl = {
    fg = colors.comment,
  }
}

local FileNameBlock = {
  init = function(self)
    self.filename = vim.api.nvim_buf_get_name(0)
  end,
}

local FileIcon = {
  init = function(self)
    local filename = self.filename
    local extension = vim.fn.fnamemodify(filename, ":e")
    self.icon, self.icon_color = require('nvim-web-devicons').get_icon_color(filename, extension, { default = true })
  end,

  provider = function(self)
    return self.icon and (self.icon .. " ")
  end,

  hl = function(self)
    return {
      fg = self.icon_color
    }
  end,

  condition = function(self)
    return self.filename ~= ""
  end
}

local FileName = {
  provider = function(self)
    local filename = vim.fn.fnamemodify(self.filename, ":.")
    if filename == "" then return "" end

    if not conditions.width_percent_below(#filename, 0.25) then
      filename = vim.fn.pathshorten(filename)
    end

    return filename
  end,

  hl = {
    fg = colors.comment,
  }
}

local FileNameModifer = {
  hl = function()
    if vim.bo.modified then
      -- use `force` because we need to override the child's hl foreground
      return { fg = colors.cyan, bold = true, force = true }
    end
  end,
}

FileNameBlock = utils.insert(FileNameBlock,
  FileIcon,
  utils.insert(FileNameModifer, FileName)
)

return {
  FileNameBlock,
  { provider = "%=" },

  helpers.Space(1),

  Ruler,

  helpers.Space(2),
}
