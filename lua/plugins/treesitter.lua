-- lua/plugins/treesitter.lua
-- Extending LazyVim's default nvim-treesitter configuration
return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    -- Ensure the default ensure_installed table exists
    opts.ensure_installed = opts.ensure_installed or {}
    -- Add "ruby" to the list if it's not already present
    local ruby_found = false
    for _, lang in ipairs(opts.ensure_installed) do
      if lang == "ruby" then
        ruby_found = true
        break
      end
    end
    if not ruby_found then
      table.insert(opts.ensure_installed, "ruby")
    end

    -- Ensure auto_install is true (LazyVim default)
    opts.auto_install = true

    -- Apply highlight/indent settings from your old config if needed
    -- (These were added previously but the file was lost)
    opts.highlight = vim.tbl_deep_extend("force", opts.highlight or {}, {
      enable = true,
      additional_vim_regex_highlighting = vim.tbl_deep_extend(
        "force",
        opts.highlight and opts.highlight.additional_vim_regex_highlighting or {},
        { "ruby" }
      ),
    })
    opts.indent = vim.tbl_deep_extend("force", opts.indent or {}, {
      enable = true,
      disable = vim.tbl_deep_extend(
        "force",
        opts.indent and opts.indent.disable or {},
        { "ruby" }
      ),
    })
  end,
  -- Ensure the config function runs to apply the merged opts
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
} 