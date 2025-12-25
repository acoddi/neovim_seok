return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	opts = {
		options = {
			separator_style = "slant",
			-- 현재 열려있는 버퍼 이름 옆에 닫기 버튼(x) 표시
			show_buffer_close_icons = true,
			show_close_icon = true,
			-- 사이드바(Neo-tree)가 열렸을 때 버퍼라인 위치 조정
			offsets = {
				{
					filetype = "neo-tree",
					text = "File Explorer",
					highlight = "Directory",
					text_align = "left",
				},
			},
			-- LSP 에러/경고 아이콘 표시
			diagnostics = "nvim_lsp",
		},
	},
	keys = {
		{ "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev buffer" },
		{ "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
		{ "<leader>bp", "<cmd>BufferLinePick<cr>", desc = "Buffer pick" },
		{ "<leader>bc", "<cmd>BufferLinePickClose<cr>", desc = "Pick buffer to close" },
	},
}
