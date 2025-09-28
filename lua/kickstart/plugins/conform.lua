return {
  { -- Autoformat
    'stevearc/conform.nvim',
    event = 'BufWritePre',
    cmd = { 'ConformInfo' },
    keys = {
      {
        '<leader>f',
        function()
          require('conform').format { async = true, lsp_format = 'fallback' }
        end,
        desc = '[F]ormat buffer',
      },
    },
    opts = {
      notify_on_error = false,
      formatters_by_ft = {
        lua = { 'stylua' },
        ['*'] = {}, -- no global fallback
      },
      -- single, unified format_on_save
      format_on_save = function(bufnr)
        local ft = vim.bo[bufnr].filetype
        if ft == 'crbasic' then
          return false
        end
        local disable = { c = true, cpp = true }
        if disable[ft] then
          return nil
        end
        return { lsp_format = 'fallback', timeout_ms = 500 }
      end,
    },
    config = function(_, opts)
      require('conform').setup(opts)
      -- belt-and-suspenders: also disable autoformat per-buffer on CRBasic
      vim.api.nvim_create_autocmd('FileType', {
        pattern = 'crbasic',
        callback = function()
          vim.b.disable_autoformat = true
        end,
      })
    end,
  },
}
