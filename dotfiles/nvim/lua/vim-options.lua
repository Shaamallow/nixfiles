vim.g.mapleader = ' '

vim.cmd('set expandtab')
vim.cmd('set tabstop=2')
vim.cmd('set softtabstop=2')
vim.cmd('set shiftwidth=2')
vim.cmd('set nowrap')

vim.opt.conceallevel = 1

-- Navigate vim panes better
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

-- Navigate vim buffers
vim.keymap.set('n', 'H', ':bprev<CR>')
vim.keymap.set('n', 'L', ':bnext<CR>')

-- Force formatting
vim.keymap.set('n', '<leader>ff', '<cmd>lua vim.lsp.buf.format()<CR>')

-- Yank to clipboard
vim.keymap.set('v', '<leader>y', [["+y]])

-- Remove highlights
vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')

vim.wo.relativenumber = true
vim.wo.number = true
vim.g.autoformat = true
