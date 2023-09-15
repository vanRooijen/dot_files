--[[

-- place this in one of your configuration file(s)
local hop = require('hop')
local directions = require('hop.hint').HintDirection
vim.keymap.set('', 'f', function()
  hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
end, {remap=true})
vim.keymap.set('', 'F', function()
  hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
end, {remap=true})
vim.keymap.set('', 't', function()
  hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
end, {remap=true})
vim.keymap.set('', 'T', function()
  hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
end, {remap=true})

]]--


vim.cmd('hi HopNextKey guifg=#dc90a4')
vim.cmd('hi HopNextKey1 guifg=#b2be6d')
vim.cmd('hi HopNextKey2 guifg=#909005')

-- Here are some of my own commands

-- Hop Anywhere
 vim.api.nvim_set_keymap('n', '<M-O>', ':HopAnywhere<cr>', { noremap = true, silent = true })
 vim.api.nvim_set_keymap('v', '<M-O>', ':HopAnywhere<cr>', { noremap = true, silent = true })

 --Hop Word
 vim.api.nvim_set_keymap('n', '<M-o>', ':HopWord<cr>', { noremap = true, silent = true })
 vim.api.nvim_set_keymap('v', '<M-o>', ':HopWord<cr>', { noremap = true, silent = true })

-- Hop in Line with Char
 vim.api.nvim_set_keymap('n', '<M-l>', ':HopChar1CurrentLine<cr>', { noremap = true, silent = true })
 vim.api.nvim_set_keymap('v', '<M-l>', ':HopChar1CurrentLine<cr>', { noremap = true, silent = true })
 
--Hop Line
 vim.api.nvim_set_keymap('n', '<M-L>', ':HopLine<cr>', { noremap = true, silent = true })
 vim.api.nvim_set_keymap('v', '<M-L>', ':HopLine<cr>', { noremap = true, silent = true })



