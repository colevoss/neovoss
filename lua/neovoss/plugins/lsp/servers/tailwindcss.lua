local function setup_tailwind(base)
  return {
    filetypes = { "templ", "astro", "javascript", "typescript", "react", "svelte", "typescriptreact" },
    init_options = { userLanguages = { templ = "html" } },

    capabilities = base.capabilities,

    on_attach = function(client, bufnr)
      base.on_attach(client, bufnr)
      require("tailwindcss-colors").buf_attach(bufnr)
    end
  }
end

return setup_tailwind
