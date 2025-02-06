-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local keymap = vim.keymap

local function set_keymap(mode, lhs, rhs, opts)
  opts = opts or {}
  keymap.set(mode, lhs, rhs, opts)
end

-- stylua: ignore
local all_maps = {
  -- Normal mode mappings
  { mode = "n", lhs = "S",          rhs = "<cmd>w<cr>" },
  { mode = "n", lhs = "Q",          rhs = "<cmd>quit<cr>" },
  -- { mode = "n", lhs = "<leader>d",  rhs = "<cmd>Dashboard<cr>" },
  { mode = "n", lhs = "<S-up>",       rhs = ":res +5<cr>",             opts = { noremap = true, silent = true } },
  { mode = "n", lhs = "<S-down>",     rhs = ":res -5<cr>",             opts = { noremap = true, silent = true } },
  { mode = "n", lhs = "<S-left>",     rhs = ":vertical resize -5<cr>", opts = { noremap = true, silent = true } },
  { mode = "n", lhs = "<S-right>",    rhs = ":vertical resize +5<cr>", opts = { noremap = true, silent = true } },
}

for _, mapping in ipairs(all_maps) do
  set_keymap(mapping.mode, mapping.lhs, mapping.rhs, mapping.opts)
end

require("lazy.view.config").keys.close = "<Esc>"

-- <leader>fc open nvim config

-- vim porting config
vim.cmd("nmap <C-p> <leader>ff") -- find file
vim.cmd("nmap ,<Space> gcc") -- toggle comment current line
vim.cmd("vmap ,<Space> gc") -- toggle comment of selected lines

-- C-j/k/h/l binded to C-w j/k/h/l in lazyvim. should unbind first
vim.keymap.del("n", "<C-j>")
vim.keymap.del("n", "<C-k>")
vim.keymap.del("n", "<C-h>")
vim.keymap.del("n", "<C-l>")
vim.keymap.set("n", "<C-j>", "i<CR><ESC>")
vim.keymap.set("n", "<C-k>", "i<Space><ESC>")
vim.keymap.set("n", "<C-h>", "i<Del><ESC>")
vim.keymap.set("n", "<C-l>", "i<Space><ESC>")
vim.keymap.set("v", "<C-l>", "I<Space><ESC>gv")
