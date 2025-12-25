local mapKey = require("utils.keyMapper").mapKey

return {

	"nvim-telescope/telescope.nvim",
	tag = "0.1.5",
	dependencies = { "nvim-lua/plenary.nvim" },

	cmd = "Telescope",

	keys = {
		{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "파일 찾기" },
		{ "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "전체 검색 (Grep)" },
		{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "열린 버퍼 목록" },
		{ "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "도움말 검색" },
	},

	config = function() end,
}
