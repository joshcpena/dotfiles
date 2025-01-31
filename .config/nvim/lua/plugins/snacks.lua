return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    bigfile = { enabled = true },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    scroll = { enabled = false },
    statuscolumn = { enabled = true },
    words = { enabled = true },
    indent = { enabled = true, animate = { enabled = false } },
    dashboard = {
      row = 2,
      enabled = true,
      width = 70,
      sections = {
        {
          section = "terminal",
          cmd = "chafa ~/indg/tif_r.png --scale .6 --format symbols --symbols vhalf --center true --align top; sleep .1",
          height = 16,
          padding = 1,
        },
        { icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
        { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
        { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
        -- {
        --   icon = " ",
        --   title = "Git Status",
        --   section = "terminal",
        --   cmd = "hub status --short --branch --renames",
        --   height = 5,
        --   align = "center",
        --   -- ttl = 5 * 200,
        --   padding = 1,
        -- },
        -- {
        --   section = "terminal",
        --   cmd = "glab mr list",
        --   height = 5,
        --   align = "center",
        --   ttl = 4 * 60,
        -- },
        { section = "startup" },
      },
    },
  },
}
