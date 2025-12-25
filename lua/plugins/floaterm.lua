return {
	"voldikss/vim-floaterm",
	keys = {
		-- Ctrl + ` (백틱) 설정
		-- 어떤 터미널에서는 <C-`> 대신 <C-\>로 인식되기도 하니 둘 다 넣으면 확실합니다.
		{ "<C-\\>", "<cmd>FloatermToggle<cr>", desc = "터미널 토글", mode = { "n", "t" } },
		-- 혹은 명시적으로
		-- { "<C-`>", "<cmd>FloatermToggle<cr>", desc = "터미널 토글", mode = { "n", "t" } },
	},
	cmd = { "FloatermNew", "FloatermToggle" },

	config = function()
		vim.g.floaterm_width = 0.8
		vim.g.floaterm_height = 0.8
		vim.g.floaterm_title = "Terminal"
	end,
}
