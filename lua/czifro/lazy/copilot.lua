return {
  'github/copilot.vim',
  config = function()
    vim.keymap.set('n', '<leader>cpe', '<cmd>Copilot enable<cr>')
    vim.keymap.set('n', '<leader>cpd', '<cmd>Copilot disable<cr>')
    vim.cmd [[imap <silent><script><expr> <C-A> copilot#Accept("\<CR>")]]
    vim.g.copilot_no_tab_map = true
  end
}
