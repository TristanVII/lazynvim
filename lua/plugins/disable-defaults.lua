-- lua/plugins/disable-defaults.lua
-- This file disables default plugins from LazyVim

return {
  -- Disable neo-tree (LazyVim's most common default file explorer)
  { "nvim-neo-tree/neo-tree.nvim", enabled = false },

  -- Disable mini.files (Another potential file explorer from mini.nvim)
  { "echasnovski/mini.files", enabled = false },

  -- Disable mini.notify (often referred to as notification "snacks")
  { "echasnovski/mini.notify", enabled = false },

  -- Disable flash.nvim (formerly known as snacks.nvim)
  --{ "folke/flash.nvim", enabled = false },
} 