-- Option A: filetype.add (fast path)
vim.filetype.add {
  extension = { crbasic = 'crbasic', cr300 = 'crbasic', cr8 = 'crbasic' },
  pattern = {
    ['.*%.CRBASIC'] = 'crbasic',
    ['.*%.CR300'] = 'crbasic',
    ['.*%.CR8'] = 'crbasic',
    ['*.CR1'] = 'crbasic',
    ['*.cr1'] = 'crbasic',
    ['*cr1X'] = 'crbasic',
    ['*.CR1X'] = 'crbasic',
    ['*.CR6'] = 'crbasic',
    ['*.cr6'] = 'crbasic',
  },
}

-- Option B: autocmd fallback (keep as-is or remove; both are fine)
vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  pattern = { '*.crbasic', '*.cr300', '*.cr8', '*.CRBASIC', '*.CR300', '*.CR8', '*.CR1', '*.cr1', '*cr1X', '*.CR1X', '*.CR6', '*.cr6' },
  callback = function()
    vim.bo.filetype = 'crbasic'
  end,
})
