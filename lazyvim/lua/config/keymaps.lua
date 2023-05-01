-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local Util = require("lazyvim.util")

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

local opts = { noremap = true }

map("n", "ö", "<Right>", opts)
map("n", "l", "<Up>", opts)
map("n", "k", "<Down>", opts)
map("n", "j", "<Left>", opts)

map("v", "ö", "<Right>", opts)
map("v", "l", "<Up>", opts)
map("v", "k", "<Down>", opts)
map("v", "j", "<Left>", opts)

-- Handle indentation a bit better
map("v", "<S-Tab>", "<gv", opts)
map("v", "<Tab>", ">gv", opts)

-- Toggle line numbers and cursorline
map("n", "<C-n><C-n>", ":set invnumber<CR>", opts)
map("n", "<C-L><C-L>", ":set cursorline!<CR>", opts)

-- Comment/de-comment current line (both normal and visual)
--map("n", "<C-K><C-K>", "<cmd>lua require('Comment.api').toggle_current_linewise()<cr>", opts)
--map("v", "<C-K><C-K>", "<esc><cmd>lua require('Comment.api').toggle_current_linewise_op(vim.fn.visualmode())<CR>", opts)

-- Telescope bindings
map("n", "<M-f>", "<cmd>Telescope current_buffer_fuzzy_find<cr>", opts)
map("n", "<C-p>", "<cmd>Telescope find_files<CR>", opts)

-- read more here later on
-- https://www.lazyvim.org/configuration/tips

-- Example keymaps configuration
-- https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
