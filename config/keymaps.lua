-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- This file is automatically loaded by lazyvim.config.init
local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    if opts.remap and not vim.g.vscode then
      opts.remap = nil
    end
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

-- remove presets
map("n", "<A-j>", "<Nop>")
map("n", "<A-k>", "<Nop>")
map("i", "<A-j>", "<Nop>")
map("i", "<A-k>", "<Nop>")
map("v", "<A-j>", "<Nop>")
map("v", "<A-k>", "<Nop>")
map("n", "<leader>cd", "<Nop>")
map("n", "<leader>ca", "<Nop>")

-- exit insertmode
vim.keymap.set("i", "jj", "<ESC>")

-- move in jump list
vim.keymap.set("n", "<", "<C-i>")

vim.keymap.set("n", ">", "<C-o>")

-- past copied text
vim.keymap.set("n", "<Leader>p", '"0p')
vim.keymap.set("n", "<Leader>P", '"0P')

-- copy to os clipboard
vim.keymap.set("n", "<Leader>y", '"*y')

-- insert new line without going into insert mode
vim.keymap.set("n", "<Leader>k", ":<c-u>put!=repeat([''],v:count)<bar>']+1<cr>")
vim.keymap.set("n", "<Leader>j", ":<c-u>put =repeat([''],v:count)<bar>'[-1<cr>")

-- map m anf M to ; and ,
vim.keymap.set("n", "m", ";")
vim.keymap.set("n", "M", ",")
vim.keymap.set("v", "m", ";")
vim.keymap.set("v", "M", ",")

-- set markers to z
vim.keymap.set("n", "z", "m")

-- free s mapping
vim.keymap.set("n", "s", "s")

-- reset wired esc key behavior
vim.keymap.set("i", "<esc>", "<esc>")
vim.keymap.set("n", "<esc>", "<esc>")
vim.keymap.set("v", "<esc>", "<esc>")

--set esc to clear highlight text
vim.keymap.set("n", "<esc>", "<cmd>noh<cr>")

-- working with tabs
vim.keymap.set("n", "<leader>n", "<cmd>tabnew<cr>", { desc = "New Tab" })
vim.keymap.set("n", "gt", "<cmd>tabnext<cr>", { desc = "Next Tab" })
vim.keymap.set("n", "Gt", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })
vim.keymap.set("n", "<leader>N", "<cmd>tabclose<cr>", { desc = "Close Tab" })

-- lsp
map("n", "cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
map("n", "ca", vim.lsp.buf.code_action, { desc = "Move up" })

-- smart resizing splits
local change_width = function(d)
  local v = vim.api

  -- Lua version of a ternery operator
  d = d and d or "left"

  local lr = d == "left" or d == "right"
  -- 5 for left right, 3 for up down
  local amt = lr and 5 or 3

  local pos = v.nvim_win_get_position(0)
  local w = v.nvim_win_get_width(0)
  local h = v.nvim_win_get_height(0)

  if lr then
    amt = pos[2] == 0 and -amt or amt
  else
    amt = pos[1] == 0 and -amt or amt
  end

  w = (d == "left") and (w + amt) or (w - amt)
  h = (d == "up") and (h + amt) or (h - amt)

  if lr then
    v.nvim_win_set_width(0, w)
  else
    v.nvim_win_set_height(0, h)
  end
end

vim.keymap.set({ "n" }, "<S-left>", function()
  change_width("left")
end)
vim.keymap.set({ "n" }, "<S-right>", function()
  change_width("right")
end)

vim.keymap.set({ "n" }, "<S-up>", function()
  change_width("up")
end)
vim.keymap.set({ "n" }, "<S-down>", function()
  change_width("down")
end)
