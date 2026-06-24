return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      vim.filetype.add({
        pattern = { ['.*/hypr/.*%.conf'] = 'hyprlang' },
      })
      vim.filetype.add({
        pattern = { ['.*/kitty/.*%.conf'] = 'kitty' },
      })
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter-context',
    opts = {
      max_lines = 10,
    },
  },
}
