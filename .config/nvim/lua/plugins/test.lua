return {}
-- return {
--   {
--     "alfaix/neotest-gtest",
--     dependencies = {
--       "nvim-neotest/nvim-nio",
--       "nvim-lua/plenary.nvim",
--       "antoinemadec/FixCursorHold.nvim",
--       "nvim-treesitter/nvim-treesitter",
--     },
--   },
--   {
--     "nvim-neotest/neotest",
--     keys = {
--       {
--         "<leader>tm",
--         function()
--           require("neotest").summary.run_marked()
--         end,
--         desc = "Run marked",
--       },
--     },
--     config = function()
--       local lib = require("neotest.lib")
--       local _test_extensions = {
--         ["cpp"] = true,
--         ["cppm"] = true,
--         ["cc"] = true,
--         ["cxx"] = true,
--         ["c++"] = true,
--       }
--       local _test_only = {
--         ["t.cpp"] = true,
--         ["t"] = true,
--       }
--       local function is_test_file(file_path)
--         local elems = vim.split(file_path, lib.files.sep, { plain = true })
--         local filename = elems[#elems]
--         if filename == "" then -- directory
--           return false
--         end
--         local extsplit = vim.split(filename, ".", { plain = true })
--         local extension = extsplit[#extsplit]
--         local fname_last_part = extsplit[#extsplit - 1]
--         -- print(filename .. " ext:" .. extension .. " lastpart: " .. fname_last_part)
--         local result = _test_extensions[extension]
--             and (vim.startswith(filename, "test_") or ((fname_last_part .. "." .. extension) == "t.cpp") or vim.endswith(
--               fname_last_part,
--               "_test"
--             ))
--           or false
--         return result
--       end
--       require("neotest").setup({
--         adapters = {
--           require("neotest-gtest").setup({ is_test_file = is_test_file }), -- Registration
--         },
--       vim.fn.getcwd()})
--     end,
--   },
-- }
