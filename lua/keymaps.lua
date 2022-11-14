-- Keymaps --

-- local map = require('utils').map
vim.g.mapleader = " "

-- Me Me Big Dumb
vim.keymap.set('n', "<Up>", "<cmd>echoe \"Big Dumb\"<CR>")
vim.keymap.set('n', "<Down>", "<cmd>echoe \"Big Dumb\"<CR>")
vim.keymap.set('n', "<Left>", "<cmd>echoe \"Big Dumb\"<CR>")
vim.keymap.set('n', "<Right>", "<cmd>echoe \"Big Dumb\"<CR>")

-- File Manager
vim.keymap.set('n', '<leader>f', '<cmd>CHADopen<CR>', {silent = true})

-- Telescope
vim.keymap.set('n', '<leader>af', '<cmd>Telescope find_files<CR>', {silent = true})
vim.keymap.set('n', '<leader>ar', '<cmd>Telescope oldfiles<CR>', {silent = true})
vim.keymap.set('n', '<leader>aa', '<cmd>Telescope buffers<CR>', {silent = true})
vim.keymap.set('n', '<leader>en', '<cmd>Telescope find_files cwd=~/.config/nvim<CR>', {silent = true})

vim.keymap.set('n', '<leader>ad', '<cmd>bd<CR>', {silent = true})

-- Misc
vim.keymap.set('n', '<leader>h', '<cmd>nohl<CR>', {silent = true })
vim.keymap.set('i', 'jk' ,'<esc>')
vim.keymap.set('i', 'kj' ,'<esc>')
vim.keymap.set('n', '<leader>s', '<C-6>')

-- DAP
vim.keymap.set('n', '<leader>dd', function() require'dap'.continue() end)
vim.keymap.set('n', '<leader>db', function() require'dap'.toggle_breakpoint() end)
vim.keymap.set('n', '<leader>di', function() require'dap'.step_into() end)
vim.keymap.set('n', '<leader>do', function() require'dap'.step_over() end)
vim.keymap.set('n', '<leader>du', function() require("dapui").toggle() end)

-- Terminal
-- vim.keymap.set('n', '<leader>t', ':! kitty<CR>', {silent = true})
