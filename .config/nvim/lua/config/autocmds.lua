-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- NextJS autocmds
--- page.tsx template
vim.api.nvim_create_augroup("AutoAddPageTsxContent", { clear = true })
vim.api.nvim_create_autocmd("BufNewFile", {
  group = "AutoAddPageTsxContent",
  pattern = "~/code/**/app/**/page.tsx",
  command = "0r ~/.config/nvim/templates/nextjs/page.template.tsx",
})
--- layout.tsx template
vim.api.nvim_create_augroup("AutoAddLayoutTsxContent", { clear = true })
vim.api.nvim_create_autocmd("BufNewFile", {
  group = "AutoAddLayoutTsxContent",
  pattern = "~/code/**/app/**/layout.tsx",
  command = "0r ~/.config/nvim/templates/nextjs/layout.template.tsx",
})
