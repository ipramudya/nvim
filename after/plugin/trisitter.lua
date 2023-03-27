local status, ts = pcall(require, 'nvim-treesitter.configs')
if (not status) then return end

ts.setup {
    ensure_installed = {
        'lua',
        'vim',
        'help',
        'query',
        'json',
        'javascript',
        'typescript',
        'tsx',
        "html",
        "css",
        "markdown",
        "markdown_inline",
        "svelte",
        "bash",
    },
    autotag = {
        enable = true,
    },
    indent = { enable = true },
    highlight = { enable = true },
    auto_install = true
}
