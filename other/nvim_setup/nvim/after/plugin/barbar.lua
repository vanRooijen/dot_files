local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- -- Move to previous/next
map('n', '<C-h>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<C-l>', '<Cmd>BufferNext<CR>', opts)
 
-- -- Pin/unpin buffer
-- map('n', '<A-p>', '<Cmd>BufferPin<CR>', opts)
-- -- Close buffer
map('n', '<leader>q', '<Cmd>BufferClose<CR>', opts)

require'barbar'.setup {

	-- Enable/disable animations
  animation = true,

  -- Enable/disable auto-hiding the tab bar when there is a single buffer
  auto_hide = false,

  -- Enable/disable current/total tabpages indicator (top right corner)
  --tabpages = true,

  -- Enables/disable clickable tabs
  --  - left-click: go to buffer
  --  - middle-click: delete buffer
  clickable = true,

  -- A buffer to this direction will be focused (if it exists) when closing the current buffer.
  -- Valid options are 'left' (the default), 'previous', and 'right'
  focus_on_close = 'left',

  -- Hide inactive buffers and file extensions. Other options are `alternate`, `current`, and `visible`.
--  hide = {extensions = true, inactive = true},

  -- Disable highlighting alternate buffers
  highlight_alternate = false,

  -- Disable highlighting file icons in inactive buffers
  highlight_inactive_file_icons = false,

  -- Enable highlighting visible buffers
  highlight_visible = true,

  icons = {
    -- Configure the base icons on the bufferline.
    -- Valid options to display the buffer index and -number are `true`, 'superscript' and 'subscript'
    buffer_index = false,
    buffer_number = false,
    button = '',
    -- Enables / disables diagnostic symbols

    gitsigns = {
      added = {enabled = true, icon = '+'},
      changed = {enabled = true, icon = '~'},
      deleted = {enabled = true, icon = '-'},
    },
    filetype = {
      -- Sets the icon's highlight group.
      -- If false, will use nvim-web-devicons colors
      custom_colors = false,

      -- Requires `nvim-web-devicons` if `true`
      enabled = true,
    },
    separator = {left = '▎', right = ''},

    -- If true, add an additional separator at the end of the buffer list
    separator_at_end = true,

    -- Configure the icons on the bufferline when modified or pinned.
    -- Supports all the base icon options.
    modified = {button = '●'},
    pinned = {button = '', filename = true},

    -- Use a preconfigured buffer appearance— can be 'default', 'powerline', or 'slanted'
    preset = 'default',

    -- Configure the icons on the bufferline based on the visibility of a buffer.
    -- Supports all the base icon options, plus `modified` and `pinned`.
    alternate = {filetype = {enabled = false}},
    inactive = {button = '×'},
    visible = {modified = {buffer_number = false}},
  },

  -- Sets the maximum padding width with which to surround each tab
  maximum_padding = 2,

  -- Sets the minimum padding width with which to surround each tab
  minimum_padding = 0,

  -- Sets the maximum buffer name length.
  maximum_length = 17,

  -- Sets the minimum buffer name length.
  minimum_length = 12,

 -- Set the filetypes which barbar will offset itself for
  sidebar_filetypes = {
    -- Use the default values: {event = 'BufWinLeave', text = nil}
    NvimTree = {text = 'File Explorer'},
    -- Or, specify the text used for the offset:
    undotree = {text = 'Undotree'},
    -- Or, specify the event which the sidebar executes when leaving:
    -- ['neo-tree'] = {event = 'BufWipeout'},
    -- Or, specify both
    -- Outline = {event = 'BufWinLeave', text = 'symbols-outline'},
  },

  -- Sets the name of unnamed buffers. By default format is "[Buffer X]"
  -- where X is the buffer number. But only a static string is accepted here.
  no_name_title = "Nothing X",
}
