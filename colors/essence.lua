local util = require('essence.util')
local colors = require('essence.colors')
local palette = colors.palette
local badge = colors.badge

util.init()


-- Normal text
util.hi('Normal', { fg = palette.fg_1, bg = palette.NONE }, {
    'Conditional',
    'Delimiter',
    'Exception',
    'Function',
    'Identifier',
    'Keyword',
    'Label',
    'NormalFloat',
    'Operator',
    'PreProc',
    'Repeat',
    'Special',
    'Statement',
    'Type',
    'Variable',
    '@constructor',
    '@function',
    '@function.builtin',
    '@punctuation.delimiter',
    '@punctuation.special',
    '@type',
    '@type.builtin',
    '@variable',
    '@variable.builtin',
    '@lsp.type.enumMember'
})
util.hi('Title', { fg = palette.orange })
util.hi('Underlined', { underline = true })
util.hi('_Link', { fg = palette.blue }, {
    'Tag'
})


-- Comments
util.hi('Comment', { fg = palette.green })
util.hi('@comment.documentation', { fg = palette.green, bold = true }, {
    'SpecialComment',
})
util.hi('@lsp.type.comment', {}) -- needed to properly display treesitter TODO comment highlights; see https://www.reddit.com/r/neovim/comments/14ecf5o/semantic_highlights_messing_with_todo_comments/


-- Literals
util.hi('Constant', { fg = palette.yellow }, {
    'Directory',
    'Boolean',
    'Character',
    'Float',
    'Number',
    'String',
    '@constant',
    '@constant.builtin'
})
util.hi('Special', badge.yellow, {
    'SpecialChar',
    '@string.escape',
    'Debug'
})
util.hi('@string.special.url', '_Link')


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


-- Cursor
util.hi('Cursor', { bg = palette.fg_1 }, {
    'lCursor',
    'CursorIM',
    'TermCursor'
})
util.hi('CursorLine', { bg = palette.dim_0 }, {
    'CursorColumn',
})


-- GUI elements
util.hi('ColorColumn', { bg = palette.fg_0 })
util.hi('SignColumn', { fg = palette.dim_0, bg = palette.NONE })
util.hi('LineNr', { fg = palette.dim_0 })
util.hi('CursorLineNr', { fg = palette.green })
util.hi('FloatBorder', { fg = palette.green, bg = palette.NONE }, {
    'FloatTitle',
    'FloatFooter'
})
util.hi('StatusLine', { fg = palette.bg_2, bg = palette.fg_0 }, {
    'StatusLineTerm',
    'TabLineSel'
})
util.hi('StatusLineNC', { fg = palette.fg_1, bg = palette.bg_2 }, {
    'StatusLineTermNC',
    'WinSeparator',
    'TabLine',
    'TabLineFill'
})


-- Messages
util.hi('ErrorMsg', { fg = palette.red })
util.hi('WarningMsg', { fg = palette.magenta })
util.hi('MsgArea', 'Normal', {
    'ModeMsg',
    'MoreMsg',
    'Question'
})


-- Diagnostics
util.hi('Error', badge.red, {
    '@error',
    'SpellBad',
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
    'SpellCap',
    'SpellLocal',
    'SpellRare',
    'DiagnosticHint',
    'DiagnosticUnderlineHint',
    'DiagnosticFloatingHint',
    'DiagnosticVirtualTextHint'
})
util.hi('DiagnosticSignHint', { fg = palette.fg_0 })
util.hi('_OK', badge.green, {
    'DiagnosticOk'
})


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


-- Markdown
util.hi('@markup', 'Normal', {
    '@markup.link'
})
util.hi('@markup.heading', 'Title')
util.hi('@markup.italic', { italic = true })
util.hi('@markup.link.url', '_Link')
util.hi('@markup.strong', { bold = true })
util.hi('@markup.strikethrough', { strikethrough = true })
util.hi('@markup.raw', badge.white, {
    '@markup.math'
})
util.hi('@markup.underline', 'Underline')
util.hi('@label.markdown', 'Constant')


-- plugin: GitSigns
util.hi('GitSignsAdd', 'Added')
util.hi('GitSignsChange', 'DiffChange')
util.hi('GitSignsDelete', 'Removed')
