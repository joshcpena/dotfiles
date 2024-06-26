return {
  "Microsoft/vscode-cpptools",
  config = function()
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
            "${command:cmake.launchTargetPath}",
            vim.fn.getcwd() .. "/build/src/applications/simple-dla-app/simple-dla-app",
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
    }
    dap.configurations.c = dap.configurations.cpp
  end,
}
