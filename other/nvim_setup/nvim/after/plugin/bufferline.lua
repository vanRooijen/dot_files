
require("bufferline").setup{}

require('bufferline').setup({
  options = {---------------------Main options area-----------------------
    themable = false,-- allows highlight groups to be overriden i.e. sets highlights as default

    offsets = {
               {
                filetype = "NvimTree",
                text = "File Explorer",
                text_align = "center",
                separator = true
               }
              },
   indicator = {
                --icon = '▎', -- this should be omitted if indicator style is not 'icon'
                style = 'none'--'icon' | 'underline' | 'none',
               },
    
    move_wraps_at_ends = false, -- whether or not the move command "wraps" at the first or last position
    -- can also be a table containing 2 custom separators
    -- [focused and unfocused]. eg: { '|', '|' }
    separator_style = "thick",--"slant" | "slope" | "thick" | "thin" | { 'any', 'any' },
    
    diagnostics = "nvim_lsp", -- "nvim_lsp" or "coc"
    max_prefix_length = 8,
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      if context.buffer:current() then
        return ''
      end
      if level:match('error') then
        return ' ' .. vim.g.diagnostic_icons.Error
      elseif level:match('warning') then
        return ' ' .. vim.g.diagnostic_icons.Warning
      end
      return ''
    end,

  },
})


----------------------Here follows the keybindings and shit-------------------

vim.keymap.set('n', '<leader>o', '<CMD>BufferLinePick<CR>')
vim.keymap.set('n', '<C-l>', '<CMD>BufferLineCycleNext<CR>')
vim.keymap.set('n', '<C-h>', '<CMD>BufferLineCyclePrev<CR>')
--vim.keymap.set('n', ']b', '<CMD>BufferLineMoveNext<CR>')
--vim.keymap.set('n', '[b', '<CMD>BufferLineMovePrev<CR>')
--vim.keymap.set('n', 'gs', '<CMD>BufferLineSortByDirectory<CR>')
vim.keymap.set('n', '<leader>pq', '<CMD>BufferLinePickClose<CR>')


 local map = function(type, key, value)
   vim.api.nvim_set_keymap(type, key, value, {noremap = true, silent = true})
 end

 map('n', '<leader>q', ':bdelete<CR>')
 -- nnoremap <silent><leader>1 <cmd>lua require("bufferline").go_to(1, true)<cr>
 -- nnoremap <silent><leader>2 <cmd>lua require("bufferline").go_to(2, true)<cr>
 -- nnoremap <silent><leader>3 <cmd>lua require("bufferline").go_to(3, true)<cr>
 -- nnoremap <silent><leader>4 <cmd>lua require("bufferline").go_to(4, true)<cr>
 -- nnoremap <silent><leader>5 <cmd>lua require("bufferline").go_to(5, true)<cr>
 -- nnoremap <silent><leader>6 <cmd>lua require("bufferline").go_to(6, true)<cr>
 -- nnoremap <silent><leader>7 <cmd>lua require("bufferline").go_to(7, true)<cr>
 -- nnoremap <silent><leader>8 <cmd>lua require("bufferline").go_to(8, true)<cr>
 -- nnoremap <silent><leader>9 <cmd>lua require("bufferline").go_to(9, true)<cr>


--- count is an integer representing total count of errors
--- level is a string "error" | "warning"
--- diagnostics_dict is a dictionary from error level ("error", "warning" or "info")to number of errors for each level.
--- this should return a string
--- Don't get too fancy as this function will be executed a lot
diagnostics_indicator = function(count, level, diagnostics_dict, context)
  local icon = level:match("error") and " " or " "
  return " " .. icon .. count
end
