return {
    "mfussenegger/nvim-dap",
    opts = function()
        local dap = require("dap")
        -- c# bullshit
        -- local netcore_path = vim.fn.stdpath("data") .. "/mason/bin/netcoredbg"
        -- local netcoredbg_adapter = {
        --   type = "executable",
        --   command = netcore_path,
        --   args = { "--interpreter=vscode" },
        -- }
        -- dap.adapters.netcoredbg = netcoredbg_adapter -- needed for normal debugging
        -- dap.adapters.coreclr = netcoredbg_adapter -- needed for unit test debugging
        -- dap.configurations.cs = {
        --   {
        --     type = "coreclr",
        --     name = "launch - netcoredbg",
        --     request = "launch",
        --     program = function()
        --       -- return vim.fn.input("Path to dll: ", vim.fn.getcwd() .. "/src/", "file")
        --       return vim.fn.input("Path to dll: ", vim.fn.getcwd() .. "/bin/Debug/net9.0/", "file")
        --     end,
        --   },
        -- }
        --
        -- local function get_plugin_directory()
        --   local str = debug.getinfo(1, "S").source:sub(2)
        --   str = str:match("(.*/)") -- Get the directory of the current file
        --   return str:gsub("/[^/]+/[^/]+/$", "/") -- Go up two directories
        -- end
        -- local plugin_directory = get_plugin_directory()
        -- local netcoredbg_path = plugin_directory .. "netcoredbg/netcoredbg"
        --
        -- local netcoredbg_path = vim.fn.stdpath("data") .. "/lazy/netcoredbg-macOS-arm64.nvim/netcoredbg/netcoredbg"
        -- dap.adapters.coreclr = {
        --   type = "executable",
        --   command = netcoredbg_path,
        --   args = { "--interpreter=vscode" },
        -- }
        -- local function dotnet_build_project()
        --   local default_path = vim.fn.getcwd() .. "/"
        --   if vim.g["dotnet_last_proj_path"] ~= nil then
        --     default_path = vim.g["dotnet_last_proj_path"]
        --   end
        --
        --   local path = vim.fn.input("Path to your *proj file", default_path, "file")
        --   vim.g["dotnet_last_proj_path"] = path
        --   local cmd = "dotnet build -c Debug " .. path .. " > /dev/null"
        --   print("")
        --   print("Cmd to execute: " .. cmd)
        --   local f = os.execute(cmd)
        --   if f == 0 then
        --     print("\nBuild: ✔️ ")
        --   else
        --     print("\nBuild: ❌ (code: " .. f .. ")")
        --   end
        -- end
        -- local function dotnet_get_dll_path()
        --   local request = function()
        --     return vim.fn.input("Path to dll", vim.fn.getcwd() .. "/bin/Debug/", "file")
        --   end
        --
        --   if vim.g["dotnet_last_dll_path"] == nil then
        --     vim.g["dotnet_last_dll_path"] = request()
        --   else
        --     if
        --       vim.fn.confirm("Do you want to change the path to dll?\n" .. vim.g["dotnet_last_dll_path"], "&yes\n&no", 2)
        --       == 1
        --     then
        --       vim.g["dotnet_last_dll_path"] = request()
        --     end
        --   end
        --
        --   return vim.g["dotnet_last_dll_path"]
        -- end
        --
        -- require("netcoredbg-macOS-arm64").setup(dap)
        -- dap.configurations.cs = {
        --   {
        --     type = "coreclr",
        --     name = "NetCoreDbg: Launch",
        --     request = "launch",
        --     cwd = "${fileDirname}",
        --     console = "integratedTerminal",
        --     program = function()
        --       if vim.fn.confirm("Should I recompile first?", "&yes\n&no", 2) == 1 then
        --         dotnet_build_project()
        --       end
        --
        --       return dotnet_get_dll_path()
        --     end,
        --     env = {
        --       ASPNETCORE_ENVIRONMENT = function()
        --         return vim.fn.input("Environment: ", "Development")
        --       end,
        --       ASPNETCORE_URL = function()
        --         return vim.fn.input("Endpoint: ", "http://localhost:8000")
        --       end,
        --     },
        --   },
        --   {
        --     type = "coreclr",
        --     name = "NetCoreDbg: Attach",
        --     request = "attach",
        --     processId = function()
        --       return vim.fn.input("Process Id: ")
        --     end,
        --   },
        -- }

        -- c# stuff
        --
        -- require("easy-dotnet.netcoredbg").register_dap_variables_viewer() -- special variables viewer specific for .NET
        --
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

        -- Setup adapters for browser stuff
        for _, adapterType in ipairs({ "node", "chrome", "msedge" }) do
            local pwaType = "pwa-" .. adapterType

            dap.adapters[pwaType] = {
                type = "server",
                host = "localhost",
                port = "${port}",
                executable = {
                    command = "node",
                    args = {
                        vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js",
                        "${port}",
                    },
                },
            }

            -- this allow us to handle launch.json configurations
            -- which specify type as "node" or "chrome" or "msedge"
            dap.adapters[adapterType] = function(cb, config)
                local nativeAdapter = dap.adapters[pwaType]

                config.type = pwaType

                if type(nativeAdapter) == "function" then
                    nativeAdapter(cb, config)
                else
                    cb(nativeAdapter)
                end
            end
        end

        local enter_launch_url = function()
            local co = coroutine.running()
            return coroutine.create(function()
                vim.ui.input(
                    { prompt = "Enter URL: ", default = "https://beta.bgov.com/federal-funding-flow" },
                    function(url)
                        if url == nil or url == "" then
                            return
                        else
                            coroutine.resume(co, url)
                        end
                    end
                )
            end)
        end

        dap.configurations.c = dap.configurations.cpp
        local js_based_languages = { "typescript", "javascript", "typescriptreact", "javascriptreact", "vue" }
        for _, language in ipairs(js_based_languages) do
            dap.configurations[language] = {
                {
                    type = "pwa-node",
                    request = "launch",
                    name = "Launch file using Node.js (nvim-dap)",
                    program = "${file}",
                    cwd = "${workspaceFolder}",
                },
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
                {
                    name = "Attach to NestJS Docker",
                    type = "pwa-node",
                    request = "attach",
                    port = 9229,
                    cwd = "${workspaceFolder}",
                    localRoot = "${workspaceFolder}",
                    remoteRoot = "/app",
                    sourceMaps = true,
                    outFiles = { "${workspaceFolder}/dist/**/*.js" },
                    sourceMapPathOverrides = {
                        ["/app/*"] = "${workspaceFolder}/*",
                    },
                    skipFiles = { "<node_internals>/**" },
                    -- trace = true,
                },
                {
                    type = "pwa-chrome",
                    request = "launch",
                    name = "Launch Chrome (nvim-dap)",
                    url = enter_launch_url,
                    webRoot = "${workspaceFolder}",
                    sourceMaps = true,
                },
                {
                    type = "pwa-msedge",
                    request = "launch",
                    name = "Launch Edge (nvim-dap)",
                    url = enter_launch_url,
                    webRoot = "${workspaceFolder}",
                    sourceMaps = true,
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
