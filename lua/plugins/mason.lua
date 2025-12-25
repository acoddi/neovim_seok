return {
    "mason-org/mason-lspconfig.nvim",
    opts = {
        ensure_installed = {"clangd","rust_analyzer","lua_ls" }
    },
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        -- neovim 0.11 supports lsp natively
        -- "neovim/nvim-lspconfig",
    },
}
