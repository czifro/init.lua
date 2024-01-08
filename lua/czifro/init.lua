-- if vim.g.vscode then
--   -- VSCode extension
-- else
--   -- ordinary Neovim
-- end

require("czifro.set")
require("czifro.lazy_init")
require("czifro.remap")

local autocmd = vim.api.nvim_create_autocmd

autocmd("filetype", {
  pattern = "netrw",
  group = netrw_mapping_group,
  callback = function()
    local bind = function(lhs, rhs)
      vim.keymap.set("n", lhs, rhs, {remap = true, buffer = true})
    end

    -- edit new file
    bind("f", "%")

    -- rename file
    bind("r", "R")

    -- up a directory
    bind("h", "-^")

    -- open directory or file
    bind("l", "<CR>")
  end
})

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- [[ Rust styling ]]
local rust_indent_group = vim.api.nvim_create_augroup('RustIndent', { clear = true })
vim.api.nvim_create_autocmd('BufEnter', {
  callback = function()
    vim.opt.tabstop = 4
    vim.opt.softtabstop = 4
    vim.opt.shiftwidth = 4
  end,
  group = rust_indent_group,
  pattern = '*.rs',
})

vim.cmd([[
  augroup MarkdownSpell
    autocmd!
    autocmd BufRead,BufEnter *.md set spell spelllang=en_us
  augroup END
]])

function SetMyColorScheme(color)
  color = color or "tokyonight"
  vim.cmd.colorscheme(color)

  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

SetMyColorScheme(vim.g.color)
