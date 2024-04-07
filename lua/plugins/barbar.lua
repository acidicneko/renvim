local opts = {
    sidebar_filetypes = {
        NvimTree = true,
        undotree = {
            text = 'undotree',
            align = 'center', -- *optionally* specify an alignment (either 'left', 'center', or 'right')
        },
        ['neo-tree'] = {event = 'BufWipeout'},
        Outline = {event = 'BufWinLeave', text = 'symbols-outline', align = 'right'},
    },
}

return opts
