-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

local augroup = vim.api.nvim_create_augroup("UserTransparency", { clear = true })

-- Set background transparency after colorscheme loads
vim.api.nvim_create_autocmd("ColorScheme", {
  group = augroup,
  pattern = "*",
  desc = "Make background transparent",
  callback = function()
    vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "NormalNC", { bg = "NONE" })
    -- Optional: You might want to make floating windows transparent too
    -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
    -- vim.api.nvim_set_hl(0, "FloatBorder", { bg = "NONE" })
  end,
})

-- Add any other custom autocommands below this line
