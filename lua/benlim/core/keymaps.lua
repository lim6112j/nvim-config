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

-- neogit
keymap.set("n", "<leader>gg", ":Neogit<CR>")
