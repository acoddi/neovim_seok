local mapKey = require("utils.keyMapper").mapKey

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
	callback = function(event)
		local client = vim.lsp.get_client_by_id(event.data.client_id)

		-- 1. Inlay Hints 활성화 (0.10+ 미래지향적 기능)
		-- 코드 옆에 변수 타입 등을 살짝 보여주는 기능입니다.
		if client and client.supports_method("textDocument/inlayHint") then
			vim.lsp.inlay_hint.enable(true, { bufnr = event.buf })
		end

		-- 2. 단축키 설정
		-- utils.keyMapper가 (key, command)를 인자로 받는다고 가정한 설정입니다.
		mapKey("gd", "lua vim.lsp.buf.definition()")
		mapKey("K", "lua vim.lsp.buf.hover()")
		mapKey("<leader>rn", "lua vim.lsp.buf.rename()")
		mapKey("<leader>ca", "lua vim.lsp.buf.code_action()")
	end,
})

-- 3. 진단(Diagnostics) UI 최신 설정 (경고 창을 깔끔하게)
vim.diagnostic.config({
	virtual_text = { prefix = "●" }, -- 줄 끝에 뜨는 경고를 점으로 표시
	severity_sort = true, -- 중요한 에러를 우선순위로 정렬
	float = {
		border = "rounded", -- 경고창 테두리를 둥글게
		source = "always", -- 어떤 LSP에서 보낸 경고인지 표시
	},
})
