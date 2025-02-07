return {
  -- { -- a color highlight plugin, but lazyvim has this function already,
  --   -- example: #ff0000 should be highlighted in red
  --   "norcalli/nvim-colorizer.lua",
  -- },
  --
  {
    -- tokyonight
    "folke/tokyonight.nvim",
    opts = {
      style = "moon",
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },
  -- nvim colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "catppuccin-mocha",
      -- colorscheme = "tokyonight-night",
      colorscheme = "tokyonight-moon",
    },
  },
}
