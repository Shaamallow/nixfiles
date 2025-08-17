return {
  'rcarriga/nvim-notify',
  config = function()
    require('notify').setup({
      enabled = false,
      stages = 'fade',
      timeout = 5000,
      merge_duplicates = true,
    })
  end,
}
