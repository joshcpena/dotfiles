return {
    "stevearc/conform.nvim",
    opts = {
        --log_level = vim.log.levels.DEBUG,
        default_format_opts = {
            timeout_ms = 3000,
            async = true, -- not recommended to change
            quiet = false, -- not recommended to change
            lsp_format = "fallback", --"fallback", -- not recommended to change
            stop_after_first = true,
        },
        formatters_by_ft = {
            lua = { "stylua" },
            fish = { "fish_indent" },
            sh = { "shfmt" },
            typescript = { "prettierd" },
            javascript = { "prettierd" },
            typescriptreact = { "prettierd" },
            html = { "prettierd" },
            cs = { "csharpier" },
            vue = { "prettierd" },
        },
        formatters = {
            biome = {
                require_cwd = true,
            },
            csharpier = {
                inherit = false,
                command = "csharpier",
                args = { "format", "--write-stdout" },
                to_stdin = true,
            },
            prettierd = {
                inherit = false,
                command = "prettierd",
                stdin = true,
                args = { "--stdin-filepath", "$FILENAME" },
            },
        },
    },
}
