-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- File Explorer Toggle (using default LazyVim plugin 'neo-tree.nvim' or 'nvim-tree.lua' if overridden)
-- map("n", "<leader>E", function() vim.cmd.Neotree "toggle" end, { desc = "Explorer NeoTree (cwd)" })
-- Ensure nvim-tree toggle if you prefer it over neo-tree
map('n', 't', '<cmd>NvimTreeToggle<cr>', { desc = 'Toggle NvimTree' })

-- Basic Navigation and Editing
map('n', '<leader>b', vim.cmd.Ex, { desc = 'Open Ex command mode' })
map('n', '<Enter>', 'o', { desc = 'Insert line below' })
map('n', '<C-j>', '<C-d>zz', { desc = 'Scroll down half page' })
map('n', '<C-k>', '<C-u>zz', { desc = 'Scroll up half page' })

map('n', '<C-l>', '$', { desc = 'Move to end of line' })
map('n', '<C-h>', '^', { desc = 'Move to beginning of line' })
map('n', '<S-j>', '}', { desc = 'Move to next paragraph' })
map('n', '<S-k>', '{', { desc = 'Move to previous paragraph' })
map('n', '<S-l>', 'e', { desc = 'Move to end of word' })
map('n', '<S-h>', 'b', { desc = 'Move to beginning of word' })
map('v', '<S-h>', 'b', { desc = 'Move selection to beginning of word' })
map('v', '<S-l>', 'e', { desc = 'Move selection to end of word' })
map('v', '<S-j>', '}', { desc = 'Move selection to next paragraph' })
map('v', '<S-k>', '{', { desc = 'Move selection to previous paragraph' })
-- Move lines up and down in visual mode
map('v', '<C-j>', ":m '>+1<CR>gv=gv", { desc = 'Move line down' })
map('v', '<C-k>', ":m '<-2<CR>gv=gv", { desc = 'Move line up' })

-- Clear search highlight
map('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Clear search highlight' })

-- Diagnostic keymaps
map('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
map('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
map('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic error messages' })
map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic quickfix list' })

-- Window navigation
map('n', '<leader>h', '<C-w><C-h>', { desc = 'Move focus to the left window' })
map('n', '<leader>l', '<C-w><C-l>', { desc = 'Move focus to the right window' })
map('n', '<leader>j', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
map('n', '<leader>k', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Vertical Split
map('n', '<leader>v', '<cmd>:vsplit<cr>', { desc = 'Vertical split' })

-- SearchBox Integration
map('n', '<C-f>', ':SearchBoxIncSearch<CR>', { desc = 'Incremental Search with SearchBox' })
map('n', '<leader>fr', ':SearchBoxReplace<CR>', { desc = 'Replace with SearchBox' })

-- ToggleTerm Float
map('n', '<S-t>', '<cmd>:ToggleTerm size=10 direction=float name=main<cr>', { desc = 'Toggle floating terminal' })

-- GIT SCRIPT TO SHOW LOG AT LINES
map("v", "<leader>gl", function()
    vim.print('G log --pretty="tformat: %n%Cred%h%Creset %Cgreen%s%Creset" -L')
    vim.cmd(
        'G log --pretty="tformat: %n%Cred%h%Creset %Cgreen%s%Creset" -L'
            .. vim.fn.line("v")
            .. ","
            .. vim.fn.line(".")
            .. ":"
            .. vim.fn.expand("%:p")
    )
end, {})
 
vim.keymap.set("n", "<leader>gl", function()
    vim.print('G log --pretty="tformat: %n%Cred%h%Creset %Cgreen%s%Creset" -L')
    vim.cmd(
        'G log --pretty="tformat: %n%Cred%h%Creset %Cgreen%s%Creset" -L'
            .. math.max(1, vim.fn.line(".") - 1)
            .. ","
            .. vim.fn.line(".") + 1
            .. ":"
            .. vim.fn.expand("%:p")
    )
end, {})

-- Copy current file path
map('n', '<leader>cf', function()
  local filepath = vim.fn.expand('%:p')
  vim.fn.setreg('+', filepath)
  vim.notify("Copied path: " .. filepath, vim.log.levels.INFO)
end, { desc = 'Copy File Path' })

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})