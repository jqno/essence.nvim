local This = {}

This.palette = {
    NONE       = 'NONE',

    bg_0       = '#181818',
    bg_1       = '#252525',
    bg_2       = '#3b3b3b',
    dim_0      = '#777777',
    fg_0       = '#b9b9b9',
    fg_1       = '#dedede',

    red        = '#ff5e56',
    bg_red     = '#5d2d2b',
    green      = '#83c746',
    bg_green   = '#384d26',
    yellow     = '#efc541',
    bg_yellow  = '#584c24',
    blue       = '#4f9cfe',
    bg_blue    = '#28405d',
    magenta    = '#ff81ca',
    bg_magenta = '#5d384d',
    cyan       = '#56d8c9',
    bg_cyan    = '#2b524d',
    orange     = '#fa9153',
    bg_orange  = '#5c3c2a',
    violet     = '#b891f5',
    bg_violet  = '#483c5a'
}

This.badge = {
    red     = { fg = This.palette.red, bg = This.palette.bg_red },
    green   = { fg = This.palette.green, bg = This.palette.bg_green },
    yellow  = { fg = This.palette.yellow, bg = This.palette.bg_yellow },
    blue    = { fg = This.palette.blue, bg = This.palette.bg_blue },
    magenta = { fg = This.palette.magenta, bg = This.palette.bg_magenta },
    cyan    = { fg = This.palette.cyan, bg = This.palette.bg_cyan },
    orange  = { fg = This.palette.orange, bg = This.palette.bg_orange },
    violet  = { fg = This.palette.violet, bg = This.palette.bg_violet },
    white   = { fg = This.palette.fg_1, bg = This.palette.bg_2 }
}

This.mappings = {
    -- Syntax elements
    normal = This.palette.fg_1,

    -- UI elements
    background = This.palette.bg_0,
    ui_dim_background = This.palette.bg_1,
    ui_background = This.palette.bg_2,
    visual = This.palette.dim_0,
    cursor = This.palette.fg_1,
    lens = This.palette.blue,
    ui_text = This.palette.fg_1,
    ui_dim_text = This.palette.dim_0,
    ui_widget = This.palette.green,
    ui_highlight = This.palette.violet,
    ui_extra_highlight = This.palette.cyan,

    -- Status elements
    error = This.palette.red,
    warning = This.palette.magenta,
    info = This.palette.cyan,
    hint = This.palette.fg_1,
    added = This.palette.green,
    changed = This.palette.yellow,
    deleted = This.palette.red
}

return This
