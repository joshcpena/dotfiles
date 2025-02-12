return {
  "stevearc/conform.nvim",
  opts = {
    default_format_opts = {
      timeout_ms = 1000,
      async = false, -- not recommended to change
      quiet = false, -- not recommended to change
      lsp_format = "fallback", -- not recommended to change
      stop_after_first = true,
    },

    formatters_by_ft = {
      ["astro"] = { "prettierd" },
      ["javascript"] = { "prettierd" },
      ["javascriptreact"] = { "prettierd" },
      ["typescript"] = { "prettierd" },
      ["typescriptreact"] = { "prettierd" },
      ["vue"] = { "prettierd" },
      ["css"] = { "prettierd" },
      ["scss"] = { "prettierd" },
      ["less"] = { "prettierd" },
      ["html"] = { "prettierd" },
      ["json"] = { "prettierd" },
      ["jsonc"] = { "prettierd" },
      ["yaml"] = { "prettierd" },
      ["markdown"] = { "prettierd" },
      ["markdown.mdx"] = { "prettierd" },
      ["graphql"] = { "prettierd" },
      ["handlebars"] = { "prettierd" },
      ["sql"] = { "sql_formatter" },
    },
  },
}
