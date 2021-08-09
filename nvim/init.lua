vim.cmd("filetype indent plugin on")
vim.cmd("syntax on")

vim.cmd("packloadall")

vim.o.hidden = true
vim.g.mapleader = " "

-- Enable relative line numbering
vim.wo.number = true
vim.wo.relativenumber = true

-- Enable highlight search
vim.o.hlsearch = true
vim.o.incsearch = true

-- Make search case sensitive
vim.o.ignorecase = true
vim.o.smartcase = true

-- Enable live substitution (you can know if you get your command wrong before you hit enter!
vim.o.inccommand = 'nosplit' 

-- Enable per file undo post-close
vim.o.undofile = true
vim.o.undodir = vim.fn.expand("~/.config/nvim/undo") 
vim.o.undolevels = 1000
vim.o.undoreload = 10000

-- Enable fzf in vim
local fzf_path = "/usr/local/opt/fzf/plugin/fzf.vim"
vim.api.nvim_command(("source " .. fzf_path))
vim.g.fzf_layout = {up = "~90%", window = {border = "sharp", height = 0.80000000000000004, highlight = "fg", width = 0.80000000000000004, xoffset = 0.5, yoffset = 0.5}}
vimp.nnoremap("<C-p>", ":FZF<CR>")
vimp.nnoremap("<C-]>", ":GFiles<CR>")
vimp.nnoremap("<C-b>", ":Buffers<CR>")

-- TODO: Enable rip grep by installing it and figure out a good ignore file
vimp.nnoremap("<C-f>", ":Rg<CR>")

-- Language completion
local lspconfig = require("lspconfig")
lspconfig.clangd.setup{}
vimp.nnoremap("gd", vim.lsp.buf.definition)
vimp.nnoremap({"override"}, "[e", vim.lsp.diagnostic.goto_prev)
vimp.nnoremap({"override"}, "]e", vim.lsp.diagnostic.goto_next)
vim.o.completeopt = "menuone,noinsert,noselect"
vim.api.nvim_exec("autocmd BufEnter * lua require'completion'.on_attach()", false)

-- Enable side directory structure
vimp.nnoremap("<leader>nn", ":NERDTreeToggle<CR>")

-- Enable syntax highlighting
-- TODO: install solarized theme
vim.cmd("colorscheme solarized")
vim.g.solarized_contrast = "high"

-- Better pane switching
-- TODO: There is a better pane swithching tool that integrates with tmux
-- https://github.com/christoomey/vim-tmux-navigator
vimp.nnoremap("<C-h>", "<C-w>h")
vimp.nnoremap("<C-l>", "<C-w>l")

-- Enable tab switch keybinding
-- Leader mapping in normal mode (leader gets ignored in insert mode)
-- Enable undo tree
-- Use jk for esc
vimp.inoremap("jk", "<ESC>")
vimp.cnoremap("jk", "<ESC>")
vimp.vnoremap("jk", "<ESC>")
vimp.tnoremap("jk", "<C-\\><C-n>")

