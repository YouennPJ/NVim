local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', function() builtin.find_files { path_display = { "truncate" } } end, {})
vim.keymap.set('n', '<leader>rf', function() builtin.oldfiles { path_display = { "truncate" } } end, {})
vim.keymap.set('n', '<C-p>', function() builtin.git_files { path_display = { "truncate" } } end, {})
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})


local telescope = require("telescope")
local actions = require("telescope.actions")
telescope.setup({
    defaults = {
        file_ignore_patterns = { "public", "nodes_modules", "build", "dist" },
        path_display = { "truncate " },
        mappings = {
            i = {
                ["<C-k>"] = actions.move_selection_previous, -- move to prev result
                ["<C-j>"] = actions.move_selection_next,     -- move to next result
                ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
            },
        },
    },
})
