return {
	"kevinhwang91/nvim-ufo",
	dependencies = "kevinhwang91/promise-async",

	keys = {
		{
			"zR",
			function()
				require("ufo").openAllFolds()
			end,
			desc = "모든 접기 펼치기",
		},
		{
			"zM",
			function()
				require("ufo").closeAllFolds()
			end,
			desc = "모두 접기",
		},
		{
			"zr",
			function()
				require("ufo").openFoldsExceptKinds()
			end,
			desc = "접기 단계별 펼치기",
		},
		{
			"zm",
			function()
				require("ufo").closeFoldsWith()
			end,
			desc = "접기 단계별 접기",
		},
	},

	config = function()
		vim.o.foldcolumn = "1"
		vim.o.foldlevel = 99
		vim.o.foldlevelstart = 99
		vim.o.foldenable = true

		-- local capabilities = vim.lsp.protocol.make_client_capabilities()
		-- capabilities.textDocument.foldingRange = {
		-- 	dynamicRegistration = false,
		-- 	lineFoldingOnly = true,
		-- }
		--
		-- local language_servers = vim.lsp.get_clients()
		-- for _, ls in ipairs(language_servers) do
		-- 	require("lspconfig")[ls.name].setup({
		-- 		capabilities = capabilities,
		-- 	})
		-- end

		require("ufo").setup({
			provider_selector = function(bufnr, filetype, buftype)
				return { "lsp", "indent" }
			end,
		})
	end,
}
