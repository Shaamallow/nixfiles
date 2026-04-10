return {
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
      'nvim-telescope/telescope-ui-select.nvim',
    },
    config = function()
      local builtin = require('telescope.builtin')
      local telescope = require('telescope')

      telescope.setup({
        defaults = {
          -- Correct: selection_caret lives here in defaults
          selection_caret = '󰄾 ',
          path_display = { 'smart' },
          layout_strategy = 'horizontal',
          layout_config = {
            horizontal = {
              preview_width = 0.55,
            },
            width = 0.95,
            height = 0.85,
          },
        },
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown({}),
          },
        },
      })

      -- Load extensions
      telescope.load_extension('fzf')
      telescope.load_extension('ui-select')

      -- Mappings
      vim.keymap.set('n', '<leader><space>', builtin.find_files, { desc = 'Search Files' })
      vim.keymap.set('n', '<leader>/', builtin.live_grep, { desc = 'Grep All' })
      vim.keymap.set('n', '<leader>bf', builtin.buffers, { desc = 'Search Open Buffers' })
      vim.keymap.set('n', '<leader>cl', builtin.lsp_references, { desc = 'LSP References' })

      -- CUSTOM: Project Scripts
      vim.keymap.set('n', '<leader>ps', function()
        builtin.find_files({
          prompt_title = '󱆃 Project Scripts',
          cwd = './app/generative_models/train_scripts', -- REMEMBER TO UPDATE THIS
          no_ignore = true,
          hidden = true,
          layout_strategy = 'vertical',
          layout_config = {
            width = 0.9,
            height = 0.9,
            preview_height = 0.4,
          },
        })
      end, { desc = 'Search Bash Scripts' })
    end,
  },
}
