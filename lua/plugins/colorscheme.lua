return {
  "rose-pine/neovim",
  name = "rose-pine",
  lazy = false, -- Ensure it loads early
  priority = 1000, -- Make sure it loads before other plugins
  config = function()
    require("rose-pine").setup({
      variant = "moon", -- auto, main, moon, or dawn
      dark_variant = "main", -- main, moon, or dawn
      dim_inactive_windows = false,
      extend_background_behind_borders = true,

      enable = {
        terminal = true,
        migrations = false,
      },

      styles = {
        bold = false,
        italic = false,
        transparency = false,
      },

      groups = {
        border = "muted",
        link = "iris",
        panel = "surface",

        error = "love",
        hint = "iris",
        info = "foam",
        note = "pine",
        todo = "rose",
        warn = "gold",

        git_add = "foam",
        git_change = "rose",
        git_delete = "love",
        git_dirty = "rose",
        git_ignore = "muted",
        git_merge = "iris",
        git_rename = "pine",
        git_stage = "iris",
        git_text = "rose",
        git_untracked = "subtle",

        h1 = "iris",
        h2 = "foam",
        h3 = "rose",
        h4 = "gold",
        h5 = "pine",
        h6 = "foam",
      },

      palette = {
        -- Override the builtin palette per variant
        moon = {
          base = "#282c34", -- Set background color to #282c34
          overlay = "#363738",
        },
      },

      highlight_groups = {
        CursorLine = { bg = "#282c34" }, -- For cursor line
        Cursor = { bg = "#282c34" }, -- For cursor background
        -- Ensure Normal background matches the desired base
        Normal = { bg = "#282c34" },
        -- Ensure Telescope backgrounds match
        TelescopeNormal = { bg = "#282c34" },
        TelescopeBorder = { fg = "#495162", bg = "#282c34" },
        TelescopePromptNormal = { bg = "#30343f" },
        TelescopePromptBorder = { fg = "#495162", bg = "#30343f" },
        TelescopePromptTitle = { fg = "#ff79c6", bg = "#30343f" },
        TelescopePreviewTitle = { fg = "#ff79c6", bg = "#282c34" },
        TelescopeResultsTitle = { fg = "#ff79c6", bg = "#282c34" },
        TelescopeResultsNormal = { bg = "#282c34" },
        TelescopeResultsBorder = { fg = "#495162", bg = "#282c34" },
        NvimTreeCursorLine = { bg = "#363738" }, -- Use the 'overlay' color or pick another distinct color
        -- You might need to add more highlight groups depending on the plugins you use
      },

      before_highlight = function(group, highlight, palette)
        -- Example: Disable undercurls
        -- if highlight.undercurl then
        --     highlight.undercurl = false
        -- end
      end,
    })

    -- Set the colorscheme
    vim.cmd("colorscheme rose-pine")
  end,
}

