vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  pattern = { '*.crbasic', '*.cr300', '*.cr8', '*.CRBASIC', '*.CR300', '*.CR8' },
  callback = function()
    vim.bo.filetype = 'crbasic'
  end,
})
