return {
	{
		"williamboman/mason.nvim",
		opts = { ui = { border = "rounded" } },
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			"williamboman/mason.nvim",
			"neovim/nvim-lspconfig", -- 데이터베이스 역할로만 사용
		},
		config = function()
			local mason_lspconfig = require("mason-lspconfig")

			-- 1. Mason 설치 설정
			mason_lspconfig.setup({
				ensure_installed = { "clangd", "lua_ls" },
			})

			-- 2. [미래지향적] lspconfig 프레임워크를 우회하는 네이티브 설정
			-- lua_ls 설정
			vim.lsp.config("lua_ls", {
				-- lspconfig의 기본 설정을 가져오되 setup을 호출하지 않음
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

			-- clangd 설정
			vim.lsp.config("clangd", {
				install = {
					cmd = { "clangd" },
				},
			})

			-- 3. 서버 활성화 (이 명령어가 예전의 .setup()을 대체합니다)
			vim.lsp.enable({ "lua_ls", "clangd" })
		end,
	},
}
