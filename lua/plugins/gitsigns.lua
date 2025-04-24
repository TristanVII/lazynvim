-- lua/plugins/gitsigns.lua
return {
  "lewis6991/gitsigns.nvim",
  opts = {
    signs = {
      add = { text = "+" },
      change = { text = "~" },
      delete = { text = "󰍵" },
      topdelete = { text = "‾" },
      changedelete = { text = "~" },
      untracked = { text = "│" },
    },
    on_attach = function(bufnr)
      local gs = package.loaded.gitsigns

      local function opts(desc)
        return { buffer = bufnr, desc = "GitSigns: " .. desc }
      end

      local map = vim.keymap.set

      -- Navigation (Matches LazyVim defaults, but ensures your preference)
      map("n", "]c", function()
        if vim.wo.diff then
          vim.cmd.normal { "]c", bang = true }
        else
          gs.nav_hunk "next"
        end
      end, opts "Next Hunk")

      map("n", "[c", function()
        if vim.wo.diff then
          vim.cmd.normal { "[c", bang = true }
        else
          gs.nav_hunk "prev"
        end
      end, opts "Prev Hunk")

      -- Actions (Your specific mappings)
      map("n", "<leader>rh", gs.reset_hunk, opts "Reset Hunk")
      map("n", "<leader>ph", gs.preview_hunk, opts "Preview Hunk")
      map("n", "<leader>gb", gs.blame_line, opts "Blame Line")
      map("n", "<leader>hD", function() gs.diffthis "~" end, opts "Diff This ~")

      -- Default LazyVim mappings you might want to keep or adapt:
      -- map({'n', 'v'}, '<leader>hs', ':Gitsigns stage_hunk<CR>', opts 'Stage Hunk')
      -- map({'n', 'v'}, '<leader>hr', ':Gitsigns reset_hunk<CR>', opts 'Reset Hunk') -- Matches your leader rh
      -- map('n', '<leader>hu', gs.undo_stage_hunk, opts 'Undo Stage Hunk')
      -- map('n', '<leader>hp', gs.preview_hunk, opts 'Preview Hunk') -- Matches your leader ph
      -- map('n', '<leader>hb', function() gs.blame_line{full=true} end, opts 'Blame Line Full') -- Similar to your leader gb
      -- map('n', '<leader>hd', gs.diffthis, opts 'Diff This') -- Similar to your leader hD
      -- map('n', '<leader>hD', function() gs.diffthis('~') end, opts 'Diff This ~') -- Matches your leader hD
      -- map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>', opts 'Select Hunk')
    end,
  },
} 