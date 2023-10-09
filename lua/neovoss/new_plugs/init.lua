local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

print(lazypath)

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

local M = {}

local my_plugins = {
  "nvimpire",
  "treesitter",
  "lsp",
  "cmp",
  "neotree",
}

local load = function(plugins)
  loaded_plugins = {}

  for _, plugin in ipairs(plugins) do
    to_load = "neovoss.new_plugs." .. plugin

    local status_ok, loaded = pcall(require, to_load)

    if not status_ok then
      vim.api.nvim_err_writeln("Could not load " .. to_load .. "\n" .. loaded)
    else
      table.insert(loaded_plugins, loaded)
    end
  end

  return loaded_plugins
end

M.setup = function()
  -- require("lazy").setup(load(my_plugins))
  require("lazy").setup(require("neovoss.new_plugs.plugins"))
end

return M
