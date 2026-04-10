vim.g.mapleader = ' '

vim.cmd('set expandtab')
vim.cmd('set tabstop=2')
vim.cmd('set softtabstop=2')
vim.cmd('set shiftwidth=2')
vim.cmd('set nowrap')

vim.opt.conceallevel = 1

-- Navigate vim panes better
-- Handled by tmux.lua
-- vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
-- vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
-- vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
-- vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

-- Force formatting
-- vim.keymap.set('n', '<leader>ff', '<cmd>lua vim.lsp.buf.format()<CR>')

-- Yank to clipboard
vim.keymap.set('v', '<leader>y', [["+y]])

-- Remove highlights
vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')

-- Visual mode indent remaps (add these lines)
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

vim.wo.relativenumber = true
vim.wo.number = true
vim.g.autoformat = true

vim.api.nvim_create_user_command('Cppath', function()
  local path = vim.fn.expand('%:p')
  vim.fn.setreg('+', path)
  vim.notify('Copied "' .. path .. '" to the clipboard!')
end, {})

-- Diff keymap
vim.keymap.set('n', '<leader>dt', function()
  if vim.wo.diff then
    vim.cmd('windo diffoff')
    vim.notify('Diff mode OFF')
  else
    vim.cmd('windo diffthis')
    vim.notify('Diff mode ON')
  end
end, { desc = 'Toggle Diff in all windows' })
