return {
	"goolord/alpha-nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		dashboard.section.header.val = {
			[[ ███████╗██╗   ██╗██╗  ██╗ ██████╗ ██╗   ██╗███████╗███████╗ ]],
			[[ ██╔════╝██║   ██║██║ ██╔╝██╔════╝ ██║   ██║██╔════╝██╔════╝ ]],
			[[ ███████╗██║   ██║█████╔╝ ██║  ███╗██║   ██║███████╗███████╗ ]],
			[[ ╚════██║██║   ██║██╔═██╗ ██║   ██║██║   ██║╚════██║╚════██║ ]],
			[[ ███████║╚██████╔╝██║  ██╗╚██████╔╝╚██████╔╝███████║███████║ ]],
			[[ ╚══════╝ ╚═════╝ ╚═╝  ╚═╝ ╚═════╝  ╚═════╝ ╚══════╝╚══════╝ ]],
		}

		dashboard.section.buttons.val = {
			dashboard.button("f", "  파일 찾기", ":Telescope find_files<CR>"),
			dashboard.button("r", "  최근 파일", ":Telescope oldfiles<CR>"),
			dashboard.button("s", "  설정 변경", ":e $MYVIMRC<CR>"),
			dashboard.button("q", "󰅚  종료", ":qa<CR>"),
		}

		alpha.setup(dashboard.opts)
	end,
}
