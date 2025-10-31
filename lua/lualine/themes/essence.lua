local colors = require('essence.colors').palette

return {
    normal = {
        a = { bg = colors.green, fg = colors.bg_1, gui = 'bold' },
        b = { bg = colors.fg_1, fg = colors.bg_1 },
        c = { bg = colors.bg_2, fg = colors.fg_1 },
    },
    insert = {
        a = { bg = colors.fg_1, fg = colors.bg_1, gui = 'bold' },
        b = { bg = colors.fg_1, fg = colors.bg_1 },
        c = { bg = colors.bg_2, fg = colors.fg_1 },
    },
    visual = {
        a = { bg = colors.blue, fg = colors.bg_1, gui = 'bold' },
        b = { bg = colors.fg_1, fg = colors.bg_1 },
        c = { bg = colors.bg_2, fg = colors.fg_1 },
    },
    replace = {
        a = { bg = colors.orange, fg = colors.bg_1, gui = 'bold' },
        b = { bg = colors.fg_1, fg = colors.bg_1 },
        c = { bg = colors.bg_2, fg = colors.fg_1 },
    },
    command = {
        a = { bg = colors.magenta, fg = colors.bg_1, gui = 'bold' },
        b = { bg = colors.fg_1, fg = colors.bg_1 },
        c = { bg = colors.bg_2, fg = colors.fg_1 },
    },
    inactive = {
        a = { bg = colors.fg_1, fg = colors.bg_1, gui = 'bold' },
        b = { bg = colors.fg_1, fg = colors.bg_1 },
        c = { bg = colors.bg_2, fg = colors.fg_1 },
    }
}
