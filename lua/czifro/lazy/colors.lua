return {
  {
    'xiyaowong/transparent.nvim',
    priority = 900,
    opts = {
      groups = { -- table: default groups
        'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
        'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
        'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
        'SignColumn', 'CursorLineNr', 'EndOfBuffer',
      },
      extra_groups = { "NormalFloat" },
      exclude_groups = {},
    },
    config = function()
      -- require('transparent').setup({
      --   groups = { -- table: default groups
      --     'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
      --     'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
      --     'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
      --     'SignColumn', 'CursorLineNr', 'EndOfBuffer',
      --   },
      --   extra_groups = { "NormalFloat" },
      --   exclude_groups = {},
      -- })
      vim.g.transparent_enabled = true
    end
  },
  {
    -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    opts = {
      space_char_blankline = " ",
      char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
        "IndentBlanklineIndent3",
        "IndentBlanklineIndent4",
        "IndentBlanklineIndent5",
        "IndentBlanklineIndent6",
      },
    },
    config = function()
      vim.opt.termguicolors = true
      vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
      vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
      vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
      vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
      vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
      vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]

      vim.opt.list = true
      vim.opt.listchars:append "space:⋅"
      vim.opt.listchars:append "eol:↴"
    end
  },
  {
    -- Theme inspired by Atom
    'navarasu/onedark.nvim',
    priority = 900,
    opts = {
      transparent = true,
      style = 'dark',
    }
  },
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 900,
    opts = {
      transparent = true,
    }
  },
  {
    'rebelot/kanagawa.nvim',
    opts = {
      transparent = true,
    }
  },
  'czifro/spacegray-mirror.nvim',
}
