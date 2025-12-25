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
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			-- 1. Capabilities 설정

			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			capabilities.textDocument.foldingRange = {
				dynamicRegistration = false,
				lineFoldingOnly = true,
			}

			-- 2. Mason 설정

			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = { "clangd", "lua_ls" },
			})

			-- [중요] 3. Neovim 0.11+ 방식: 설치된 서버를 돌면서 vim.lsp.enable() 호출
			local installed_servers = require("mason-lspconfig").get_installed_servers()

			for _, server_name in ipairs(installed_servers) do
				-- (1) Lua 서버만 특별 대우 (설정 추가)
				if server_name == "lua_ls" then
					vim.lsp.config[server_name] = {
						capabilities = capabilities,
						settings = {
							Lua = {
								diagnostics = { globals = { "vim" } },
							},
						},
					}

				-- (2) Clangd 설정
				elseif server_name == "clangd" then
					vim.lsp.config[server_name] = {
						capabilities = capabilities,
						cmd = { "clangd", "--offset-encoding=utf-16" },
					}
				else
					vim.lsp.config[server_name] = {
						capabilities = capabilities,
					}
				end

				vim.lsp.enable(server_name)
			end
		end,
	},
}
