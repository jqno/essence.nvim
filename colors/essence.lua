local util = require('essence.util')
local colors = require('essence.colors')
local palette = colors.palette
local badge = colors.badge

util.init()


-- Normal text
util.hi('Normal', { fg = palette.fg_1, bg = palette.NONE }, {
    'Function',
    'Delimiter',
    'Identifier',
    'Keyword',
    'Operator',
    'Special',
    'Type',
    'Variable',
    '@constructor',
    '@punctuation.delimiter',
    '@type',
    '@type.builtin',
    '@variable',
    '@variable.builtin'
})


-- Comments
util.hi('Comment', { fg = palette.green })
util.hi('@comment.documentation', { fg = palette.green, bold = true })
util.hi('SpecialComment', badge.green, {
    '@lsp.typemod.keyword.documentation',
    '@lsp.typemod.parameter.documentation'
})


-- Literals
util.hi('Constant', { fg = palette.yellow }, {
    'String',
    '@string.escape'
})


-- Variables
util.hi('Declaration', { fg = palette.orange }, {
    '@lsp.mod.declaration'
})
util.hi('Mutable', { sp = palette.orange, underline = true })
local augroup = vim.api.nvim_create_augroup('LspTokenUpdateForMutability', { clear = true })
util.create_mutability_autocommand(augroup, '*.java', 'property')
util.create_mutability_autocommand(augroup, '*.js', 'variable')
util.create_mutability_autocommand(augroup, '*.scala', 'parameter', 'property', 'variable')


-- Meta-text
util.hi('Ignore', { fg = palette.dim_0 }, {
    'Conceal',
    'NonText',
    'EndOfBuffer',
    'DiagnosticUnnecessary',
    'LspCodeLens',
    'LspCodeLensSeparator',
    'LspInlayHint'
})


-- Visual and other highlights
util.hi('Visual', badge.blue)
util.hi('LspReferenceText', badge.yellow)
util.hi('LspReferenceRead', badge.orange)
util.hi('LspReferenceWrite', badge.orange)
