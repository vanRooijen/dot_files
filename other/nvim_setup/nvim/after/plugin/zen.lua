local map = function(type, key, value)
  vim.api.nvim_set_keymap(type, key, value, {noremap = true, silent = true})
end

map('n', '<leader>pz', ':ZenMode<CR>')

