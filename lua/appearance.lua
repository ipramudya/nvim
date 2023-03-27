-- vim.g.material_style = "deep ocean"
--
-- local material_ok, material = pcall(require, 'material')
-- if (not material_ok) then
--     print('Material theme cannot be loaded')
-- end
--
-- material.setup({
--     plugins = {
--         'nvim-tree',
--         'nvim-cmp',
--         'telescope',
--         'which-key'
--     },
--     disable = {
--         background = true
--     },
--     lualine_style = 'stealth',
--     styles = {
--         comments = { italic = true },
--     },
--     custom_highlights = {
--     }
-- })
--
-- local colorscheme_loaded, _ = pcall(vim.cmd, 'colorscheme material')
-- if (not colorscheme_loaded) then
--     print('Material theme cannot be found')
-- end

-- Catpuccinn
local catppuccin_ok, catppuccin = pcall(require, 'catppuccin')
if (not catppuccin_ok) then
    print('Cannot configure colorscheme')
    return
end

catppuccin.setup({
    flavour = 'mocha',
    background = {
        light = 'mocha',
        dark = 'mocha',
    },
    term_colors = false,
    dim_inactive = {
        enabled = false,
        shade = "dark",
        percentage = 0.15,
    },
    transparent_background = true,
    show_end_of_buffer = false,
    styles = {
        comments = { 'italic' },
    },
    integrations = {
        cmp = true,
        telescope = true,
        treesitter = true,
        mason = true,
        lsp_saga = true,
        barbar = true
    }
})

local colorscheme_loaded, _ = pcall(vim.cmd, 'colorscheme catppuccin')
if (not colorscheme_loaded) then
    print('Cannot load colorscheme')
end
