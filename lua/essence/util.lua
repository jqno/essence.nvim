local This = {}

function This.init()
    vim.g.colors_name = 'essence'
    vim.cmd([[hi clear]])
    vim.cmd([[if exists("g:syntax_on") | syntax reset | endif]])
end

function This.hi(group, color, links)
    if type(color) == 'string' then
        vim.api.nvim_set_hl(0, group, { link = color })
    else
        vim.api.nvim_set_hl(0, group, color)
    end
    if links then
        for _, link in ipairs(links) do
            vim.api.nvim_set_hl(0, link, { link = group })
        end
    end
end

function This.create_mutability_autocommand(augroup, pattern, ...)
    local types = { ... }

    vim.api.nvim_create_autocmd('LspTokenUpdate', {
        group = augroup,
        pattern = { pattern },
        callback = function(args)
            local token = args.data.token
            for _, type in ipairs(types) do
                if token.type == type and not token.modifiers.readonly then
                    vim.lsp.semantic_tokens.highlight_token(token, args.buf, args.data.client_id, 'Mutable')
                end
            end
        end
    })
end

return This
