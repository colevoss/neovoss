local M = {}

-- context_commentstring nvim-treesitter module is deprecated,
-- use use require('ts_context_commentstring').setup {} and set vim.g.skip_ts_context_commentstring_module = true to speed up loading instead.
-- This feature will be removed in ts_context_commentstring version in the future


function M.setup()
  local status_ok, comment = pcall(require, "Comment")
  if not status_ok then
    return
  end

  comment.setup({
    -- pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook()
  })
end

return M
