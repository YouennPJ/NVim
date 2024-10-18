vim.keymap.set("n", "<leader>cl", 'oconsole.log()<Esc>i', { buffer = true })
vim.keymap.set("n", "<leader>ef", 'ouseEffect(() => {\
}, [])<Esc>ko', { buffer = true })
vim.keymap.set("n", "<leader>ec", 'ouseEffect(() => {\
console.log()\
}, [])<Esc>k$i', { buffer = true })
