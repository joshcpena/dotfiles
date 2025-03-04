return {
  "rcarriga/nvim-notify",
  keys = {
    {
      "<leader>un",
      function()
        require("notify").dismiss({ silent = true, pending = true })
      end,
      desc = "Dismiss All Notifications",
    },
  },
  opts = {
    render = "wrapped-compact",
    stages = "static",
    top_down = true,
    timeout = 3000,
    max_height = function()
      return math.floor(vim.o.lines * 0.25)
    end,
    max_width = function()
      return math.floor(vim.o.columns * 0.25)
    end,
    on_open = function(win)
      vim.api.nvim_win_set_config(win, { zindex = 100 })
    end,
  },
  init = function()
    -- when noice is not enabled, install notify on VeryLazy
    if not LazyVim.has("noice.nvim") then
      LazyVim.on_very_lazy(function()
        vim.notify = require("notify")
      end)
    end
  end,
}
