return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp", -- LSP 소스
		"hrsh7th/cmp-buffer", -- 현재 버퍼 단어 소스
		"hrsh7th/cmp-path", -- 파일 경로 소스
		"L3MON4D3/LuaSnip", -- 스니펫 엔진
		"saadparwaiz1/cmp_luasnip", -- 스니펫 연결 소스
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")

		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(), -- 수동 완성창 열기
				["<C-e>"] = cmp.mapping.abort(), -- 취소
				["<CR>"] = cmp.mapping.confirm({ select = true }), -- 엔터로 선택
				-- Tab으로 항목 이동
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif luasnip.expand_or_jumpable() then
						luasnip.expand_or_jump()
					else
						fallback()
					end
				end, { "i", "s" }),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" }, -- 1순위: LSP (코드 의미 분석)
				{ name = "luasnip" }, -- 2순위: 스니펫
			}, {
				{ name = "buffer" }, -- 3순위: 현재 파일 내 단어
				{ name = "path" }, -- 4순위: 경로
			}),
		})
	end,
}
