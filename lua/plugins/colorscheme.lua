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
  -- {
  --   "EdenEast/nightfox.nvim",
  --   config = function()
  --     vim.cmd.colorscheme "nightfox"
  --   end,
  -- }

  -- gruvbox
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = function()
      vim.o.background = "dark"
      require("gruvbox").setup({ contrast = "hard" })
      vim.cmd.colorscheme("gruvbox")
    end,
  }
}
