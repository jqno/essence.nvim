local util = require('essence.util')
local colors = require('essence.colors')
local palette = colors.palette
local badge = colors.badge

util.init()

local highlights = {
    Normal = { fg = palette.fg_1, bg = palette.NONE },

    Comment = { fg = palette.green },
    ['@comment'] = 'Comment',

    Constant = { fg = palette.yellow },
    ['@boolean'] = 'Constant',
    ['@number'] = 'Constant',
    ['@string'] = 'Constant',
    ['@string.escape'] = badge.yellow,

    Declaration = { fg = palette.violet },
    ['@lsp.mod.declaration'] = 'Declaration',

    Mutable = { underline = true }
}
util.apply(highlights)

local augroup = vim.api.nvim_create_augroup('LspTokenUpdateForMutability', { clear = true })
util.create_mutability_autocommand(augroup, '*.java', 'property')
util.create_mutability_autocommand(augroup, '*.js', 'variable')
util.create_mutability_autocommand(augroup, '*.scala', 'parameter', 'property', 'variable')
