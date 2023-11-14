require('leetbuddy').setup({
    domain = "com",  -- `cn` for chinese leetcode
    language = "java",
    limit = 30, -- Number of problems displayed in telescope
    keys = {
        select = "<CR>",
        reset = "<C-r>",
        easy = "<C-e>",
        medium = "<C-m>",
        hard = "<C-h>",
        accepted = "<C-a>",
        not_started = "<C-y>",
        tried = "<C-t>",
        page_next = "<C-l>",
        page_prev = "<C-h>",
    }
})
vim.keymap.set("n", "<leader>lq", "<cmd>LBQuestions<cr>");--List questions
vim.keymap.set("n", "<leader>ll", "<cmd>LBQuestion<cr>");--View question
vim.keymap.set("n", "<leader>lr", "<cmd>LBReset<cr>");--Reset code
vim.keymap.set("n", "<leader>lt", "<cmd>LBTest<cr>");--Run code
vim.keymap.set("n", "<leader>ls", "<cmd>LBSubmit<cr>");--Submit code
