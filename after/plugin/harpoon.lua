print('Configuring harpoon')
local harpoon = require('harpoon')

harpoon.setup()

vim.keymap.set('n', '<leader>he',
    function() harpoon:list():append() end,
    { desc = 'Edit harpoon file list' }
)
vim.keymap.set('n', '<leader>hm',
    function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
    { desc = 'Toggle harpoon quick menu' }
)

vim.keymap.set('n', '<leader>ha',
    function() harpoon:list():select(1) end,
    { desc = 'Switch to harpoon[1] file' }
)
vim.keymap.set('n', '<leader>hs',
    function() harpoon:list():select(2) end,
    { desc = 'Switch to harpoon[2] file' }
)
vim.keymap.set('n', '<leader>hd',
    function() harpoon:list():select(3) end,
    { desc = 'Switch to harpoon[3] file' }
)
vim.keymap.set('n', '<leader>hf',
    function() harpoon:list():select(4) end,
    { desc = 'Switch to harpoon[4] file' }
)

