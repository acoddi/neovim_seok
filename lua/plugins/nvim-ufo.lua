return {
    'kevinhwang91/nvim-ufo',
    dependencies = 'kevinhwang91/promise-async',
    config = function()
        -- Neovim 기본 옵션 설정
        vim.o.foldcolumn = '0'
        vim.o.foldlevel = 99
        vim.o.foldlevelstart = 99
        vim.o.foldenable = true

        -- LSP folding 기능 활성화 설정
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities.textDocument.foldingRange = {
            dynamicRegistration = false,
            lineFoldingOnly = true
        }

        -- 설정된 모든 LSP 서버에 capabilities 적용
        local language_servers = vim.lsp.get_clients()
        for _, ls in ipairs(language_servers) do
            require('lspconfig')[ls.name].setup({
                capabilities = capabilities
            })
        end

        -- nvim-ufo 실행
        require('ufo').setup()
    end -- config 함수를 닫는 end
}
