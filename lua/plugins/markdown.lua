return {
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
  },
  {
    'iamcco/markdown-preview.nvim',
    cmd = { 'MarkdownPreview', 'MarkdownPreviewStop', 'MarkdownPreviewToggle' },
    ft = { 'markdown' },
    build = 'cd app && npx --yes yarn install',
    keys = {
      { '<leader>mp', '<cmd>MarkdownPreviewToggle<cr>', ft = 'markdown', desc = 'Markdown preview toggle' },
    },
    init = function()
      -- WSL: hand the URL to Windows so the default browser picks it up
      if vim.fn.executable('/mnt/c/Windows/explorer.exe') == 1 then
        vim.g.mkdp_browserfunc = 'OpenMarkdownPreviewInWindows'
        vim.fn.execute([[
          function! OpenMarkdownPreviewInWindows(url)
            call jobstart(['/mnt/c/Windows/explorer.exe', a:url], {'detach': v:true})
          endfunction
        ]])
      end
      vim.g.mkdp_echo_preview_url = 1
      vim.g.mkdp_auto_close = 0
      vim.g.mkdp_theme = 'dark'
    end,
  },
}
