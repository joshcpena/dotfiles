return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/neotest-jest",
  },
  keys = {
    {
      "<leader>tm",
      function()
        require("neotest").summary.run_marked()
      end,
      desc = "Run marked",
    },
  },
  opts = {
    adapters = {
      ["neotest-jest"] = {
        jestCommand = "npm run test --",
        jestConfigFile = "jest.config.ts",
        -- env = { CI = true },
        cwd = function(path)
          return vim.fn.getcwd()
        end,
      },
    },
  },
}
