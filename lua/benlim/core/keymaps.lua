vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

-- general keymaps

keymap.set("i", "df", "<ESC>`^")
keymap.set("i", "jk", "<ESC>`^")
keymap.set("n", "<leader>nh", ":nohl<CR>")
keymap.set("n", "x", '"_x') -- delete char not copied

keymap.set("n", "<leader>=", "<C-a>")
keymap.set("n", "<leader>-", "<C-x>")

keymap.set("n", "<leader>wv", "<C-w>v") -- split vertically
keymap.set("n", "<leader>ws", "<C-w>s") -- split horizontally
keymap.set("n", "<leader>we", "<C-w>=") -- split windows equal width
keymap.set("n", "<leader>wq", ":close<CR>") -- close current window

keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tq", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") -- go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") -- go to previous tab

keymap.set("n", "<leader>bb", ":buffers<CR>") -- buffer list
keymap.set("n", "<leader>bn", ":bNext<CR>") -- buffer next
keymap.set("n", "<leader>bp", ":bprevious<CR>") -- buffer previous
keymap.set("n", "<leader>bq", ":bdelete<CR>") -- buffer previous
keymap.set("n", "<leader>bl", ":b <C-z>")
keymap.set("n", "<leader>bf", "<cmd>lua vim.lsp.buf.format()<CR>")
-- plugin kemaps

-- vim maximizer
keymap.set("n", "<leader>wm", ":MaximizerToggle<CR>")

-- nvim tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags
keymap.set("n", "<leader>,", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance

-- neogit
keymap.set("n", "<leader>gg", ":Neogit<CR>")

-- Vimspector
vim.cmd([[
nmap <F9> <cmd>call vimspector#Launch()<cr>
nmap <F5> <cmd>call vimspector#StepOver()<cr>
nmap <F8> <cmd>call vimspector#Reset()<cr>
nmap <F11> <cmd>call vimspector#StepOver()<cr>")
nmap <F12> <cmd>call vimspector#StepOut()<cr>")
nmap <F10> <cmd>call vimspector#StepInto()<cr>")
]])
keymap.set("n", "Db", ":call vimspector#ToggleBreakpoint()<cr>")
keymap.set("n", "Dw", ":call vimspector#AddWatch()<cr>")
keymap.set("n", "De", ":call vimspector#Evaluate()<cr>")
