return {
	"folke/which-key.nvim",
	event = "VeryLazy", -- 타이핑 중에만 로드되어 부하가 없음
	opts = {
		-- 지연 시간을 줄여서(300ms) 키를 누르면 바로 가이드가 뜨게 함
		delay = 300,
		-- 아이콘 등이 깨지는 게 싫다면 아래처럼 최소화 가능
		icons = {
			breadcrumb = "»",
			separator = "➜",
			group = "+",
		},
	},
}
