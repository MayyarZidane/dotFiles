local telescope = require("telescope")
local actions = require("telescope.actions")

telescope.setup({
     defaults = {
        -- Default configuration for telescope goes here:
              layout_strategy = 'vertical',
              layout_config = {
                horizontal = {
                  prompt_position = 'top',
                  width = 0.8,
                  height = 0.8,
                  preview_width = 0.5,
                    preview_cutoff = 0,
                },
                vertical = {
                  prompt_position = 'top',
                  width = 0.8,
                  height = 0.8,
                  mirror = true,
                  preview_cutoff = 0,
                },
            },
        -- config_key = value,
         mappings = {
            i = {
                -- map actions.which_key to <C-h> (default: <C-/>)
                -- actions.which_key shows the mappings for your picker,
                -- e.g. git_{create, delete, ...}_branch for the git_branches picker
                ["<C-k>"] = actions.move_selection_previous,  
                ["<C-j>"] = actions.move_selection_next,  
                ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,  
            }
         }
     }
})

telescope.load_extension('fzf')
