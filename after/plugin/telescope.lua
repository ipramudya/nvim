local telescopestatus, telescope = pcall(require, 'telescope')
if (not telescopestatus) then return end

local actions = require('telescope.actions')
local builtin = require('telescope.builtin')
local fb_actions = require "telescope".extensions.file_browser.actions

telescope.load_extension("fzf")
telescope.load_extension("file_browser")

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.git_files, {})
vim.keymap.set('n', '<leader>fs', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

telescope.setup {
    defaults = {
        mappings = {
            n = {
                ["q"] = actions.close,
            }
        }
    },
    extenions = {
        file_browser = {
            theme = 'dropdown',
            hijack_netrw = true,
            mappings = {
                ['i'] = {
                    ['<C-w>'] = function() vim.cmd('normal vbd') end,
                },
                ['n'] = {
                    ["h"] = fb_actions.goto_parent_dir,
                    ["/"] = function()
                        vim.cmd('startinsert')
                    end
                },
            }
        }
    }
}

local function telescope_buffer_dir()
    return vim.fn.expand('%:p:h')
end
vim.keymap.set("n", "fe", function()
    telescope.extensions.file_browser.file_browser({
        path = "%:p:h",
        cwd = telescope_buffer_dir(),
        respect_gitignore = false,
        hidden = true,
        grouped = true,
        -- previewer = false,
        initial_mode = "normal",
        layout_config = { height = 40 }
    })
end)
