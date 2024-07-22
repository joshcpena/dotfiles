return {
  "neovim/nvim-lspconfig",
  opts = {
    diagnostics = {
      update_in_insert = true,
    },
    setup = {
      clangd = function(_, opts)
        opts.capabilities.offsetEncoding = { "utf-16" }
      end,
    },
  },
}
