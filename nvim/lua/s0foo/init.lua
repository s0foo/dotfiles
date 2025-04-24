require("s0foo.lazy")
require("s0foo.remap")
require("s0foo.set")

function edit_inbox()
  vim.cmd("edit " .. "$HOME/notes/inbox.txt")
end

vim.api.nvim_set_keymap('n', '<leader>i', [[<Cmd>lua edit_inbox()<CR>]], { noremap = true, silent = true })
