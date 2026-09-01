-- Setup vim
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = "Go to definition" })

-- Automatic toggling between line number modes
vim.cmd("set nu")

-- lsp preview
vim.keymap.set('n', 'gd', function()
  local params = vim.lsp.util.make_position_params()
  vim.lsp.buf_request(0, 'textDocument/definition', params, function(_, result)
    if result == nil or vim.tbl_isempty(result) then return end
    vim.lsp.util.preview_location(result, { border = 'rounded' })
  end)
end, { desc = 'Preview LSP definition' })

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

require("config.lazy")
