-- require('neovoss.core.plugins')

-- local utils = require('neovoss.core.utils')

-- local load = {
--   'core.options',
--   'core.mappings',
--   'core.auto-commands',

--   'plugins'
-- }

-- utils.load_config(load)

require('neovoss.core').setup()
require('neovoss.plugins').setup()
