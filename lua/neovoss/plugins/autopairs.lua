return {
  "windwp/nvim-autopairs",

  opts = {
    check_ts = true,
    disable_filetype = { "TelescopePrompt" },

    ts_config = {
      lua = { 'string' },
      javascript = { 'template_string' }
    },
  },
}
