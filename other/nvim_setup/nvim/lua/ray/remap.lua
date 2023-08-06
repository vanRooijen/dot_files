--vkim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.g.mapleader = " "

--vim.api.nvim_set_keymap('n', '<leader>fw', ':%!clang-format --style=file --assume-filename=$HOME/Documents/scripts/clang_formatter/c.clang-format --fallback-style=None<CR>', {noremap = true, silent = true})

 local map = function(type, key, value)
   vim.api.nvim_set_keymap(type, key, value, {noremap = true, silent = true})
 end
map('n', '<leader>po', ':!xdg-open %<CR>')
map('n', '<leader>pm', ':set formatoptions=tcrwa<CR>') 
map('n', '<leader>pn', ':set formatoptions=tc<CR>')
map('n', '<leader>fw', ':%!clang-format --style=Google<CR>')





