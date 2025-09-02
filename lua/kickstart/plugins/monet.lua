return {
  'fynnfluegge/monet.nvim',
  name = 'monet',
  config = function()
    require('monet').setup {
      transparent_background = false,
      semantic_tokens = true,
      dark_mode = true,
      highlight_overrides = {},
      color_overrides = {
        Normal = { bg = '#1e1e2e', fg = '#cdd6f4' },
        NormalFloat = { bg = '#1e1e2e' },
      },
      styles = {},
      vim.cmd.colorscheme 'monet',
    }
  end,
}
