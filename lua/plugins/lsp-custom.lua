-- lua/plugins/lsp-custom.lua
return {
  -- 1. Ensure Mason installs the necessary tools
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      -- Add tools needed: stylua (from old config), ruby-lsp, rubocop
      vim.list_extend(opts.ensure_installed, { "stylua", "ruby-lsp", "rubocop" })
    end,
  },

  -- 2. Configure nvim-lspconfig
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      -- Get default LazyVim LSP keymaps
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      -- disable the default K keymap
      keys[#keys + 1] = { "K", false }
      -- Assign the modified keys back to opts
      opts.keys = keys

      -- Merge servers config (ensure ruby_lsp is enabled)
      opts.servers = vim.tbl_deep_extend("force", opts.servers or {}, {
        lua_ls = {}, -- Keep default
        solargraph = {
          root_dir = require("lspconfig").util.root_pattern("Gemfile", ".git", "."),
        },
        -- You might want to keep ruby_lsp explicit here too, or remove it if solargraph is preferred
        -- ruby_lsp = {},
      })

      -- Merge diagnostics config (keeping previous settings)
      opts.diagnostics = vim.tbl_deep_extend("force", opts.diagnostics or {}, {
        underline = true,
        update_in_insert = false,
        virtual_text = {
          spacing = 4,
          source = "if_many",
          prefix = "●",
        },
        severity_sort = true,
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = "󰅚 ",
            [vim.diagnostic.severity.WARN] = "󰀪 ",
            [vim.diagnostic.severity.HINT] = "󰌶 ",
            [vim.diagnostic.severity.INFO] = "󰋽 ",
          },
        },
      })

      -- Keep the on_attach function (wrapped)
      opts.on_attach = require("lazyvim.util").lsp.on_attach(function(client, bufnr)
        -- This function runs AFTER LazyVim's default on_attach keymaps are set.

        -- Define your custom mappings here. They will override defaults if they conflict.

        local map = function(mode, keys, func, desc)
          vim.keymap.set(mode, keys, func, { buffer = bufnr, desc = "LSP: " .. desc })
        end

        -- Your custom LSP keymaps:
        map("n", "gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
        map("n", "gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
        map("n", "gi", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
        map("n", "<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
        map("n", "<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
        map("n", "<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
        map("n", "<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
        map("n", "<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
        map("n", "gh", vim.lsp.buf.hover, "Hover Documentation")
        map("n", "gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
      end)

      -- Return the modified opts table
      return opts
    end,
  },
}
