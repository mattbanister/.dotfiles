return {
  {
    "rebelot/kanagawa.nvim",
    priority = 1000, -- Load Kanagawa first to avoid missing highlights
    lazy = false, -- Load immediately since it's the colorscheme
    config = function()
      require("kanagawa").setup({
        compile = false, -- enable compiling the colorscheme
        undercurl = true, -- enable undercurls
        transparent = false, -- set to true for transparent backgrounds
        theme = "wave", -- Available themes: "wave", "dragon", "lotus"
      })

      -- Load the colorscheme
      vim.cmd("colorscheme kanagawa-wave")
    end,
  },
}
