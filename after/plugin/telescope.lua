-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
local ts = require('telescope')

ts.setup {
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
  },
}

-- Enable telescope fzf native, if installed
pcall(ts.load_extension, 'fzf')

-- See `:help telescope.builtin`
local ts_builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pr', ts_builtin.oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', ts_builtin.buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>bb', ts_builtin.buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  ts_builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })
vim.keymap.set('n', '<leader>bs', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  ts_builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[B]uffer [S]earch (fuzzy)' })

vim.keymap.set('n', '<leader>pg', ts_builtin.git_files, { desc = '[P]roject [G]it Files' })
vim.keymap.set('n', '<leader>pf', ts_builtin.find_files, { desc = '[P]roject [F]ile' })
vim.keymap.set('n', '<leader>hs', ts_builtin.help_tags, { desc = '[H]elp [S]earch' })
vim.keymap.set('n', '<leader>rg', ts_builtin.live_grep, { desc = '[R]ip[G]rep Project' })

vim.keymap.set('n', '<leader>sd', ts_builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
-- vim.keymap.set('n', '<leader>sw', ts_builtin.grep_string, { desc = '[S]earch current [W]ord' })

-- Wire up harpoon
pcall(ts.load_extension, 'harpoon')
