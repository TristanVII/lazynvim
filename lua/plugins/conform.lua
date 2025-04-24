-- lua/plugins/conform.lua
return {
  "stevearc/conform.nvim",
  -- LazyVim includes conform and sets it up for format-on-save
  -- This configuration primarily ensures stylua is used for lua
  event = { "BufWritePre" }, -- Ensure it runs on save
  cmd = { "ConformInfo" },
  opts = {
    -- Define your formatters here
    formatters_by_ft = {
      lua = { "stylua" },
      -- Add ruby and related filetypes, using rubocop
      ruby = { "rubocop" },
      rakefile = { "rubocop" },
      gemspec = { "rubocop" },
      -- Add other languages and formatters as needed
      -- python = { "isort", "black" },
      -- javascript = { { "prettierd", "prettier" } },
    },
    -- Configure format on save (usually defaults from LazyVim)
    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true, -- Good default, uses LSP if conform fails
    },
    -- Optional: Turn off notifications for errors
    notify_on_error = true, -- Default is true, set to false to disable
  },
} 