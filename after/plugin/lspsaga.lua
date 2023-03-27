local saga_ok, saga = pcall(require, 'lspsaga')
if (not saga_ok) then return end

saga.setup({
    -- keybinds for navigation in lspsaga window
    scroll_preview = { scroll_down = "<C-j>", scroll_up = "<C-k>" },
    -- use enter to open file with definition preview
    definition = {
        edit = "<CR>",
    },
    symbol_in_winbar = {
        enable = false,
    },
    ui = {
        kind = require("catppuccin.groups.integrations.lsp_saga").custom_kind(),
    },
    diagnostic = {
        on_insert = false,

    }
})
