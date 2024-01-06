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

vim.g.rust_recommend_style = 0

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
