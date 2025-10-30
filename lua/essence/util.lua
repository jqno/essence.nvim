local This = {}

function This.init()
    vim.g.colors_name = 'essence'
    vim.cmd([[hi clear]])
    vim.cmd([[if exists("g:syntax_on") | syntax reset | endif]])
    vim.api.nvim_set_hl(0, 'Mutable', {}) -- Define custom highlight
end

function This.apply(highlights)
    local all_groups = vim.fn.getcompletion('', 'highlight')
    all_groups['Normal'] = nil
    for _, group in ipairs(all_groups) do
        local param = highlights[group]
        if param then
            if type(param) == 'string' then
                vim.api.nvim_set_hl(0, group, { link = param })
            else
                vim.api.nvim_set_hl(0, group, param)
            end
        elseif group ~= 'Normal' then
            vim.api.nvim_set_hl(0, group, { link = 'Normal' })
        end
    end
end

function This.create_mutability_autocommand(augroup, pattern, ...)
    local types = { ... }

    vim.api.nvim_create_autocmd('LspTokenUpdate', {
        group = augroup,
        pattern = { pattern },
        callback = function(args)
            if not vim.diagnostic.config().underline then
                return
            end
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
