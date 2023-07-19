
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
