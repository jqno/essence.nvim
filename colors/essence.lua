local util = require('essence.util')
local colors = require('essence.colors')
local palette = colors.palette
local badge = colors.badge

util.init()

local highlights = {
    Normal = { fg = palette.fg_1, bg = palette.NONE },
    Identifier = 'Normal',
    Function = 'Normal',
    Keyword = 'Normal',
    Operator = 'Normal',
    Type = 'Normal',
    Variable = 'Normal',
    ['@constructor'] = 'Normal',
    ['@type.builtin'] = 'Normal',
    ['@variable.builtin'] = 'Normal',

    Comment = { fg = palette.green },
    ['@comment.documentation'] = { fg = palette.green, bold = true },
    SpecialComment = badge.green,
    ['@lsp.typemod.keyword.documentation'] = 'SpecialComment',
    ['@lsp.typemod.parameter.documentation'] = 'SpecialComment',

    Constant = { fg = palette.yellow },
    String = 'Constant',
    ['@string.escape'] = badge.yellow,

    Declaration = { fg = palette.orange },
    ['@lsp.mod.declaration'] = 'Declaration',

    Mutable = { underline = true },

    Visual = badge.blue,

    Ignore = { fg = palette.dim_0 },
    Conceal = 'Ignore',
    NonText = 'Ignore',
    EndOfBuffer = 'Ignore',
    DiagnosticUnnecessary = 'Ignore',
    LspCodeLens = 'Ignore',
    LspCodeLensSeparator = 'Ignore',
    LspInlayHint = 'Ignore',

    LspReferenceText = badge.yellow,
    LspReferenceRead = badge.orange,
    LspReferenceWrite = badge.orange,
}
util.apply(highlights)

local augroup = vim.api.nvim_create_augroup('LspTokenUpdateForMutability', { clear = true })
util.create_mutability_autocommand(augroup, '*.java', 'property')
util.create_mutability_autocommand(augroup, '*.js', 'variable')
util.create_mutability_autocommand(augroup, '*.scala', 'parameter', 'property', 'variable')
