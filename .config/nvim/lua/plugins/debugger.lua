return {
  "mfussenegger/nvim-dap",
  opts = function()
    local dap = require("dap")
    dap.configurations.cpp = {
      {
        name = "GDB Remote",
        type = "cppdbg",
        request = "launch",
        MIMode = "gdb",
        miDebuggerServerAddress = "localhost:1234",
        miDebuggerPath = "/usr/bin/gdb",
        stopAtEntry = true,
        cwd = "${workspaceFolder}",
        program = function()
          return vim.fn.input(
            "Select Build Exec",
            vim.fn.getcwd() .. "/build/src/applications/tce-service/tce_service",
            "file"
          )
        end,
        setupCommands = {
          {
            text = "-enable-pretty-printing",
            description = "enable pretty printing",
            ignoreFailures = false,
          },
        },
      },
      {
        name = "Code lldb launch",
        type = "codelldb",
        request = "launch",
        program = function()
          return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = true,
      },
    }
    dap.configurations.c = dap.configurations.cpp
  end,
}
