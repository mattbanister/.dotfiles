return {
  'sainnhe/gruvbox-material',
  lazy = false,
  config = function()
    vim.g.gruvbox_material_better_performance = 1
    vim.g.gruvbox_material_foreground = "material"
    vim.g.gruvbox_material_background = "soft"
    vim.g.gruvbox_material_ui_contrast = "low"
    vim.g.gruvbox_material_float_style = "dim"
    vim.g.gruvbox_material_enable_italic = 0
    vim.g.gruvbox_material_disable_italic_comment = 1
    vim.g.gruvbox_material_cursor = "red"
    vim.g.gruvbox_material_disable_terminal_colors = 1
    vim.cmd.colorscheme('gruvbox-material')
  end,
 }
