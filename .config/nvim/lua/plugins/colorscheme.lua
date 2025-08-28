return {
  -- Configure LazyVim to load  catppuccin
  {
    "EdenEast/nightfox.nvim",
    lazy = true,
    config = function()
      require("nightfox").setup({
        specs = {
          all = {
            syntax = {
              -- builtin0 = "pink.base",
            },
          },
        },
        options = {
          styles = {
            comments = "italic", -- Value is any valid attr-list value `:help attr-list`
            keywords = "bold",
            -- functions = "italic,bold",
            -- variables = "italic",
            -- types = "italic",
          },
        },
      })
    end,
  },
  { "zenbones-theme/zenbones.nvim", dependencies = "rktjmp/lush.nvim", lazy = true },
  { "rebelot/kanagawa.nvim", lazy = true },
  { "neanias/everforest-nvim", lazy = true },
  { "rose-pine/neovim", name = "rose-pine", lazy = true },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      styles = {
        comments = { "italic" }, -- Change the style of comments
        conditionals = { "bold" },
        loops = { "bold" },
        functions = {},
        keywords = { "bold" },
        strings = {},
        variables = {},
        numbers = {},
        booleans = { "bold" },
        properties = {},
        types = { "italic" },
        operators = { "bold" },
      },
      color_overrides = {
        macchiato = {
          maroon = "#ee9bb6",
          -- crust this is the dividor line between DBUI and the eidotr on the left
          mantle = "#232136", -- the sidebar bg
          base = "#292640", -- The editor bg 292640
          -- crust = "#535066",
          crust = "#232136",
        },
        mocha = {
          mantle = "#191726",
          crust = "#191726",
          base = "#232136",
        },
      },
      custom_highlights = {
        WinSeparator = { fg = "#918da8" },
      },
    },
  },
  { "talha-akram/noctis.nvim", lazy = true },
  {
    "folke/tokyonight.nvim",
    opts = {
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
      on_highlights = function(hl, c)
        hl.DiagnosticUnnecessary = {
          fg = c.comments,
        }
      end,
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      --colorscheme = "catppuccin-macchiato",
      colorscheme = "tokyonight-moon",
      -- colorscheme = "duskfox",
    },
  },
}
