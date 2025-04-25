-- lua/plugins/telescope.lua
return {
  "nvim-telescope/telescope.nvim",
  -- Ensure dependencies are loaded, LazyVim handles this, but explicit is fine
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      cond = function()
        return vim.fn.executable "make" == 1
      end,
    },
    "nvim-telescope/telescope-ui-select.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  opts = function()
    -- local actions = require "telescope.actions"
    local themes = require "telescope.themes"

    return {
      defaults = {
        -- Your defaults here, e.g., mappings
        -- mappings = {
        --   i = { ["<c-enter>"] = "to_fuzzy_refine" },
        -- },
        -- path_display = { "smart" }, -- Example: shorten paths
      },
      pickers = {
        -- Configure specific pickers
      },
      extensions = {
        ["ui-select"] = {
          themes.get_dropdown(),
        },
        fzf = {
          fuzzy = true, -- false will disable fuzzy matching
          override_generic_sorter = true, -- override the generic sorter
          override_file_sorter = true, -- override the file sorter
          case_mode = "smart_case", -- or "ignore_case" or "respect_case"
        },
      },
    }
  end,
  -- Add your custom keymaps using the keys table
  keys = {
    -- Your search keymaps from old config
    { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "[S]earch [H]elp" },
    { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "[S]earch [K]eymaps" },
    { "<leader>sf", "<cmd>Telescope find_files<cr>", desc = "[S]earch [F]iles" },
    { "<leader>ss", "<cmd>Telescope builtin<cr>", desc = "[S]earch [S]elect Telescope" },
    { "<leader>sw", "<cmd>Telescope grep_string<cr>", desc = "[S]earch current [W]ord" },
    { "<leader>sg", "<cmd>Telescope live_grep<cr>", desc = "[S]earch by [G]rep" },
    { "<leader>sd", "<cmd>Telescope diagnostics<cr>", desc = "[S]earch [D]iagnostics" },
    { "<leader>s.", "<cmd>Telescope oldfiles<cr>", desc = '[S]earch Recent Files ("." for repeat)' },
    { "<leader><leader>", "<cmd>Telescope buffers<cr>", desc = "[ ] Find existing buffers" },
    {
      "<leader>/",
      function()
        require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end,
      desc = "[/] Fuzzily search in current buffer",
    },
    {
      "<leader>s/",
      function()
        require("telescope.builtin").live_grep {
          grep_open_files = true,
          prompt_title = "Live Grep in Open Files",
        }
      end,
      desc = "[S]earch [/] in Open Files",
    },
    {
      "<leader>sn",
      function()
        require("telescope.builtin").find_files { cwd = vim.fn.stdpath "config" }
      end,
      desc = "[S]earch [N]eovim files",
    },
    -- Note: LSP related telescope mappings are handled in lsp-custom.lua's on_attach
  },
  config = function(_, opts)
    -- Load extensions
    local telescope = require "telescope"
    telescope.setup(opts)
    pcall(telescope.load_extension, "fzf")
    pcall(telescope.load_extension, "ui-select")
  end,
} 