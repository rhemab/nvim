return {
	{
		"navarasu/onedark.nvim",
		name = "onedark",
		config = function()
			require("onedark").setup({
				transparent = true,
			})
			require("onedark").load()
		end,
	},
}
