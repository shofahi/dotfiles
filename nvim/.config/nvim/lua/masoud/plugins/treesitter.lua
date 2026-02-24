-- Highlight, edit, and navigate code
return {
	{
		"nvim-treesitter/nvim-treesitter",
		version = false,
		build = ":TSUpdate",
		event = { "BufReadPost", "BufNewFile" },
		main = "nvim-treesitter.configs",
		opts = {
			ensure_installed = {
				"bash",
				"c",
				"cpp",
				"lua",
				"python",
				"vimdoc",
				"vim",
				"markdown",
				"markdown_inline",
				"xml",
				"rust",
				"json",
				"html",
				"javascript",
				"typescript",
				"svelte",
				"css",
				"regex",
				"yaml",
				"haskell",
			},
			auto_install = true,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
			indent = { enable = true },
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<c-space>",
					node_incremental = "<c-space>",
					scope_incremental = false,
					node_decremental = "<bs>",
				},
			},
		},
		init = function() -- Init is used for things to happen Before the plugin loads
			require("nvim-treesitter.install").compilers = { "clang", "gcc" }
		end,
	},

	{
		"windwp/nvim-ts-autotag",
		event = "InsertEnter",
		opts = {},
	},
}
