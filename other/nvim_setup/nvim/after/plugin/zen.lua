-- I can set a shortcut to open zen mode in stead of :ZenMode

local map = function(type, key, value)
  vim.api.nvim_set_keymap(type, key, value, {noremap = true, silent = true})
end

map('n', '<leader>pz', ':ZenMode<CR>')

