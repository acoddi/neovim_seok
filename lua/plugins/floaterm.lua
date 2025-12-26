return {
	"voldikss/vim-floaterm",
	keys = {
		{ "<C-\\>", "<cmd>FloatermToggle<cr>", desc = "터미널 토글", mode = { "n", "t" } },
		-- { "<C-`>", "<cmd>FloatermToggle<cr>", desc = "터미널 토글", mode = { "n", "t" } },
	},
	cmd = { "FloatermNew", "FloatermToggle" },

	config = function()
		vim.g.floaterm_width = 0.8
		vim.g.floaterm_height = 0.8
		vim.g.floaterm_title = "Terminal"
	end,
}
