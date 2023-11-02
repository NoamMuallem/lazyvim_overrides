-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

opt.foldlevel = 20
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"

vim.opt.list = true
vim.opt.cmdheight = 0
vim.opt.confirm = true
vim.opt.clipboard = nil
vim.opt.confirm = true
vim.opt.spelllang = "en_us"
vim.opt.spell = true
vim.o.showcmdloc = "statusline"
vim.opt.swapfile = false
