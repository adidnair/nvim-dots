-- vim.opt.nocompatible = true
vim.opt.hidden = true;
vim.opt.showtabline = 0
vim.opt.showmatch = true
vim.opt.ignorecase = true
vim.opt.mouse = "a"
vim.opt.hlsearch = true
vim.opt.termguicolors = true
vim.opt.incsearch = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.autoindent = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wildmode = "list:longest"
vim.opt.clipboard = "unnamedplus"
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.smartindent = true
vim.opt.showmode = false
vim.opt.smartcase = true
vim.opt.cursorline = true
vim.opt.listchars:append({eol = ''})
vim.opt.list = true

-- vim.g.vimtex_view_method = 'zathura'
-- vim.opt.ttyfast

-- vim.cmd [[
-- augroup kitty_mp
--     autocmd!
--     au VimLeave * :silent !kitty @ set-spacing padding=20 margin=10
--     au VimEnter * :silent !kitty @ set-spacing padding=0 margin=0
-- augroup END
-- ]]

-- local kitty = vim.api.nvim_create_augroup("Kitty", {clear = true})
-- vim.api.nvim_create_autocmd("VimEnter", {command = ":terminal kitty @ set-spacing padding=0 margin=0", group = kitty})
-- vim.api.nvim_create_autocmd("VimLeave", {command = ":terminal kitty @ set-spacing padding=0 margin-v=10 margin-h=15", group = kitty})
