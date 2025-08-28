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
    local js_based_languages = { "typescript", "javascript", "typescriptreact" }
    for _, language in ipairs(js_based_languages) do
      dap.configurations[language] = {
        -- {
        --   type = "pwa-node",
        --   request = "launch",
        --   name = "Launch file",
        --   program = "${file}",
        --   cwd = "${workspaceFolder}",
        -- },
        {
          type = "pwa-node",
          request = "attach",
          name = "Attach",
          processId = require("dap.utils").pick_process,
          cwd = "${workspaceFolder}",
        },
        {
          type = "pwa-node",
          request = "attach",
          name = "Auto Attach",
          cwd = vim.fn.getcwd(),
          protocol = "inspector",
        },

        -- {
        --   type = "pwa-chrome",
        --   request = "launch",
        --   name = 'Start Chrome with "localhost"',
        --   url = "http://localhost:3000",
        --   webRoot = "${workspaceFolder}",
        --   userDataDir = "${workspaceFolder}/.vscode/vscode-chrome-debug-userdatadir",
        -- },
      }
    end
  end,
}
