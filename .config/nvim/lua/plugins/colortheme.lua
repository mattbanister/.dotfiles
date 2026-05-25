return {
  'rebelot/kanagawa.nvim',
  lazy = false, -- Load during startup
  priority = 1000, -- Load before other plugins
  config = function()
    -- Load the colorscheme here
    vim.cmd 'colorscheme kanagawa-wave'
  end,
}
