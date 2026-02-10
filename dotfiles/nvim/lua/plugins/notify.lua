return {
  'rcarriga/nvim-notify',
  config = function()
    require('notify').setup({
      enabled = true,
      background_colour = '#000000',
      stages = 'fade',
      timeout = 5000,
      merge_duplicates = true,
    })
  end,
}
