return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		lazy = false, -- neo-tree will lazily load itself

		keys = {
			{ "<leader>e", "<cmd>Neotree toggle<cr>", desc = "파일 탐색기 열기/닫기" },
			{ "<leader>o", "<cmd>Neotree focus<cr>", desc = "파일 탐색기로 포커스 이동" },
		},
	},
}
