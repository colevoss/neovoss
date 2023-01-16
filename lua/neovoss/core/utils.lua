local M = {}

M.keymap = vim.keymap.set

function M.nmap(seq, replace_seq, desc, silent)
  M.keymap("n", seq, replace_seq, {
    desc = desc,
    silent = silent,
  })
end

function M.vmap(seq, replace_seq, desc, silent)
  M.keymap("v", seq, replace_seq, {
    desc = desc,
    silent = silent,
  })
end

function M.load_config(configs)
  for _, to_load in ipairs(configs) do
    to_load = 'neovoss.' .. to_load

    local status_ok, loaded = pcall(require, to_load)

    if not status_ok then
      vim.api.nvim_err_writeln("Could not load " .. to_load .. "\n" .. loaded)
    else
      loaded.setup()
    end
  end
end

return M
