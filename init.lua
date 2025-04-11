require("config.lazy")

-- Setup vim
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Automatic toggling between line number modes
vim.cmd("set nu")

local numbertogglegroup = vim.api.nvim_create_augroup("numbertoggle", {})
vim.api.nvim_create_autocmd(
    {"BufEnter", "FocusGained", "InsertLeave"},
    {
      pattern = '*',
      callback = function()
        vim.wo.relativenumber = true
      end,
      group = numbertogglegroup
    })
vim.api.nvim_create_autocmd(
    {"BufLeave", "FocusLost", "InsertEnter"},
    {
      pattern = '*',
      callback = function()
        vim.wo.relativenumber = false
      end,
      group = numbertogglegroup
    })

