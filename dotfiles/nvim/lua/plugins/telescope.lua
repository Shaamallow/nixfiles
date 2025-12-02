return {
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader><space>', builtin.find_files, { desc = 'Search a file' })
      vim.keymap.set('n', '<leader>/', builtin.live_grep, { desc = 'Grep through the files' })
      vim.keymap.set('n', '<leader>bf', builtin.buffers, { desc = 'Search a file in buffers' })
      vim.keymap.set('n', '<leader>cl', builtin.lsp_references, { desc = 'Search LSP refences (Telescope)' })
    end,
  },
  {
    'nvim-telescope/telescope-ui-select.nvim',
    config = function()
      require('telescope').setup({
        extension = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown({}),
          },
        },
      })
      require('telescope').load_extension('ui-select')
    end,
  },
}
