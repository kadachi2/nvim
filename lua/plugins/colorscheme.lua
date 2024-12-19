return {

  -- tokyonight
  -- {
  --   "folke/tokyonight.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   opts = {},
  --   config = function()
  --    vim.cmd.colorscheme "tokyonight"
  --   end
  -- }

  -- nightfox
  {
    "EdenEast/nightfox.nvim",
    config = function()
      vim.cmd.colorscheme "nightfox"
    end,
  }
}
