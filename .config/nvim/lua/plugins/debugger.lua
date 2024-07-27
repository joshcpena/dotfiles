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
        stopAtEntry = false,
        cwd = "${workspaceFolder}",
        program = function()
          if vim.fn.confirm("Should I Run", "&yes\n&no", 2) == 1 then
            local cmd = "ROSETTA_DEBUGSERVER_PORT=1234 "
              .. vim.fn.getcwd()
              .. "/build/Debug/src/applications/tce-service/tce_service & echo Started binary"
            print("")
            print("Starting " .. cmd)
            local f = vim.fn.jobstart(cmd)
            if f == 0 then
              print("\nBuild: ✔️ ")
            else
              print("\nBuild: ❌ (code: " .. f .. ")")
            end
          end

          return vim.fn.input(
            "Select Build Exec",
            vim.fn.getcwd() .. "/build/Debug/src/applications/tce-service/tce_service",
            "file"
          )
        end,
        setupCommands = {
          {
            text = "-enable-pretty-printing",
            description = "enable pretty printing",
            ignoreFailures = false,
          },
          {
            text = "set architecture i386:x86-64",
            description = "correct rosetta architecture",
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
