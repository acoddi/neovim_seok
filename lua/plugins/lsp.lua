return {
	{
		"williamboman/mason.nvim",
		opts = { ui = { border = "rounded" } },
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			"williamboman/mason.nvim",
			"neovim/nvim-lspconfig",
			"hrsh7th/cmp-nvim-lsp", -- [추가] 자동 완성을 위해 이 라이브러리가 필요합니다
		},
		config = function()
			local mason_lspconfig = require("mason-lspconfig")

			-- 1. [추가] 자동 완성을 위한 통신 통로(capabilities) 설정
			-- 이 설정이 들어가야 LSP가 "나 이런 자동 완성 줄 수 있어!"라고 cmp에게 알려줍니다.
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			-- 2. Mason 설치 설정
			mason_lspconfig.setup({
				ensure_installed = { "clangd", "lua_ls" },
			})

			-- 3. [미래지향적] 네이티브 설정에 capabilities 추가
			vim.lsp.config("lua_ls", {
				capabilities = capabilities, -- [추가]
				install = {
					cmd = { "lua-language-server" },
				},
				settings = {
					Lua = {
						diagnostics = { globals = { "vim" } },
						workspace = { checkThirdParty = false },
					},
				},
			})

			vim.lsp.config("clangd", {
				capabilities = capabilities, -- [추가]
				install = {
					cmd = { "clangd" },
				},
			})

			-- 4. 서버 활성화
			vim.lsp.enable({ "lua_ls", "clangd" })
		end,
	},
}
