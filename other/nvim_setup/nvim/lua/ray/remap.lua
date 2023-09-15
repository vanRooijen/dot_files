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

-- Move selected line / block of text in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Paste over visual selection, without copying selected text
vim.keymap.set("x", "<leader>p", "\"_dP")

-- Copy to clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- Half page jumping
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
