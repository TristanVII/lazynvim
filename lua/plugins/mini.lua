-- lua/plugins/mini.lua
return {
  "echasnovski/mini.nvim",
  -- LazyVim loads mini.nvim by default, so we just need to configure it.
  -- We specify the config function to ensure our settings, especially for
  -- mini.statusline, are applied.
  config = function(_, opts)
    -- opts will contain the default LazyVim configuration for mini.nvim modules
    -- We only need to ensure our custom parts are included or override defaults.

    -- Setup modules included by LazyVim (like ai, surround) - ensure they run
    -- Their setup usually happens automatically if mini.nvim is loaded.
    -- Explicitly call setup if you need to guarantee options.
    require("mini.ai").setup(opts.ai or { n_lines = 500 }) -- Merge LazyVim opts with your n_lines
    require("mini.surround").setup(opts.surround or {}) -- Use LazyVim opts or defaults

    -- Configure mini.statusline (your addition)
    -- Check if mini.statusline is enabled in the main LazyVim config or enable it here
    -- This assumes LazyVim doesn't configure statusline by default (it uses lualine)
    local statusline_ok, statusline = pcall(require, "mini.statusline")
    if statusline_ok then
      statusline.setup {
        use_icons = vim.g.have_nerd_font or false,
        -- Set the section for cursor location as per your old config
        section_location = function()
          return "%2l:%-2v"
        end,
        -- Add other statusline options if desired
      }
      print("mini.statusline configured.")
    else
       print("mini.statusline not found or failed to load. Ensure it's required by your main lazy setup if needed.")
    end

    -- Setup other mini modules if needed by LazyVim or explicitly by you
    -- Example: If LazyVim uses mini.indentscope, ensure its setup runs if needed
    -- if opts.indentscope then require("mini.indentscope").setup(opts.indentscope) end

    -- IMPORTANT: This config assumes mini.nvim is loaded by LazyVim.
    -- If you added mini.nvim explicitly, ensure it doesn't conflict with LazyVim's defaults.
  end,
} 