vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.guicursor = "n-c-v:block,i-ci-ve:ver25,r-cr-o:block"

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.linebreak = true

vim.opt.tabstop = 4 
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4 
vim.opt.expandtab = true

vim.opt.smartindent = true 

vim.opt.wrap = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 12
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

--vim.opt.colorcolumn = "80"


--vim.opt.formatoptions:append("tcrwa")
vim.opt.textwidth = 100

vim.opt.spell = true
vim.opt.spelllang = "en_us"

vim.api.nvim_exec([[
  augroup autosave_markdown
    autocmd!
    autocmd FileType markdown setlocal updatetime=2000
    autocmd FileType markdown autocmd CursorHoldI,CursorHold * update
  augroup END
]], false)

