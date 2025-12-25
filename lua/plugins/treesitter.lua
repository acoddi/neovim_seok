return {
  "nvim-treesitter/nvim-treesitter",
  branch = 'master', 
  build = ":TSUpdate",
  config = function() 
      local configs = require("nvim-treesitter.configs")

      configs.setup({
          -- 여기에 c, cpp, rust를 추가했습니다.
          ensure_installed = { 
            "lua", "go", "javascript", "html", "markdown", 
            "c", "cpp", "rust" 
          },
          sync_install = false,
          highlight = { enable = true },
          indent = { enable = true },  
        })
  end
}
