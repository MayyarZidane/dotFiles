local nvimtree = require("nvim-tree")
 
-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

nvimtree.setup({
        renderer = {
          icons = {
            glyphs = {
              folder = {
                arrow_closed = "",
                arrow_open = "",
              },
            },
           },
        },
    
        actions = {
         open_file = {
            window_picker = {
             enable = false,
            },
          },
        }
})

