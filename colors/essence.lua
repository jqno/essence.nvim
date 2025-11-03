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
util.hi('@comment.documentation', { fg = palette.green, bold = true }, {
    'SpecialComment',
    '@lsp.typemod.class.documentation',
    '@lsp.typemod.interface.documentation',
    '@lsp.typemod.keyword.documentation',
    '@lsp.typemod.method.documentation',
    '@lsp.typemod.parameter.documentation'
})


-- Literals
util.hi('Constant', { fg = palette.yellow }, {
    'String',
})
util.hi('@string.escape', badge.yellow)
util.hi('@string.special.url', { fg = palette.blue })


-- Variables
util.hi('_Declaration', { fg = palette.orange }, {
    '@lsp.mod.declaration'
})
util.hi('_Mutable', { sp = palette.orange, underline = true })
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
util.hi('Visual', { bg = palette.bg_blue }, {
    'VisualNOS'
})
util.hi('IncSearch', badge.blue, {
    'CurSearch'
})
util.hi('Search', badge.cyan, {
    'MatchParen'
})
util.hi('LspReferenceText', badge.yellow)
util.hi('LspReferenceRead', badge.cyan)
util.hi('LspReferenceWrite', badge.cyan)


-- Diagnostics
util.hi('Error', badge.red, {
    '@error',
    'DiagnosticError',
    'DiagnosticUnderlineError',
    'DiagnosticFloatingError',
    'DiagnosticVirtualTextError',
    'healthError',
    'gitcommitOverflow'
})
util.hi('DiagnosticSignError', { fg = palette.red })
util.hi('_Warning', badge.magenta, {
    'Todo',
    'DiagnosticWarn',
    'DiagnosticUnderlineWarn',
    'DiagnosticSignWarn',
    'DiagnosticVirtualTextWarn',
    'healthWarning'
})
util.hi('DiagnosticSignWarn', { fg = palette.magenta })
util.hi('_Info', { bg = palette.bg_2 }, {
    'DiagnosticInfo',
    'DiagnosticUnderlineInfo',
    'DiagnosticFloatingInfo',
    'DiagnosticVirtualTextInfo',
    'healthSuccess'
})
util.hi('DiagnosticSignHint', { fg = palette.fg_0 })
util.hi('_Hint', { bg = palette.bg_2 }, {
    'DiagnosticHint',
    'DiagnosticUnderlineHint',
    'DiagnosticFloatingHint',
    'DiagnosticVirtualTextHint'
})
util.hi('DiagnosticSignHint', { fg = palette.fg_0 })


-- Diffs
util.hi('DiffText', 'Normal')
util.hi('Added', { fg = palette.green }, {
    'DiffAdd',
    'diffAdded',
    'diffNewFile',
    '@diff.plus'
})
util.hi('Changed', { fg = palette.yellow }, {
    'DiffChange',
    'diffChanged',
    'diffLine',
    '@diff.delta'
})
util.hi('Removed', { fg = palette.red }, {
    'DiffDelete',
    'diffRemoved',
    'diffOldFile',
    '@diff.minus'
})


-- plugin: GitSigns
util.hi('GitSignsAdd', 'Added')
util.hi('GitSignsChange', 'DiffChange')
util.hi('GitSignsDelete', 'Removed')
