return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	event = "VeryLazy",

	opts = {
		options = {
			separator_style = "slant",
			show_buffer_close_icons = true,
			show_close_icon = true,
			offsets = {
				{
					filetype = "neo-tree",
					text = "File Explorer",
					highlight = "Directory",
					text_align = "left",
				},
			},
			diagnostics = "nvim_lsp",
		},
	},
	keys = {
		{ "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev buffer, 이전탭으로 이동" },
		{ "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer, 다음탭으로 이동" },
		{ "<leader>bp", "<cmd>BufferLinePick<cr>", desc = "Buffer pick, 탭 선택 이동 키" },
		{ "<leader>bc", "<cmd>BufferLinePickClose<cr>", desc = "Pick buffer to close, 탭 선택 닫기" },
		{ "<leader>bd", "<cmd>bdelete<cr>", desc = "Delete current buffer, 현재 탭 닫기" },
	},
}
