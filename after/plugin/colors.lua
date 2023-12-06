require('tokyonight').setup({
    transparent = true
})
require('kanagawa').setup({
    transparent = true
})
require('onedark').setup({
    transparent = true,
    style = 'dark',
})

function SetMyColorScheme(color)
    color = color or "tokyonight"
    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

SetMyColorScheme('spacegray')
