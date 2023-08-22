vim.cmd[[
autocmd FileType markdown nmap <buffer><silent> <leader>pi :call mdip#MarkdownClipboardImage()<CR>]]

vim.cmd[[" there are some defaults for image directory and image name, you can change them
" let g:mdip_imgdir = 'assets'
" let g:mdip_imgname = 'image'
]]
