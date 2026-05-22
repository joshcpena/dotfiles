-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down half screen" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up half screen" })
vim.keymap.set("n", "<C-Up>", "<cmd>resize +20<cr>", { desc = "Increase Window Height" })
vim.keymap.set("n", "<C-Down>", "<cmd>resize -20<cr>", { desc = "Decrease Window Height" })
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -20<cr>", { desc = "Decrease Window Width" })
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +20<cr>", { desc = "Increase Window Width" })
-- vim.keymap.set("n", "<F3>", ":CMakeSelectBuildPreset<CR>", { desc = "Run CMakeSelectBuildPreset" })
-- vim.keymap.set("n", "<F4>", ":CMakeSelectBuildTarget<CR>", { desc = "Run CMakeSelectBuildTarget" })
-- vim.keymap.set("n", "<F5>", ":CMakeBuild<CR>", { desc = "Run CMakeBuild" })
-- vim.keymap.set("n", "<F6>", ":CMakeRun<CR>", { desc = "Run CMakeRun" })
