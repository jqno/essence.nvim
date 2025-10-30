local util = require('essence.util')
local colors = require('essence.colors')
local palette = colors.palette
local mappings = colors.mappings

util.init()

local highlights = {
    Normal = { fg = '#ffff00', bg = colors.NONE },
    Mutable = { bg = colors.highlighted_background, underline = true, special = colors.info },
    Comment = { fg = '#ff0000' },
    Identifier = { fg = '#00ff00', bg = '#0000ff' },
    Statement = 'Identifier',
}
util.apply(highlights)

local augroup = vim.api.nvim_create_augroup('LspTokenUpdateForMutability', { clear = true })
util.create_mutability_autocommand(augroup, '*.java', 'property')
util.create_mutability_autocommand(augroup, '*.js', 'variable')
util.create_mutability_autocommand(augroup, '*.scala', 'parameter', 'property', 'variable')
