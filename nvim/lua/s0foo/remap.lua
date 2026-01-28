vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("i", "jk", "<Esc>")

vim.keymap.set("n", "<leader>sh", ":split<CR><C-w>w")
vim.keymap.set("n", "<leader>sv", ":vsplit<CR><C-w>w")

vim.keymap.set('n', '<leader>sc', function()
  vim.cmd('edit ~/.scratch')
end, { desc = "Open scratch file" })
