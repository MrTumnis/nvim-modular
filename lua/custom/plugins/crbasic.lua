return {
  {
    dir = vim.fn.stdpath 'config' .. '/lua/local/crbasic-syntax',
    name = 'crbasic-syntax',
    lazy = false, -- load at startup
    -- priority = 1000, -- before colorschemes if you want
    config = function()
      require('local.crbasic-syntax').setup()
    end,
  },
}
