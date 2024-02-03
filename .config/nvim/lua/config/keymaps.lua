-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- TODO: move this into an autocommand after null-ls finishes formatting?
-- vim.api.nvim_set_keymap("n", "<leader>tyt", "<cmd>TypescriptAddMissingImports<cr>", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("n", "<leader>tyr", "<cmd>TypescriptRemoveUnused<cr>", { noremap = true, silent = true })

-- TODO: only run on rust files
--
--vim.api.nvim_set_keymap("n", "<leader>rr", "<cmd>RustRun<cr>", { noremap = true, silent = {noremap = true, silent = true}mux

--Tmux
vim.api.nvim_set_keymap("n", "<C-h>", "<cmd>TmuxNavigateLeft<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-l>", "<cmd>TmuxNavigateRight<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-j>", "<cmd>TmuxNavigateDown<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-k>", "<cmd>TmuxNavigateUp<cr>", { noremap = true, silent = true })

-- Toggle terminal
vim.api.nvim_set_keymap("n", "<C-/>", "<cmd>ToggleTerm<cr>", { noremap = true, silent = true })

-- Twilight
vim.api.nvim_set_keymap("n", "<leader>um", "<cmd>Twilight<cr>", { noremap = true, silent = true })
