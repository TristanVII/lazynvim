-- lua/plugins/toggleterm.lua
return {
  "akinsho/toggleterm.nvim",
  version = "*",
  opts = {
    -- Your S-t mapping uses size=10, direction=float
    -- We define a terminal configuration that matches this
    float_opts = {
      border = "curved", -- Optional: style the border
    },
    size = function(term) -- Can be a function or static number
      if term.direction == "horizontal" then
        return 15
      elseif term.direction == "vertical" then
        return vim.o.columns * 0.4
      end
      -- Use a static size for the float direction used in the keymap
      return 10 
    end,
    -- Set direction to float as default for ToggleTerm command if needed,
    -- but the keymap explicitly sets it anyway.
    -- direction = "float",
    -- Add other toggleterm options here if needed
  },
} 