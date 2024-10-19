return {
  "colevoss/nvimpire",

  priority = 1000,

  config = function()
    require("nvimpire").setup({ transparent = true })

    vim.cmd([[colorscheme nvimpire]])
  end
}
