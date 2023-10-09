require('neovoss.core.plugins')

local plugs = require('neovoss.new_plugs')

local utils = require('neovoss.core.utils')

local load = {
  'core.options',
  'core.mappings',
  'core.auto-commands',

  -- 'plugins'
  -- 'new_plugs'
}

utils.load_config(load)
plugs.setup()
