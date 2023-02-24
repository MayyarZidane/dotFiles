vim.g.mapleader = " "

local keymap = vim.keymap

--genral keymap.sets
keymap.set("n", "<leader>nh", ":nohl<CR>")

--split windows
keymap.set("n", "<leader>sv", "<C-w>v") --split vertically
keymap.set("n", "<leader>sh", "<C-w>s") --split horizontally
keymap.set("n", "<leader>se", "<C-w>=") --split width equal
keymap.set("n", "<leader>sx", ":close<CR>") --close split 

--tabs
keymap.set("n", "<leader>to", ":tabnew<CR>") --open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") --colse current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") --go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") --go to previous tab

--plugins keymap sets

--vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") --go to previous tab

--nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>") --go to previous tab

--telescope 
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>")
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>")
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")
