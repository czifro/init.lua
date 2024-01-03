vim.cmd([[
  augroup MarkdownSpell
    autocmd!
    autocmd BufRead,BufEnter *.md set spell spelllang=en_us
  augroup END
]])
