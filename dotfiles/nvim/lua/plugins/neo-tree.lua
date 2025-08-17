return {
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
    },
    opts = {
      sources = { 'filesystem', 'buffers', 'document_symbols' },
      close_if_last_window = true,
      default_component_configs = {
        indent = {
          with_markers = true,
          indent_marker = '│',
          last_indent_marker = '╰',
          with_expanders = true,
        },
      },
      window = {
        mappings = {
          -- Convenient mappings for navigation with j-k
          ['h'] = 'toggle_node',
          ['l'] = 'close_all_subnodes',
        },
      },
      filesystem = {
        use_libuv_file_watcher = true,
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = false,
          hide_by_name = { '.git', 'venv', '.venv', 'node_modules', '__pycache__' },
        },
        follow_current_file = { enabled = true },
      },
    },
    keys = {
      {
        '<leader>e',
        ':Neotree filesystem reveal left toggle<CR>',
        { noremap = true, silent = true, desc = 'Toggle file tree' },
      },
      {
        '<leader>fe',
        ':Neotree document_symbols reveal left toggle<CR>',

        { noremap = true, silent = true, desc = 'Toggle document_symbols tree' },
      },
      {
        '<leader>bf',
        ':Neotree buffers reveal float<CR>',
        { noremap = true, silent = true, desc = 'Toggle buffer map' },
      },
    },
  },
  {
    'stevearc/oil.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    keys = {
      { '<space>-' },
      { '-' },
    },
    config = function()
      require('oil').setup({
        columns = { 'icon' },
        keymaps = {
          ['<C-h>'] = false,
          ['<M-h>'] = 'actions.select_split',
        },
        view_options = {
          show_hidden = true,
        },
      })

      -- Open parent directory in current window
      vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })

      -- Open parent directory in floating window
      vim.keymap.set('n', '<space>-', require('oil').toggle_float)
    end,
  },
}
